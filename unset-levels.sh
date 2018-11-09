#!/bin/bash

# toggle on system UI noises
defaults write -globalDomain "com.apple.sound.uiaudio.enabled" -integer 1

# toggle on system error noises
defaults write -globalDomain "com.apple.sound.beep.feedback" -integer 1

# set system error noise volume to max 
defaults write -globalDomain "com.apple.sound.beep.volume" -float 10

# print a comforting feedback message
echo "System sounds have been turned on"
