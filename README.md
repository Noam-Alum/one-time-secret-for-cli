# One Time Secret for cli

To install on system as an alias:
* ```chmod +x $(for x in $(find / -name OTS -type f); do cat $x | grep 'Open a one time secret;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)```
* ```echo "alias OTS=\"$(for x in $(find / -name OTS -type f); do cat $x | grep 'Open a one time secret;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)\"" >> ~/.bashrc```
* ```source ~/.bashrc```

Usage: OTS [OPTION]... [VALUE]...
Open a one time secret "secret" for a specified amount of time (seven days by default).

 -h, --help             displays this help.

 -u, --user             uses a template for creating a secret for a user,
                        while using only OTS -u the template is loaded empty but
                        while using OTS -u [USER] [PASSWORD] the template
                        is loaded with the values in there just for you to save.
