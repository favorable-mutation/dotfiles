#!/usr/bin/env bash

# SP > General > Dark Mode
defaults write -globalDomain AppleInterfaceStyle -string Dark

# SP > General > Accent Color
defaults write -globalDomain AppleAccentColor -integer -1
defaults write -globalDomain AppleAquaColorVariant -integer 6

# SP > General > Highlight Color
defaults write -globalDomain AppleHighlightColor -string "0.447059 0.905882 0.525490 Other"
