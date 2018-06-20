#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;
my $csv=Text::CSV->new({ sep_char => ",", quote_char => "\"" });

open FILE, $ARGV[0] or die "$!";

while(<FILE>){
    my $line = $_;
    if($csv->parse($line)){
        my @fields = $csv->fields();
        my $url=$fields[0];
        my $user = $fields[1];
        my $pass=$fields[2];
        
        my $title=`curl -k -m 2 -L --retry 0 -u $user:$pass $url 2>/dev/null`;
        if($title=~/<title.*?>\s*(.*?)\s*<\/title/si){
            $title=$1;
        }
        else{
            $title=$url
        };
        if($csv->combine($title,$url,$user,$pass)){
                print $csv->string(), "\n";
        }
        else{
                print "\"$title\",\"$url\",\"$user\",\"$pass\"\n";
        }
    }
}
