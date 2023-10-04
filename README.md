# One Time Secret for cli

To install on system as an alias:

* ```wget -q https://ncode.codes/OTS```
* ```chmod +x "$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)" &> /dev/null```
* ```echo "alias OTS=\"$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)\"" >> ~/.bashrc```
* ```source ~/.bashrc```

### QUICK INSTALL
```bash
wget -q https://ncode.codes/OTS;chmod +x "$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)" &> /dev/null;echo "alias OTS=\"$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)\"" >> ~/.bashrc;source ~/.bashrc;echo "Installed OTS successfully";OTS -h
```
Usage: OTS [OPTION]... [VALUE]...
Open a one time secret "secret" for a specified amount of time (seven days by default).

 -h, --help             displays this help.

 -u, --user             uses a template for creating a secret for a user,
                        while using only OTS -u the template is loaded empty but
                        while using OTS -u [USER] [PASSWORD] the template
                        is loaded with the values in there just for you to save.
