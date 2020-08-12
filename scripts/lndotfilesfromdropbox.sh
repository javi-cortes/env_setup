#!/bin/bash

FOLDER=${1:-"~/Dropbox/meta"}
echo "ln'ing all $FOLDER dotfiles"
# previously setup drobox stuff

cd ~
ln -s $FOLDER/.dsh . && echo ".dsh linked"
ln -s $FOLDER/.ssh . && echo ".ssh linked"
ln -s $FOLDER/.bashrc . && echo ".bashrc linked"
ln -s $FOLDER/.bash_history . && echo ".bash_history linked"
ln -s $FOLDER/.gitconfig . && echo ".gitconfig linked"
ln -s $FOLDER/.gitlab_config . && echo ".gitlab_config linked"
ln -s $FOLDER/.git_prompt_custom . && echo ".git_prompt_custom linked"
ln -s $FOLDER/.javi-ascii . && echo ".javi linked"
ln -s $FOLDER/.psqlrc . && echo ".psqlrc linked"
ln -s $FOLDER/.vimrc . && echo ".vimrc linked"
ln -s $FOLDER/.i3 . && echo ".i3 linked"

cd -