#!/usr/bin/env bash

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Development
brew install composer node
brew cask install iterm2 virtualbox vagrant sublime-text visual-studio-code transmit sequel-pro tower viscosity

# Browsers
brew cask install firefox google-chrome

# Productivity
brew cask install 1password alfred dropbox adobe-creative-cloud appcleaner caffeine spectacle cacher
brew install youtube-dl

# Zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /usr/local/bin/zsh