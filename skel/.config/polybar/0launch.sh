#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#bash "$HOME"/.config/polybar/white/launch.sh &
#bash "$HOME"/.config/polybar/box/launch.sh &
#bash "$HOME"/.config/polybar/pinknord/launch.sh

# Launch the bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=DP1 polybar main -c "$HOME"/.config/polybar/box/config.ini &
    MONITOR=DP1 polybar main -c "$HOME"/.config/polybar/box/config_top.ini&
    MONITOR=VGA1 polybar main -c "$HOME"/.config/polybar/pinknord/config.ini &
    MONITOR=VGA1 polybar main -c "$HOME"/.config/polybar/pinknord/config_bottom.ini &
done
