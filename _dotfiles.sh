#!/bin/sh
DOTFILES=`pwd`
ln -snvf $DOTFILES/.bash_profile ~/.bash_profile
ln -snvf $DOTFILES/.emacs ~/.emacs
ln -snvf $DOTFILES/.gitconfig ~/.gitconfig
ln -snvf $DOTFILES/.gitignore ~/.gitignore
ln -snvf $DOTFILES/.tmux.conf ~/.tmux.conf
source ~/.bash_profile




