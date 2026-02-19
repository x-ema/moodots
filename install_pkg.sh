#!/usr/bin/env bash
###----------------------------------------------###
###               Update System
###----------------------------------------------###
echo "Updating System..."
sudo pacman -Syy
sudo pacman -Sy archlinux-keyring
sudo pacman -Syu

###----------------------------------------------###
###               Install paru
###----------------------------------------------###
echo "Installing paru..."
sudo pacman -S --needed base-devel git wget curl
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd

###----------------------------------------------###
###            Grab and install HyDE
###----------------------------------------------###
echo "Installing HyDE"
git clone --depth 1 https://github.com/HyDE-Project/HyDE ~/HyDE 
cd ~/HyDE/Scripts 
./install.sh
cd ~

###----------------------------------------------###
###           Install a bunch of stuff
###----------------------------------------------###
echo "Installing packages via paru..."
paru -S \
  alcom-bin \
  bat \
  btop \
  corectrl \
  envision-xr-git \
  ethtool \
  fastfetch \
  ffmpeg \
  firefox \
  flatpak \
  fish \
  gamemode \
  gamescope \
  gui-man \
  jdk-openjdk \
  jdk11-openjdk \
  jdk17-openjdk \
  krita \
  lutris \
  mommy \
  monero \
  monero-gui \
  moondeckbuddy-appimage \
  mpv \
  neovim \
  nvchad-git \
  piper \
  prism-launcher \
  protonplus \
  protontricks \
  prusa-slicer \
  reflector \
  screen \
  steam \
  sudo \
  sunshine \
  tailscale \
  tealdeer \
  tigervnc \
  ncdu \
  unityhub \
  vesktop-bin \
  wayvnc \
  wikiman \
  winetricks

echo "Installing packages via flatpak..."
flatpak install org.blender.Blender
flatpak install org.vinegarhq.Sober
###----------------------------------------------###
###       Configure what we just installed
###----------------------------------------------###

#---copy config folder---#
cp -R $HOME/moodots/config/* $HOME/.config/

#---register sunshine as a service---#
cp $HOME/moodots/Scripts/sunshine/sunshine.service /usr/lib/systemd/system/sunshine.service

#---Login and start tailscale---#
sudo tailscale login 
sudo tailscale up 
tailscale status

#---update tealdeer's local cache---#
tldr -u 

#---add arch wiki to wikiman---#
# Download latest Makefile
cd $HOME
curl -L 'https://raw.githubusercontent.com/filiparag/wikiman/master/Makefile' -o 'wikiman-makefile'
make -f ./wikiman-makefile source-arch source-tldr
sudo make -f ./wikiman-makefile source-install
sudo make -f ./wikiman-makefile clean
rm -rf $HOME/wikiman-makefile
cd ~


###----------------------------------------------###
###     Install some stuff not from the aur
###----------------------------------------------###


###----------------------------------------------###
###                   KarmaViz
###----------------------------------------------###
#KarmaViz install in /usr/local/KarmaViz
echo "Installing KarmaViz"
git clone https://github.com/KarmaTripping/karmaviz.git /usr/local/KarmaViz 
python -m venv /usr/local/KarmaViz 
source /usr/local/KarmaViz/bin/activate 
pip install -r /usr/local/KarmaViz/requirements.txt
deactivate
cp $HOME/moodots/KarmaViz/start.sh /usr/local/KarmaViz/start.sh
cp $HOME/moodots/KarmaViz/karmaviz.desktop /usr/share/applications/karmaviz.desktop
