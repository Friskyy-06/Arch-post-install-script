#!/bin/bash 

# Install primary packages:

cd dotfiles/pacman

sudo mv pacman.conf /etc

sudo mv mirrorlist /etc/pacman.d/

sudo pacman -Syu ufw gufw ntp amd-ucode numlockx tlp tlp-pd cups noto-fonts-cjk bluez bluez-utils mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon dolphin dolphin-plugins ffmpegthumbs filelight kdegraphics-thumbnailers ark unzip zip unrar ntfs-3g git wget vlc vlc-gui-ncurses vlc-plugins-all gvfs bash-completion wine-staging wine-mono winetricks steam gimp libreoffice kate okular qbittorrent neovim pacman-contrib zsh lua-luarocks rustup protontricks kdeconnect jre-openjdk discord krita btop obs-studio libvirt libvirt-dbus qemu-full virt-manager

# Start necessary services:

sudo systemctl enable tlp.service
sudo systemctl enable ntpd.service
sudo systemctl enable fstrim.timer
sudo systemctl enable paccache.timer
sudo systemctl enable bluetooth
sudo systemctl enable libvirtd.service
sudo virsh net-autostart default
# Fonts 

cd ..

mkdir ~/.fonts 

cd fonts

cp -r Inter ~/.fonts 

cp Meslo* ~/.fonts

cd ..

sudo cp environment /etc

# Zsh and kitty 

cp -r kitty ~/.config

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

chsh -s /bin/zsh 

# Powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

cp .zshrc ~/

# Neovim 

cp -r nvim ~/.config

# KDE connect:

sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload

# SDDM
sudo cp hidpi.conf /etc/sddm.conf.d/ 
