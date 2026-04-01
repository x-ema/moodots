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
hyprland \
hyprlock \
hypridle \
firefox \
mommy \
nvchad-git \
reflector \
tailscale \
ncdu \
kitty \
python-pywal \
eza \
starship \
otf-firamono-nerd \
ttf-nerd-fonts-symbols \
waybar \
hyprpicker \
blueman \
bluez \
swaync \
walker \
awww \
elephant-all-bin \
uwsm \
libnewt

elephant servive enable
