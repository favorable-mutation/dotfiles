# put here by thefuck
eval $(thefuck --alias)

# activate jenv automatically
eval "$(jenv init -)"

# begin oh-my-zsh config ------------------------------------------------ #

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="common"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
# export LC_COLLATE="en_US.UTF-8"
# export LC_CTYPE="en_US.UTF-8"
# export LC_MESSAGES="en_US.UTF-8"
# export LC_MONETARY="en_US.UTF-8"
# export LC_NUMERIC="en_US.UTF-8"
# export LC_TIME="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# end oh-my-zsh config ------------------------------------------------ #

# explicitly set $PATH every time zsh is opened, including brew bin and sbin paths
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Racket v7.0/"

# make vim the default shell editor
export EDITOR="/usr/local/bin/vim"

# and make vim the default shell pager
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# TODO
# make vim only autocomplete with human-readable files
# setopt extendedglob
# compctl -g "*.md" vim

# allow easy reload of zsh
alias rezsh="source ~/.zshrc"

# allow easy cd'ing to the root of the current git project
alias root='cd "`git rev-parse --show-toplevel`"'

# allow easy editing of the .gitignore file for this git project
alias gitig='vim "`git rev-parse --show-toplevel`"/.gitignore'

# make vi target the version of vim installed by homebrew
alias vi="vim"

# stop thinking about python 2
alias python="python3"

# stop thinking about pip 2
alias pip="pip3"

# allow easy creation of a python environment in the current  directory
py-env-init() {
    virtualenv .
    source ./bin/activate
}

# allow easy activation when in a python environment directory
alias py-env="source ./bin/activate"

# allow easy configuration of zsh
alias zshrc="${EDITOR:-vi} ~/.zshrc"

# allow easy configuration of zsh for personal aliases
alias zshrc-p="${EDITOR:-vi} ~/.zsh_personal"

# allow easy configuration of vim 
alias vimrc="${EDITOR:-vi} ~/.vimrc"

# allow easy configuration of xpdf
alias xpdfrc="${EDITOR:-vi} ~/.xpdfrc"

# allow easy backgrounded serving of mongodb
alias mongo.serve="mongod --config /usr/local/etc/mongod.conf &"

# make git-a a shell command for easier version control
git-a() {
    git add --interactive
    git commit
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

# add commands and aliases that contain personal info or only work with my
# mounted filesystem
. ~/.zsh_personal

# keep brew updated by running updates on shell init
brew update &