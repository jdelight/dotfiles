# set vim key bindings for bash
set -o vi


export REACT_EDITOR=code
# export CHROME_BIN=/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
# export FIREFOX_BIN=/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox-bin
# export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
# export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"
# export MINIKUBE_WANTUPDATENOTIFICATION=1
# export WORKON_HOME=~/envs
 # Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add node_modules/.bin to path
# PATH=$(npm bin):$PATH

# FINDER
# enable text selection in finder quicklook
# defaults write com.apple.finder QLEnableTextSelection -bool TRUE

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Aliases
alias g='git'
alias dv='cd ~/dev/'
# go to project root
alias gr='cd $(git rev-parse --show-toplevel)'
alias gx='vim .git/info/exclude'
alias ll='ls -la'

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

# tree
alias t2='tree -L 2'
alias t3='tree -L 3'
alias t4='tree -L 4'

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
if [ -f '/Users/jamesd/Downloads/google-cloud-sdk 2/path.bash.inc' ]; then . '/Users/jamesd/Downloads/google-cloud-sdk 2/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jamesd/Downloads/google-cloud-sdk 2/completion.bash.inc' ]; then . '/Users/jamesd/Downloads/google-cloud-sdk 2/completion.bash.inc'; fi
