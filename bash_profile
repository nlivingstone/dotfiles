export PS1="\u@\h: \W > "
export PATH=/usr/local/bin:$$HOME/.composer/vendor/bin:$PATH
alias cs='clear'
alias canihazip="curl ipinfo.io/ip"

# Jekyll 
alias jekyll-build='bundle exec jekyll build'
alias jekyll-serve='bundle exec jekyll serve --watch'
alias jekyll-draft="bundle exec jekyll draft"
alias jekyll-publish="bundle exec jekyll publish"
alias jekyll-unpublish="bundle exec jekyll unpublish"
alias jekyll-page="bundle exec jekyll page"
alias jekyll-post="bundle exec jekyll post"
pwd