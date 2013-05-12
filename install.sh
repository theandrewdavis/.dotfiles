#!/bin/bash

DOTFILES=( .vimrc .tmux.conf .gitconfig .bash_profile .bashrc )
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for DOTFILE in ${DOTFILES[@]}; do
  echo Linking $DOTFILE
  [ -f ~/$DOTFILE ] && rm ~/$DOTFILE
  ln -s $SCRIPT_DIR/$DOTFILE ~/$DOTFILE
done
