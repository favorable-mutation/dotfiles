#!/bin/bash

# prompt the user to run the script at their own risk
read -p "If you run this script, all open applications will quit to force recognition of the new settings. Continue? (y/n) " choice

# based on the user's choice, run the script or don't
case "$choice" in
    
   [yY]|[yY][eE]*[sS]* )

        # set the system volume to about 1/3 max
        osascript -e "set Volume 2.2"

        # toggle off system UI noises
        defaults write -globalDomain "com.apple.sound.uiaudio.enabled" -integer 0

        # toggle off system error noises
        defaults write -globalDomain "com.apple.sound.beep.feedback" -integer 0

        # set system error noise volume to min 
        defaults write -globalDomain "com.apple.sound.beep.volume" -float 0

        # print a comforting feedback message
        echo "System sounds have been turned off."

        ;;

    [nN]|[nN][oO]* )

        # print a comforting feedback message
        echo "Okay. The script will not be run.";;

    * )

        # print a less comforting feedback message
        echo "Sorry, I didn't get that.";;

esac
