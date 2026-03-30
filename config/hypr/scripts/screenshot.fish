#!/bin/fish 

grimblast copysave area $HOME/Pictures/Screenshots/(date +%h-%m-%y_%H:%M:%S).png
notify-send "Saved screenshot to $(echo $HOME)/Pictures/Screenshots/"
