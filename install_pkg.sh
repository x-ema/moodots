#!/usr/bin/env bash
###----------------------------------------------###
###               Update System
###----------------------------------------------###
sudo pacman -Syy
sudo pacman -Sy archlinux-keyring
sudo pacman -Syu

###----------------------------------------------###
###               Install paru
###----------------------------------------------###
sudo pacman -S --needed base-devel git wget curl
git clone https://aur.archlinux.org/paru.git
cd paru makepkg -si
cd

###----------------------------------------------###
###            Grab and install HyDe
###----------------------------------------------###

git clone --depth 1 https://github.com/HyDE-Project/HyDE ~/HyDE 
cd ~/HyDE/Scripts 
./install.sh

###----------------------------------------------###
###           Install a bunch of stuff
###----------------------------------------------###

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

flatpak install org.blender.Blender
flatpak install org.vinegarhq.Sober

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
