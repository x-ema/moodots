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
python-pywalfox \
eza \
starship \
otf-firamono-nerd \
ttf-nerd-fonts-symbols \
waybar \
hyprpicker \
blueman \
bluez \
swaync \
awww \
uwsm \
libnewt \
npm \
unzip \
quickshell \
qt5

cp ~/moodots/config/* ~/.config/ -R

elephant servive enable
systemctl --user enable --now elephant.service
systemctl --user enable waybar.service
