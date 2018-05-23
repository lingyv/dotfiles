#!/bin/bash
# 使用🇨🇳源
sudo pacman-mirrors -i -c China -m rank
# 添加archlinuxcn源
echo -e "\n[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syyu
sudo pacman -S archlinuxcn-keyring
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gvim
sudo pacman -S --noconfirm zsh
chsh -s /bin/zsh
sudo pacman -S --noconfirm tmux
sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm xfce4-terminal
sudo pacman -S --noconfirm python-pip
sudo pacman -S --noconfirm nodejs
sudo pacman -S --noconfirm npm
sudo pacman -S --noconfirm anaconda
sudo pacman -S --noconfirm tor-browser
sudo pacman -S --noconfirm autojump
sudo pacman -S --noconfirm tldr
sudo pacman -S --noconfirm gradle
sudo pacman -S --noconfirm thefuck
sudo pacman -S --noconfirm the_silver_searcher
sudo pacman -S --noconfirm aria2
sudo pacman -S --noconfirm mpv
sudo pacman -S --noconfirm google-chrome
sudo pacman -S --noconfirm go
sudo pacman -S --noconfirm tig
sudo pacman -S --noconfirm thunderbird
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm p7zip
sudo pacman -S --noconfirm tree
sudo pacman -S --noconfirm rofi 
sudo pacman -S --noconfirm proxychains-ng 
sudo pacman -S --noconfirm feh 
sudo pacman -S --noconfirm tlp tlp-rdw
systemctl enable tlp.service
systemctl enable tlp-sleep.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
sudo pacman -S fcitx-configtool fcitx-im fcitx-rime
sudo pacman -Syu yaourt
sudo pacman -S --noconfirm intellij-idea-ultimate-edition
sudo pacman -S --noconfirm goland
sudo pacman -S --noconfirm visual-studio-code-bin


wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dotfiles/conf/zsh/lingyv.zsh-theme ~/.oh-my-zsh/themes/lingyv.zsh-theme

git clone https://github.com/shadowsocksr-backup/shadowsocksr.git /opt/ssr

sudo echo "export GTK_IM_MODULE=fcitx" >> ~/.xprofile
sudo echo "export QT_IM_MODULE=fcitx" >> ~/.xprofile
sudo echo "export XMODIFIERS=@im=fcitx" >> ~/.xprofile
