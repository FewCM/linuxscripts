#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar main -c "$HOME"/.config/polybar/pinknord/config.ini &
    MONITOR=$m polybar main -c "$HOME"/.config/polybar/pinknord/config_bottom.ini &
done
