#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {

    ln -s -f ~/dotfiles/.zshrc ~/.zshrc
    ln -s -f ~/dotfiles/.aliases ~/.aliases
    ln -s -f ~/dotfiles/.functions ~/.functions
    ln -s -f ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s -f ~/dotfiles/.bashrc ~/.bashrc
    ln -s -f ~/dotfiles/.curlrc ~/.curlrc
    ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
    ln -s -f ~/dotfiles/.vimrc ~/.vimrc
    #mkdir -p ~/.config/nvim # use lazyvim
    #ln -s -f ~/dotfiles/.vimrc ~/.config/nvim/init.vim
    ln -s -f ~/dotfiles/.ideavimrc ~/.ideavimrc
    ln -s -f ~/dotfiles/.exports ~/.exports
    ln -s -f ~/dotfiles/.zprofile ~/.zprofile
    ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
    ln -s -f ~/dotfiles/ghostty ~/.config/
    mkdir -p ~/.config/fcitx5
    ln -s -f ~/dotfiles/fcitx5/config ~/.config/fcitx5/config
    ln -s -f ~/dotfiles/fcitx5/profile ~/.config/fcitx5/profile

    # Hyprland (Omarchy) user overrides
    mkdir -p ~/.config/hypr
    for f in bindings.lua looknfeel.lua input.lua autostart.lua monitors.lua \
             hyprland.lua xdph.conf hyprsunset.conf .luarc.json; do
        ln -s -f ~/dotfiles/hypr/$f ~/.config/hypr/$f
    done

    # Omarchy shell custom bar scripts (Fcitx status)
    mkdir -p ~/.config/omarchy/bar/scripts
    ln -s -f ~/dotfiles/omarchy/shell.json ~/.config/omarchy/shell.json
    ln -s -f ~/dotfiles/omarchy/bar/scripts/fcitx-status ~/.config/omarchy/bar/scripts/fcitx-status
    ln -s -f ~/dotfiles/omarchy/bar/scripts/fcitx-toggle ~/.config/omarchy/bar/scripts/fcitx-toggle
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
  echo "When you first start vim, please use :PlugInstall to install all the plugins."
  echo "Have fun!"
fi;
unset doIt;
