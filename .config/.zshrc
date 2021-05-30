# stock oh-my-zsh and plugin config ---------------------------- #

# automatically put here by thefuck
# eval $(thefuck --alias)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
SPACESHIP_GIT_SYMBOL="🌱 "
SPACESHIP_DOCKER_CONTEXT_PREFIX=""
SPACESHIP_DOCKER_CONTEXT_SUFFIX=""
# SPACESHIP_VI_MODE_INSERT="[📝]"
# SPACESHIP_VI_MODE_NORMAL="[🔒]"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG="en_US.UTF-8"


# custom config ------------------------------------------------ #

# ghcup-env
[ -f "/home/griffin/.ghcup/env" ] && source "/home/griffin/.ghcup/env"

function td {
  mkdir -p $1
  cd $1
}

# look for executables in sbin paths
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin

# X11 executables, in case you want to see anything
export PATH=$PATH:/opt/X11/bin

# find that IntelliJ executable
export PATH=$PATH:/usr/local/bin/idea/bin

# qmk is in a weird spot
export PATH=$PATH:$HOME/.local/bin

# let's gooooooooo
export PATH=$PATH:$HOME/go/bin
export GO111MODULE=on

# make neovim the default shell editor
export EDITOR="/usr/bin/nvim"

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
  ${EDITOR:-vi} ./init.vim
  cd -
}

# easy configuration of xpdf
alias xpdfrc="${EDITOR:-vi} ~/etc/.config/.xpdfrc"

# get out of the way, old-timer
alias v="vi "
alias vi="vim "
alias vim="nvim "
alias vimdiff="nvim -d "

# stop thinking about python 2
alias python="python3"

# stop thinking about pip 2
alias pip="pip3"

# easy reload of zsh
alias rezsh="source ~/.zshrc"

# don't guess branch names that are just on remote
# for autocompletion of `git checkout`
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

# radix stuff
export MONOREPO="$HOME/radix/monorepo/"
export RADIX_MONOREPO_DIR="$MONOREPO"
export HOSTNAME="localhost"
export INTERNAL_HOSTNAME="localhost"
export INTERNAL_PORT=8080
export TCP_AKKA_PORT=8080
export PATH=$PATH:/opt/radix/timberland/exec

# neovim can't find its own config
export XDG_CONFIG_HOME="$HOME/.config"

# easy cd'ing to the root of the current git project
alias root='cd "`git rev-parse --show-toplevel`"'

# easy editing of the .gitignore file for this git project
alias gitig='${EDITOR:-vi} "`git rev-parse --show-toplevel`/.gitignore"'

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

# bazel dependency regeneration
alias mkbazeldeps="bazel run //:parse generate -- --repo-root $HOME/radix/monorepo --sha-file 3rdparty/workspace.bzl --deps dependencies.yaml"

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

# try out different themes for kitty
chtheme() {
    KITTY_PATH=~/.config/kitty
    THEME_PATH=$KITTY_PATH/theme.conf
    THEMES_PATH=$KITTY_PATH/kitty-themes/themes
    ln -s $THEMES_PATH/$1.conf $THEME_PATH
}

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

# configure and spin up a vault instance that will accept requests from any
# origin and allow username/password authentication
vault-dev() {
    sudo nginx -s quit || true
    sudo nginx -c ~/nginx_custom.conf
    export VAULT_ADDR="http://localhost:8300"
    vault server -dev -dev-root-token-id="root" -dev-listen-address="localhost:8300" &
    sleep 4
    vault auth enable userpass
    vault auth enable okta
    vault write auth/userpass/users/local \
        password=test \
        policies=default
    vault write auth/okta/config \
        base_url="okta.com" \
        org_name="dev-8865195" \
        api_token="00hMAcEIxf1WgTM5FVHmmp19CBk2S_2j8o3b0Izynt"
    curl -k -X POST \
        "https://localhost:8200/v1/sys/config/cors" \
        -H  "accept: */*" -H  "Content-Type: application/json" \
        -H  "X-Vault-Token: root" \
        -d "{\"allowed_origins\":[\"*\"],\"enable\":true}"
}

