#!/bin/fish 

#to be installed during arch install
#nvim, sudo, networkmanager, git, fish

sudo pacman -Syy 
sudo pacman -Syu
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~
rm -rf paru 

paru -S --needed \
bat \
btop \
fastfetch \
mpv \
firefox \
mommy \
nvchad-git \
reflector \
tailscale \
ncdu \
kitty \
uwsm \
libnewt \
npm \
unzip \
quickshell \
qt5


cat config/fish/config.fish >> ~/.config/fish/config.fish
#cp ~/moodots/config/* ~/.config/ -R

