#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# prompt the user to run the script at their own risk
PROMPT="\nThis script will change various Sound preferences on your machine,"
PROMPT="$PROMPT which will prevent it from making error noises and sound"
PROMPT="$PROMPT effects.\n\nTo undo the changes after running the script,"
PROMPT="$PROMPT simply run the unset-levels script.\n\nIf"
PROMPT="$PROMPT you run this script, you will be logged out of your"
PROMPT="$PROMPT computer to ensure the changes take effect.\n\n"

printf "$PROMPT"

read -p "Continue? (y/n) | " choice

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
        printf "\nSystem sounds have been turned off. Logging you out now..."

        # log out
        osascript -e 'tell application "System Events" to log out'

        ;;

    [nN]|[nN][oO]* )

        # print a comforting feedback message
        printf "\nOkay. The script will not be run.";;

    * )

        # print a less comforting feedback message
        printf "\nSorry, I didn't get that.";;

esac