RUN() {
  cd $MONOREPO
  sudo ./scripts/runtime_util.sh --nuke
  sudo rm -rf /opt/radix
  sudo apt remove radix-timberland
  bazel build --noremote_upload_local_results //...
  bazel query 'attr(generator_function, dockerize_scala, //...)' | egrep ".*docker\$" | xargs -n 1 -I {} bazel run --noremote_upload_local_results {} -- --norun
  sudo apt install ./bazel-bin/timberland/jvm/timberland-deb.deb
  timberland disable apprise
  timberland disable elasticsearch
  timberland disable remote_images
  timberland disable yugabyte
  timberland enable nginx
  timberland enable runtime
  timberland enable web-interface
  timberland enable okta-auth
  timberland enable prism
  timberland start
  # curl -k \
  #   -H  "X-Vault-Token: $(cat /opt/radix/timberland/.vault-token)" \
  #   "https://localhost:8200/v1/auth/token/lookup-self" \
  # curl -k -X POST \
  #   "https://localhost:8200/v1/sys/config/cors" \
  #   -H  "accept: */*" -H  "Content-Type: application/json" \
  #   -H  "X-Vault-Token: $(cat /opt/radix/timberland/.vault-token)" \
  #   -d "{\"allowed_origins\":[\"https://localhost:1337\"],\"enable\":true}"
  cd $MONOREPO/interface/typescript
  echo "HTTPS=true\nPORT=1337\nREACT_APP_API_PORT=$(gql-pls)" > .env
  yarn start
}

alias dev="cd $MONOREPO/interface/scalajs && rm -r target && vault-dev && sbt clean cleanFiles dev"

# run apt update, upgrade
# alias update="sudo apt-get update && sudo apt-get upgrade"

# IntelliJ installs faster without compression
alias intj-upgrade="PKGEXT='.pkg.tar' yay -S intellij-idea-ultimate-edition"

alias bazbuild="bazel build --noremote_upload_local_results --sandbox_debug '//...'"

alias gql="bazel run --noremote_upload_local_results //utils/api/jvm:api-uservice-docker -- --norun && gql-reload && sleep 10 && gql-pls"

alias gql-pls="sudo /opt/radix/timberland/nomad/nomad job status -address=https://nomad.service.consul:4646 -tls-skip-verify -token=\$(sudo cat /opt/radix/timberland/.acl-token) | grep web-interface | awk '{print \$1}' | xargs sudo /opt/radix/timberland/nomad/nomad job status -address=https://nomad.service.consul:4646 -tls-skip-verify -token=\$(sudo cat /opt/radix/timberland/.acl-token) | grep running | grep interface | awk '{print \$1}' | xargs sudo /opt/radix/timberland/nomad/nomad alloc status -address=https://nomad.service.consul:4646 -tls-skip-verify -token=\$(sudo cat /opt/radix/timberland/.acl-token) | grep graphql | awk '{print \$3}' | sed 's/:/\n/g' | head -n 2 | tail -n 1" # | xargs -I {} echo \"{}\""

alias gql-reload="sudo /opt/radix/timberland/nomad/nomad job status -address=https://nomad.service.consul:4646 -tls-skip-verify -token=\$(sudo cat /opt/radix/timberland/.acl-token) | grep web-interface | awk '{print \$1}' | xargs sudo /opt/radix/timberland/nomad/nomad job status -address=https://nomad.service.consul:4646 -tls-skip-verify -token=\$(sudo cat /opt/radix/timberland/.acl-token) | grep running | grep interface | awk '{print \$1}' | xargs sudo /opt/radix/timberland/nomad/nomad alloc restart -address=https://nomad.service.consul:4646 -tls-skip-verify -token=\$(sudo cat /opt/radix/timberland/.acl-token)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# keep apt updated by running updates on shell init
# update > ~/.apt.log 2>&1 &

cd ~
