#!/bin/bash
sudo apt-get install -y git
sudo apt-get install -y vim
sudo apt-get install -y zsh
chsh -s /bin/zsh
sudo apt-get install -y tmux
sudo apt-get install -y python-pip
sudo apt-get install -y autojump
sudo apt-get install -y librime-data-double-pinyin
sudo apt-get update
sudo apt-get install -y python3-dev python3-pip
sudo apt-get install -y thefuck
sudo apt-get install -y shadowsocks-libev

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dotfiles/conf/zsh/lingyv.zsh-theme ~/.oh-my-zsh/themes/lingyv.zsh-theme

git clone https://github.com/shadowsocksr-backup/shadowsocksr.git ~/ss
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
