#!/bin/bash

echo "Linking up the dotfiles to your home directory ($HOME)"

cd ~/.dotfiles
stow config
stow git
stow shell
stow tig
stow tmux
stow vim
cd -

echo "DONE!"
