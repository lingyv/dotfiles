#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
    sudo ln -s -f ~/lingyv/dotfiles/.zshrc ~/.zshrc
    sudo ln -s -f ~/lingyv/.vim ~/.config/nvim
    sudo ln -s -f ~/lingyv/dotfiles/.vimrc ~/.config/nvim/init.vim
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
