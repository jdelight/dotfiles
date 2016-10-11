# set vim key bindings for bash
set -o vi

[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh" # This loads nvm

# Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export REACT_EDITOR=wstorm
export CHROME_BIN=/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
export FIREFOX_BIN=/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox-bin
source /usr/local/bin/virtualenvwrapper.sh
export COMPOSE_HTTP_TIMEOUT=10000
export PATH="$HOME/.yarn/bin:$PATH"

# add psql to path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Fixes an issue with mavericks and clang http://stackoverflow.com/questions/22394575/xcode-llvm-5-1-clang-error
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

# add node_modules/.bin to path
PATH=$(npm bin):$PATH

# add maven (mvn) to path
PATH=/usr/local/Cellar/maven/3.3.3/bin:$PATH

# FINDER
# enable text selection in finder quicklook
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Aliases
alias g='git'
alias python='python2'
alias dv='cd ~/dev/'
# go to project root
alias gr='cd $(git rev-parse --show-toplevel)'
alias gx='vim .git/info/exclude'

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
alias dkr-blat='docker images -q | xargs -I {} docker rmi -f {}'

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

export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

if [ -f ~/dotfiles/localrc ] 
	then
		source ~/dotfiles/localrc
fi




export PATH="$HOME/.yarn/bin:$PATH"
