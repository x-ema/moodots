#Sunshine Config

Applications:

Sunshine passes a few vars on connect that have some valuable information. Unfortunately there seems to be a few issues with them with this setup and they do not work. This requires us to set up different "applications" for each device with a different resolution. Each "application" needs to be hardcoded with its own resolution and refresh rate, including the MoonDeckStream app that is used for MoonDeckBuddy.

- DESKTOP w/ custom res: 
```
Application Name: Desktop - [Device]
Do Command:                                                                         Undo Command:
hyprctl keyword [Headless display name],[width]x[height]@[refresh_rate],auto,1      hyprctl keyword [headless display name],disabled
hyprctl keyword [display name],disabled                                             hyprctl reload
```
Disable all physical displays and only enable the headless display 

- MoonDeckStream:
```
Application Name: MoonDeckStream
Do Command:                                                     Undo Command:
hyprctl keyword [Headless display name],1280x800@60,auto,1      hyprctl keyword [headless display name],disabled
hyprctl keyword [display name],disabled                         hyprctl reload

Command:
MoonDeckStream
```
Same as above but uses SteamDeck's resolution and starts MoonDeckStream on launch. Can probly be used for streaming to other handhelds just fine but is untested.

Configuration > Advanced
```Force a Specific Capture Method: wlroots```
This is required for sunshine to find the headless display. Since we're only running wayland/hyprland it shouldn't matter unless we change DEs down the road.

Create service:
```
sudo cp $HOME/moodots/Scripts/sunshine/sunshine.service /usr/lib/systemd/system/
sudo systemctl enable sunshine.service 
sudo systemctl start sunshine.service
```
Installs, enables, and starts sunshine as a service. As sunshine consumes little to no resources on idle, it's nice to always have it on boot. If you have WoL set up you can boot and log in via sunshine at any time.

