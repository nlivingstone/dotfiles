# Environment Variables
export PS1="\u@\h: \W > "
export PATH=/usr/local/bin:$HOME/.composer/vendor/bin:$PATH

# Aliases
alias cc='clear'
alias canihazip="curl ipinfo.io/ip"

# Functions
mkcd () {
  mkdir "$1"
  cd "$1"
  pwd
}

# Session Start
pwd
