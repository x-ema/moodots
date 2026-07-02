#!/bin/fish 

# assumes that arch has already been installed and this script isnt running inside the install media, ie make sure network is working 

#to be installed during arch install
#nvim, sudo, networkmanager, git, fish, amd-ucode (if amd), systemdboot (dont need to install but use this bootmgr, usually set timeout to 0, space will bring it up if you need it)

sudo pacman -Syy 
sudo pacman -Syu
sudo pacman -S --needed base-devel
if type paru > /dev/null 2>&1
  echo "Paru is already installed, skipping..."
else
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd ~
  rm -rf paru
end

# This should really be done during install
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
# reflector --score 50 --fastest 5 --sort rate --verbose > /etc/pacman.d/mirrorlist

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
unzip \
quickshell \
pipewire-jack \
yazi \
nerd-fonts \
ttf-input-nerd \
hyprland \
hyprsunset \
xdg-desktop-portal-hyprland \
xdg-desktop-portal-gtk \
hyprshutdown \
starship


#cat config/fish/config.fish >> ~/.config/fish/config.fish
cp ~/moodots/config/* ~/.config/ -R

