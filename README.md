This is a helper script to enrich passwords exported via https://github.com/unode/firefox_decrypt.git and add the title of the page as well.
Requires curl and Text::CSV

Installation:
```
$ sudo apt-get install curl libtext-csv-perl
$ wget -O /usr/local/bin/enrichFirefox.pl https://raw.githubusercontent.com/mad-ady/enrichFirefoxPasswords/master/enrichFirefox.pl
$ sudo chmod a+x /usr/local/bin/enrichFirefox.pl
```

Export your passwords as CSV into /dev/shm/firefox-passwords.csv:
```
$ git clone https://github.com/unode/firefox_decrypt.git
$ cd firefox_decrypt
$ ./firefox_decrypt.py -f csv -d , > /dev/shm/firefox-passwords.csv
```
Enrich passwords and save them to /dev/shm/firefox-passwords-enriched.csv:
```
$ /usr/local/bin/enrichFirefox.pl /dev/shm/firefox-passwords.csv | tee /dev/shm/firefox-passwords-enriched.csv
```
