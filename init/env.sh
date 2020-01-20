#!/usr/bin/env zsh

# TODO move config files to separate repo to clone via script
# TODO setup GitHub SSH key thru API?

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
# if ! [ -s ~/.gitconfig ]
# then
#     printf "excludesfile = ~/.gitignore_global\nautocrlf = input" >> ~/.gitconfig
# fi

# set user's shell to zsh
# printf "Please enter your sudo password to set your shell to zsh\n"
# sudo chsh -s /usr/local/bin/zsh `whoami`

# reload shell with config
source ~/.zshrc
