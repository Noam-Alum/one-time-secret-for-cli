# One Time Secret for CLI

## Installation

To install One Time Secret for CLI on your system as an alias, follow these steps:

1. Download the script:
    ```bash
    wget -q https://ncode.codes/OTS
    ```

2. Make the script executable:
    ```bash
    chmod +x "$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one-time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)" &> /dev/null
    ```

3. Add an alias to your `~/.bashrc` file:
    ```bash
    echo "alias OTS=\"$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one-time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)\"" >> ~/.bashrc
    ```

4. Refresh your shell to apply the changes:
    ```bash
    source ~/.bashrc
    ```

### Quick Installation
```bash
wget -q https://ncode.codes/OTS;chmod +x "$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)" &> /dev/null;echo "alias OTS=\"$(for x in $(find / -name OTS -type f 2> /dev/null); do cat $x | grep 'Open a one time secret' >/dev/null 2>&1;if [ "$(echo $?)" == "0" ]; then echo "$x" ;fi; done)\"" >> ~/.bashrc;source ~/.bashrc;clear;echo "Installed OTS successfully"
```
<div class="copy-code-button">
  <button onclick="copyCode()"></button>
</div>

Usage: OTS [OPTION]... [VALUE]...
Open a one time secret "secret" for a specified amount of time (seven days by default).

 -h, --help             displays this help.

 -u, --user             uses a template for creating a secret for a user,
                        while using only OTS -u the template is loaded empty but
                        while using OTS -u [USER] [PASSWORD] the template
                        is loaded with the values in there just for you to save.
