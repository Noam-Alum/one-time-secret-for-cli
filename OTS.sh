#!/bin/bash

### ONE TIME SECRET CLI

## CHECK for dependencies
    dependencies="xsel"
    DISPLAYalert="false"

    # CHECK IF ALERT NEEDED
        for x in $dependencies; do if [ -z "$(dpkg -l | grep $x | tr -d '[[:space:]]')" ]; then DISPLAYalert="true"; fi; done

    # INSALL & NOTIFY   
        if [ "$DISPLAYalert" == "true" ];then
            echo -e "### ! INSTALLING DEPENDENCIES ! ###\n"
            for x in $dependencies; do 
                if [ -z "$(dpkg -l | grep $x | tr -d '[[:space:]]')" ]; then
                    sudo apt-get --assume-yes install $x &> /dev/null
                    echo "installed dependency $x."
                fi
            done
            echo -e "\n### ! INSTALLED DEPENDENCIES ! ###"
        fi


## FUNCTIONS

    # HELP
        function help {
            echo "Usage: OTS [OPTION]... [VALUE]...
    Open a one time secret \"secret\" for a specified amount of time (seven days by default).

    -h 		displays this help.

    -u 		uses a template for creating a secret for a user,
                while using only OTS -u the template is loaded empty but
                while using OTS -u [USER] [PASSWORD] the template
                is loaded with the values in there just for you to save."
        }

        function get_message {
            TMP_file=".tmp_$(openssl rand -base64 12)_OTS_file"
            echo "$VIM_Preset" >> $TMP_file
            vi "+2" "+startinsert" $TMP_file
            SECRETmessage=$(cat $TMP_file | tail -n +2 | head -n -1)
            rm -rf $TMP_file
        }

        function user {
            export USER_name="$1"
            export USER_name="$2"
            VIM_Preset="### - WRITE YOUR SECRET HERE - ###
USER: $1

PASSWORD: $2
### - WRITE YOUR SECRET HERE - ###"

            get_message
        }

## GET OPTIONS
    while getopts ":hu" opt; do
        case "$opt" in
            h)
                help
                exit 0
                ;;
            u)
                user $2 $3
                preset_ussage="user"
                ;;
            \?)
                echo "Invalid option: -$OPTARG"
                help
                exit 1
                ;;
        esac
    done

## START SCRIPT

    # DEFINE DEFULT PRESET
        if [ -z "$preset_ussage" ]; then
            VIM_Preset="### - WRITE YOUR SECRET HERE - ###

### - WRITE YOUR SECRET HERE - ###"
        fi

    # VERIFY SECRET
        while [ -z "$SECRETmessage" ];
        do
            rm -rf .tmp_OTS_file
            get_message
        done

    # GET TTD
        read -p "Lifetime of the secret in days: " TIMEtoREMOVE

    # CHECK FOR EMPTY RESPONS
        if [ -z "$TIMEtoREMOVE" ]; then
            TIMEtoREMOVE="604800"
            echo "Did not get a Lifetime for the secret time set to a week."
        fi

    # send an API request
        secretLINK=$(echo "https://onetimesecret.com/secret/$(curl -s -d "secret=$SECRETmessage&ttl=$TIMEtoREMOVE" -u 'nnoam.alum@gmail.com:822fa6c154d04b8f9660b6269b2d25b639775bf7' https://onetimesecret.com/api/v1/share | awk -F '"secret_key":"' {'print $2'} | awk -F '"' {'print $1'})")
        echo "-
    Link (copied to clipboard): $secretLINK
-"
        echo "$secretLINK" | xsel -b
