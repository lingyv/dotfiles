#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
            
    sudo ln -s -f ~/dotfiles/.zshrc ~/.zshrc
    sudo ln -s -f ~/dotfiles/.aliases ~/.aliases
    sudo ln -s -f ~/dotfiles/.functions ~/.functions
    sudo ln -s -f ~/dotfiles/.bash_profile ~/.bash_profile
    sudo ln -s -f ~/dotfiles/.bashrc ~/.bashrc
    sudo ln -s -f ~/dotfiles/.curlrc ~/.curlrc
    sudo ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
    sudo ln -s -f ~/dotfiles/.vimrc ~/.vimrc
    sudo ln -s -f ~/.vim ~/.config/nvim
    sudo ln -s -f ~/dotfiles/.vimrc ~/.config/nvim/init.vim
    sudo ln -s -f ~/dotfiles/.ideavimrc ~/.ideavimrc
    sudo ln -s -f ~/dotfiles/.exports ~/.exports
    sudo ln -s -f ~/dotfiles/.condarc ~/.condarc
    sudo ln -s -f ~/dotfiles/.tern-project ~/.tern-project
    sudo ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
  echo "dotfiles installed completed. Please don't forget to change your git username and email:";
  echo "    git config --global user.name \"Your Name\"";
  echo "    git config --global user.email you@example.com";
  echo "";
  echo "When you first start vim, please use :BundleInstall to install all the plugins."
  echo "Have fun!"
fi;
unset doIt;
