
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

# add psql to path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Fixes an issue with mavericks and clang http://stackoverflow.com/questions/22394575/xcode-llvm-5-1-clang-error
export ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future

# add node_modules/.bin to path
PATH=$(npm bin):$PATH

# add maven (mvn) to path
PATH=/usr/local/Cellar/maven/3.3.3/bin:$PATH

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Aliases
alias g='git'
alias python='python3'
alias dv='cd ~/dev/'
# go to project root
alias gr='cd $(git rev-parse --show-toplevel)'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
