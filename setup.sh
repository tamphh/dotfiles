#!/bin/bash

echo "Linking up the dotfiles to your home directory ($HOME)"

# cd ~/dotfiles

# remove unneeded files
find . -name '.DS_Store' -type f -delete

stow config
stow shell
stow tig
stow tmux
stow vim
cd -

# mv ~/dotfiles ~/.dotfiles
echo "DONE!"
