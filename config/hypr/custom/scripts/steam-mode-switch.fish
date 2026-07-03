#!/bin/fish 

if pgrep -fx "/usr/bin/gamescope -W 2560 -H 1440 -e -f -r 144 --force-grab-cursor --mangoapp -- /usr/bin/steam -tenfoot" > /dev/null #desktop config w/ bigpic
  notify-send "Steam" "Switching to silent mode."
  pkill steam 
  sleep 4s
  hyprctl eval 'hl.exec_cmd("LD_PRELOAD=/usr/lib32/libextest.so steam -silent &")'
  echo "Switched steam to silent mode"
else if pgrep -fx "/home/slt/.local/share/Steam/ubuntu12_32/steam -srt-logger-opened -silent" > /dev/null #Steam is running in the background
  notify-send "Steam" "Switching to big picture mode."
  pkill steam 
  sleep 4s
  hyprctl eval 'hl.exec_cmd("/usr/bin/gamescope -W 2560 -H 1440 -e -f -r 144 --force-grab-cursor --mangoapp -- /usr/bin/steam -tenfoot")'
  echo "Switched steam to bigpic mode"
else
  notify-send "Steam" "Switching to big picture mode."
  pkill steam 
  hyprctl eval 'hl.exec_cmd("/usr/bin/gamescope -W 2560 -H 1440 -e -f -r 144 --force-grab-cursor --mangoapp -- /usr/bin/steam -tenfoot")'
end
