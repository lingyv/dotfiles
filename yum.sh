#!/bin/bash

yum install -y git
yum install -y neovim
yum install -y zsh
yum install -y tmux
yum install -y autojump
yum install -y htop
yum install -y ctags

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dotfiles/conf/zsh/lingyv.zsh-theme ~/.oh-my-zsh/themes/lingyv.zsh-theme

