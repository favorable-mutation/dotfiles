#!/usr/bin/env bash

# TODO add install and setup for pecan, change color
# TODO chunkwm and skhd cert signing step
# TODO abstract logging and printing to functions

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update
printf "\n\n### brew update ###\n\n" > ~/brew.log > ~/brew.err
brew update 1>>~/brew.log 2>>~/brew.err

# Upgrade
printf "\n\n### brew upgrade ###\n\n" >> ~/brew.log >> ~/brew.err
brew upgrade 1>>~/brew.log 2>>~/brew.err

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Spaceship theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install window manager components
printf "\n\n### skhd & yabai ###\n\n" >> ~/brew.log >> ~/brew.err
brew install skhd 1>>~/brew.log 2>>~/brew.err
brew services start skhd
brew tap koekeishiya/formulae
brew install --HEAD chunkwm 1>>~/brew.log 2>>~/brew.err
sudo chunkwm --uninstall-sa
pkill Dock
sudo chunkwm --install-sa
brew services start chunkwm

# languages
printf "\n\n### languages ###\n\n" >> ~/brew.log >> ~/brew.err
brew install python 1>>~/brew.log 2>>~/brew.err
brew install r 1>>~/brew.log 2>>~/brew.err

# cli utilities
printf "\n\n### cli ###\n\n" >> ~/brew.log >> ~/brew.err
brew install bash 1>>~/brew.log 2>>~/brew.err
brew install findutils 1>>~/brew.log 2>>~/brew.err
brew install ffmpeg 1>>~/brew.log 2>>~/brew.err
brew install git 1>>~/brew.log 2>>~/brew.err
brew install grip 1>>~/brew.log 2>>~/brew.err
brew install jq 1>>~/brew.log 2>>~/brew.err
brew install macvim 1>>~/brew.log 2>>~/brew.err
brew install pandoc 1>>~/brew.log 2>>~/brew.err
brew install thefuck 1>>~/brew.log 2>>~/brew.err
brew install tidy-html5 1>>~/brew.log 2>>~/brew.err
brew install tree 1>>~/brew.log 2>>~/brew.err
brew install watch 1>>~/brew.log 2>>~/brew.err
brew install wget 1>>~/brew.log 2>>~/brew.err
brew install xpdf 1>>~/brew.log 2>>~/brew.err
brew install youtube-dl 1>>~/brew.log 2>>~/brew.err
brew install zsh 1>>~/brew.log 2>>~/brew.err

# fonts for xpdf
brew install ghostscript 1>>~/brew.log 2>>~/brew.err
brew link --overwrite ghostscript 1>>~/brew.log 2>>~/brew.err

# fun non-utilities/essentials
printf "\n\n### misc ###\n\n" >> ~/brew.log >> ~/brew.err
brew install asciiquarium 1>>~/brew.log 2>>~/brew.err
brew install cmatrix 1>>~/brew.log 2>>~/brew.err
brew install cowsay 1>>~/brew.log 2>>~/brew.err
brew install fortune 1>>~/brew.log 2>>~/brew.err
brew install neofetch 1>>~/brew.log 2>>~/brew.err
brew install pipes-sh 1>>~/brew.log 2>>~/brew.err

# casks
printf "\n\n### casks ###\n\n" >> ~/brew.log >> ~/brew.err
brew cask install calibre 1>>~/brew.log 2>>~/brew.err
brew cask install discord 1>>~/brew.log 2>>~/brew.err
brew cask install emacs 1>>~/brew.log 2>>~/brew.err
brew cask install firefox-nightly 1>>~/brew.log 2>>~/brew.err
brew cask install font-hack 1>>~/brew.log 2>>~/brew.err
brew cask install franz 1>>~/brew.log 2>>~/brew.err
brew cask install kitty 1>>~/brew.log 2>>~/brew.err
brew cask install qlab 1>>~/brew.log 2>>~/brew.err
brew cask install rstudio 1>>~/brew.log 2>>~/brew.err
brew cask install slack 1>>~/brew.log 2>>~/brew.err
brew cask install spotify 1>>~/brew.log 2>>~/brew.err
brew cask install ubersicht 1>>~/brew.log 2>>~/brew.err
brew cask install zotero 1>>~/brew.log 2>>~/brew.err

# check in on any problems with installation
printf "\n\n### doctor ###\n\n" >> ~/brew.log >> ~/brew.err
brew doctor 1>>~/brew.log 2>>~/brew.err

# get rid of old versions
printf "\n\n### cleanup ###\n\n" >> ~/brew.log >> ~/brew.err
brew cleanup 1>>~/brew.log 2>>~/brew.err
