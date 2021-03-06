# set vim key bindings for bash
set -o vi


export REACT_EDITOR=wstorm
export CHROME_BIN=/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
export FIREFOX_BIN=/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox-bin
export COMPOSE_HTTP_TIMEOUT=10000
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export MINIKUBE_WANTUPDATENOTIFICATION=1
export WORKON_HOME=~/envs
export PATH=$PATH:~/dev/flutter/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fasd
eval "$(fasd --init auto)"

# GPG
alias gpg="GPG"
alias gpg2="GPG"

# Fixes an issue with mavericks and clang http://stackoverflow.com/questions/22394575/xcode-llvm-5-1-clang-error
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

# add node_modules/.bin to path
PATH=$(npm bin):$PATH

# FINDER
# enable text selection in finder quicklook
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Aliases
alias g='git'
alias dv='cd ~/dev/'
alias v4='cd ~/dev/clubcore/v4'
# go to project root
alias gr='cd $(git rev-parse --show-toplevel)'
alias gx='vim .git/info/exclude'
alias ll='ls -la'

# tree
alias t2='tree -L 2'
alias t3='tree -L 3'
alias t4='tree -L 4'

# docker
alias dmd='docker-machine env default && eval "$(docker-machine env default)"'
alias d='docker'
alias dr='docker run -it'
alias dm='docker-machine'
alias dc='docker-compose' 
alias dcu='docker-compose up -d'
alias dcr='docker-compose run'
alias dkr-clean='docker ps -aq | xargs docker rm -f && docker images --filter="dangling=true" -q | xargs docker rmi'
alias dkr-blat='docker images -q | xargs -I {} docker rmi -f {} && docker volume ls -q | xargs docker volume rm'
alias dkr-free-space='rm ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2'
alias k='kubectl'

alias des='desctl'

function dkb() {
	docker build -t "$1" .;
}

function dss(){
	docker run -it $1 bash;
}


# actually setup docker
# dmd

function jcurl() {
    curl "$@" | json | pygmentize -l json
}
export -f jcurl


if [ -f ~/dotfiles/localrc ] 
	then
		source ~/dotfiles/localrc
fi

if [ -f ~/dotfiles/privaterc ] 
	then
		source ~/dotfiles/privaterc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jamesd/dev/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jamesd/dev/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamesd/dev/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jamesd/dev/google-cloud-sdk/completion.bash.inc'; fi
