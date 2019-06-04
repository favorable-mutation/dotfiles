#!/usr/bin/env bash

# TODO add install and setup for pecan, change color

# update
printf "\n\n### brew update ###\n\n" > ~/brew.log > ~/brew.err
brew update 1>>~/brew.log 2>>~/brew.err

# upgrade
printf "\n\n### brew upgrade ###\n\n" >> ~/brew.log >> ~/brew.err
brew upgrade 1>>~/brew.log 2>>~/brew.err

# install window manager components
# fix switching workspaces as per issue #571 on chunkwm github
printf "\n\n### chunkwm ###\n\n" >> ~/brew.log >> ~/brew.err
brew tap koekeishiya/formulae
brew install --HEAD chunkwm 1>>~/brew.log 2>>~/brew.err
sudo chunkwm --uninstall-sa
pkill Dock
sudo chunkwm --install-sa
brew services start chunkwm

# install skhd
brew install skhd 1>>~/brew.log 2>>~/brew.err
brew services start skhd

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

# TODO
# irssi
# mongodb
# mutt
# mysql

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
