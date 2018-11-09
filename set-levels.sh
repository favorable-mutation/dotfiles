#!/bin/bash

# set the system volume to about 1/3 max
osascript -e "set Volume 2.2"

# toggle off system UI noises
defaults write -globalDomain "com.apple.sound.uiaudio.enabled" -integer 0

# toggle off system error noises
defaults write -globalDomain "com.apple.sound.beep.feedback" -integer 0

# set system error noise volume to min 
defaults write -globalDomain "com.apple.sound.beep.volume" -float 0

# print a comforting feedback message
echo "System sounds have been turned off"
