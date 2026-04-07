#!/bin/fish

#Convert wal's generated colors.json to a css file for walker's theme

set walcss (cat $HOME/.cache/wal/colors.json)
set CSS ""

set window_bg_color (echo $walcss | jq '.special.background' | string replace -a '"' '')

set accent_bg_color (echo $walcss | jq '.colors.color2' | string replace -a '"' '')

set theme_fg_color (echo $walcss | jq '.colors.color1' | string replace -a '"' '')

set error_fg_color "#C34043"

set error_bg_color (echo $walcss | jq '.colors.color8' | string replace -a '"' '')


printf "@define-color window_bg_color %s;\n@define-color accent_bg_color %s;\n@define-color theme_fg_color %s;\n@define-color error_fg_color %s;\n@define-color error_bg_color %s;\n" $window_bg_color $accent_bg_color $theme_fg_color $error_fg_color $error_bg_color > $HOME/.config/walker/themes/moo/colors.css
