#!/bin/fish

#temp config locations for testing
set hyprconfig $HOME/Github/moodots/config/hypr/hyprland.conf
#set roficonfig $HOME/.config/rofi/config.rasi
set roficonfig /home/slt/Github/moodots/config/rofi/alt.rasi

function stdin2var
    set -l a
    while read line
        set a $a $line
    end
    # $a is a *list*, so use printf to output it exactly.
    echo (count $a)
    printf "%s\n"  $a
end

#Grab all keybinds
awk '/bind/ {print}' ../hyprland.conf | cut -d " " -f 3,4 | sed "s/, /+/" | sed "s/,//" > keybinds_list.lst
#Grab all keybind descriptions
awk -F "#" '{print $3}' $hyprconfig | awk /./ | cut -b 2- > keybinds_desc.lst


set keybinds_list (cat keybinds_list.lst)
set keybinds_desc (cat keybinds_desc.lst)


#echo (count $keybinds_list)
#echo (count $keybinds_desc)
: > keybinds.lst
for x in (seq (count $keybinds_list))
  printf "%s -> %s\n" $keybinds_desc[$x] $keybinds_list[$x] >> keybinds.lst
end

cat keybinds.lst | rofi -dmenu -i -config $roficonfig
