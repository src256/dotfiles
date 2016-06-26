#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
brew update
brew tap homebrew/php
brew tap homebrew/apache
brew install nkf
brew install emacs
brew install ruby
brew install tmux
brew install peco
brew install ag
