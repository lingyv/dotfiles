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

# Additional CLI tools
echo "==> Installing additional CLI tools..."
sudo pacman -S --needed --noconfirm \
    7zip \
    tldr \
    thefuck \
    uv \
    rsync \
    yazi \
    micro \
    helix \
    alacritty \
    ghostty \
    wl-clipboard \
    cliphist \
    ffmpeg \
    ffmpegthumbnailer \
    zathura \
    zathura-pdf-poppler

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
    ttf-firacode-nerd \
    ttf-hack \
    ttf-hack-nerd \
    ttf-nerd-fonts-symbols

# GUI applications
# Chinese input method and fonts
echo "==> Installing Chinese input method and fonts..."
sudo pacman -S --needed --noconfirm \
    fcitx5 \
    fcitx5-configtool \
    fcitx5-rime \
    adobe-source-han-sans-cn-fonts \
    adobe-source-han-serif-cn-fonts \
    ttf-dejavu \
    wqy-microhei \
    wqy-zenhei

# AUR packages (using yay if available)
if command -v yay &>/dev/null; then
    echo "==> Installing AUR packages..."
    yay -S --needed --noconfirm \
        sesh \
        lazygit \
        google-chrome \
        netease-cloud-music \
        wechat-bin \
        wemeet-bin \
        dingtalk-bin \
        wps-office-365 \
        wps-office-mui-zh-cn \
        deepseek-reasonix-desktop \
        deepseek-reasonix-tui \
        rime-ice-git \
        ttf-wps-fonts
else
    echo "==> yay not found, skipping AUR packages"
    echo "==> Install yay: sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
fi

# Install tmux plugins
echo "==> Installing tmux plugins..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install NVM
echo "==> Installing NVM..."
if [ ! -d ~/.nvm ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
fi

echo "==> Installation complete!"
echo "==> Run 'source ~/.bash_profile' or 'source ~/.zprofile' to apply changes"
