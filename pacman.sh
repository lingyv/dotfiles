#!/bin/bash
# Arch Linux software installation script for dotfiles

set -e

echo "==> Installing packages for Arch Linux dotfiles..."

# Core utilities
echo "==> Installing core utilities..."
sudo pacman -S --needed --noconfirm \
    bat \
    btop \
    eza \
    fastfetch \
    fd \
    fzf \
    ripgrep \
    zoxide \
    unzip \
    curl \
    wget \
    jq \
    tree \
    xclip

# Development tools
echo "==> Installing development tools..."
sudo pacman -S --needed --noconfirm \
    git \
    git-delta \
    nodejs \
    npm \
    python \
    python-pip \
    rust \
    cargo

# Terminal and shell
echo "==> Installing terminal and shell..."
sudo pacman -S --needed --noconfirm \
    zsh \
    tmux \
    neovim \
    wezterm

# Fonts
echo "==> Installing fonts..."
sudo pacman -S --needed --noconfirm \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    ttf-jetbrains-mono \
    ttf-jetbrains-mono-nerd \
    ttf-firacode-nerd \
    ttf-hack \
    ttf-hack-nerd \
    ttf-nerd-fonts-symbols

# AUR packages (using yay if available)
if command -v yay &>/dev/null; then
    echo "==> Installing AUR packages..."
    yay -S --needed --noconfirm \
        sesh \
        lazygit
else
    echo "==> yay not found, skipping AUR packages"
    echo "==> Install yay: sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
fi

# Install tmux plugins
echo "==> Installing tmux plugins..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install oh-my-zsh
echo "==> Checking oh-my-zsh..."
if [ ! -d ~/.oh-my-zsh ]; then
    echo "==> oh-my-zsh not found. Install manually:"
    echo "    sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

# Install zsh plugins
echo "==> Installing zsh plugins..."
if [ -d ~/.oh-my-zsh/custom/plugins ]; then
    if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    fi
    if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi
fi

# Install NVM
echo "==> Installing NVM..."
if [ ! -d ~/.nvm ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
fi

echo "==> Installation complete!"
echo "==> Run 'source ~/.bash_profile' or 'source ~/.zprofile' to apply changes"
