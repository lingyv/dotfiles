#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew); then
    echo "安装 homebrew..."
    /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew install proxychains-ng

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

brew install gawk
brew install gnu-tar
brew install gnu-which
brew install gnutls
brew install grep
brew install gzip
brew install global
brew install rg
brew install make
brew install unzip
brew install python3
brew install ffmpeg
brew install ctags cscope the_silver_searcher
brew install gcc

# 设置zsh为默认shell
chsh -s /bin/zsh

# Install more recent versions of some OS X tools.
brew install vim
brew install neovim
brew install homebrew/dupes/openssh

# Install other useful binaries.
brew install ack
brew install git
brew install lua
brew install p7zip
brew install rename
brew install tree

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node
brew install tmux
brew install thefuck
brew install autojump

brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install git-delta

# 安装oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/conf/zsh/lingyv.zsh-theme ~/.oh-my-zsh/themes/lingyv.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/coding
git clone https://github.com/skywind3000/z.lua.git ~/coding/z.lua

# Remove outdated versions from the cellar.
brew cleanup
