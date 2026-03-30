#! /bin/bash
wayvrctl panel-modify media listener set-visible 0
prevname=""
while [ ! -f $HOME/.config/wayvr/theme/gui/states/mediacontrolsstatus ]
do
	name="$(playerctl metadata title)" || continue
	#name="${name:0:32}"
	if [ "$name" != "$prevname" -a "$name" != "" ]
	then
		prevname=$name
		wayvrctl panel-modify media songname set-text "$name" || exit
		curl "$(playerctl metadata mpris:artUrl)" --output /tmp/wayvrsongicon || exit
		wayvrctl panel-modify media songicon set-image /tmp/wayvrsongicon || exit
	else
		sleep 10;
	fi
done
