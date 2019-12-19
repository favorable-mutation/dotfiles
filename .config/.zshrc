# stock oh-my-zsh and plugin config ---------------------------- #

# automatically put here by thefuck
eval $(thefuck --alias)

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG="en_US.UTF-8"


# custom config ------------------------------------------------ #

# go is needy
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"

# explicitly set $PATH every time zsh is opened, including brew bin and sbin paths
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$GOPATH/bin:$GOROOT/bin:"

# make neovim the default shell editor
export EDITOR="/usr/local/bin/nvim"

# and make less the default shell pager
export PAGER=less

# be a zsh n00b and manually set zsh keymode to vim
bindkey -v

# set time for mode switch in zsh to 0.1s
export KEYTIMEOUT=1

# easy configuration of zsh
alias zshrc="${EDITOR:-vi} ~/etc/.config/.zshrc"

# easy configuration of vim
vimrc() {
  cd ~/.config/nvim
  ${EDITOR:-vi} ./general.vim
  cd -
}

# easy configuration of xpdf
alias xpdfrc="${EDITOR:-vi} ~/etc/.config/.xpdfrc"

# get out of the way, old-timer
alias vi="nvim "
alias vim="nvim "

# stop thinking about python 2
alias python="python3"

# stop thinking about pip 2
alias pip="pip3"

# easy reload of zsh
alias rezsh="source ~/.zshrc"

# don't guess branch names that are just on remote
# for autocompletion of `git checkout`
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

# easy cd'ing to the root of the current git project
alias root='cd "`git rev-parse --show-toplevel`"'

# easy editing of the .gitignore file for this git project
gitig() {
  "${EDITOR:-vi} `git rev-parse --show-toplevel`/.gitignore"
}

# show files accidentally written during git merge for downstream use
# e.g. `mergestat | cleanup`
alias mergestat='find "`git rev-parse --show-toplevel`" | grep "\.orig$"'

# remove files piped into xargs
alias cleanup="xargs rm"

# quick interface to interactive git add
alias gadd='git add -i'

# sometimes you have to move fast
alias gasp="git add . && git commit --amend && git push -u origin HEAD"

# easy python linting with typical docker-compose setup
alias lint='docker-compose run test bash -c "black . && isort -rc . && flake8"'

# easier docker
alias dr="docker "

# easier docker-compose
alias dc="docker-compose "

# easily create a python environment in the current directory
py-env-init() {
    virtualenv .
    source ./bin/activate
}

# easy activation when in a python environment directory
alias py-env="source ./bin/activate"

# easy backgrounded serving of mongodb
alias mongo.serve="mongod --auth --config /usr/local/etc/mongod.conf &"

# restart chunkwm and skhd
rewm() {
    brew services restart yabai
    brew services restart skhd
}

# shortcut for making pdfs from mds using pandoc
knit() {
    input="$1"
    suffix="md"
    swap="pdf"
    output="${input/$suffix/$swap}"

    pandoc $input -o $output -t html
}

# make it only autocomplete with md files
compctl -g "*.md" knit

# shortcut for making pdfs from wraps using wrap
gwrap() {
    wrap pdf "$1" --font "$WRAP_FONT"
}

# make it only autocomplete with wrap files
compctl -g "*.wrap" gwrap

# make dot-file a shell command for easier dotfile repo inclusion of config files that live in ~/
dot-file() {
    mv "$1" ~/etc/.config/
    ln -s ~/etc/.config/$1 "$1"
}

# commit and push to dotfiles repo
dot() {
    cd ~/etc
    git add .
    git commit
    git pull origin master
    git push origin master
    cd -
}

# run brew update, upgrade, and cask upgrade
update() {
    brew update
    brew upgrade
    brew cask upgrade
}

# keep brew updated by running updates on shell init
update > ~/.brew.log 2>&1 &
