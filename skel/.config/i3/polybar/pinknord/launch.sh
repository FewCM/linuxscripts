#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar main -c "$HOME"/.config/i3/polybar/config.ini &
#    MONITOR=$m polybar main -c "$HOME"/.config/i3/polybar/config_bottom.ini &
#done

MONITOR=DP1 polybar main -c "$HOME"/.config/i3/polybar/pinknord/config.ini &
MONITOR=DP1 polybar main -c "$HOME"/.config/i3/polybar/pinknord/config_bottom.ini &
MONITOR=VGA1 polybar main -c "$HOME"/.config/i3/polybar/pinknord/config.ini &
MONITOR=VGA1 polybar main -c "$HOME"/.config/i3/polybar/pinknord/config_bottom.ini &
