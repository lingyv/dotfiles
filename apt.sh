#!/bin/bash
apt-get install -y git
apt-get install -y vim
apt-get install -y zsh
chsh -s /bin/zsh
apt-get install -y tmux
apt-get install -y python-pip
apt-get install -y autojump
apt-get install -y ibus
apt-get install -y ibus-rime
apt-get install -y librime-data-double-pinyin
apt-get update
apt-get install -y python3-dev python3-pip
apt-get install -y thefuck
apt-get install -y silversearcher-ag
apt-get install -y chromium-browser
apt-get install -y aria2
apt-get install -y mpv
apt-get install -y silversearcher-ag
apt-get install shellcheck
apt-get install pandoc
apt-get install htop

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dotfiles/conf/zsh/lingyv.zsh-theme ~/.oh-my-zsh/themes/lingyv.zsh-theme
