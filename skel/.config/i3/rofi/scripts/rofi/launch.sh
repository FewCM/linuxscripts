#!/bin/bash

menu="$1"

if [ "$menu" = "music" ]; then
    rofi -modi 'Music:~/.config/i3/rofi/scripts/rofi/rofi-music.sh' -show Music -theme music
elif [ "$menu" = "drun" ]; then
    rofi -show drun -theme clean
elif [ "$menu" = "powermenu" ]; then
    rofi -modi 'Powermenu:~/.config/i3/rofi/scripts/rofi/rofi-powermenu.sh' -show Powermenu -theme powermenu
#    rofi -modi 'Powermenu:~/.config/i3/rofi/scripts/rofi/rofi-powermenu.sh' -show Powermenu -theme powermenu -location 3 -xoffset -24 -yoffset 70
fi
