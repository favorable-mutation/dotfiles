#!/usr/bin/env bash

# link all of the home dir config files in from the ~/etc/.config folder
for file in `ls -a ~/etc/.config/ | awk '/^\.[a-z]+/'`
do
	rm ~/$file
	ln -s "/Users/$USER/etc/.config/$file" ~/ 
done

# make chunkwmrc executable
chmod u+x ~/.chunkwmrc

# link the kitty conf file to its special location
rm ~/.config/kitty/kitty.conf
ln -s ~/etc/.config/kitty.conf ~/.config/kitty/

# setup global gitignore
printf "excludesfile = ~/.gitignore_global\nautocrlf = input" >> ~/.gitconfig

# reload shell with config
source ~/.zshrc
