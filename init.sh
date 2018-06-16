#!/usr/bin/env bash

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Development
brew install composer
brew cask install iterm2
brew cask install virtualbox
brew cask install vagrant
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install transmit
brew cask install sequel-pro
brew cask install tower
brew cask install viscosity

# Browsers
brew cask install firefox
brew cask install google-chrome

# Misc
brew cask install 1password
brew cask install alfred
brew cask install dropbox
brew cask install adobe-creative-cloud
brew cask install appcleaner
brew cask install caffeine
brew cask install spectacle
brew cask install cacher
brew install youtube-dl

# Zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /usr/local/bin/zsh