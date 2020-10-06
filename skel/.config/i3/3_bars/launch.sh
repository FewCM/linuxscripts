#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

/home/fewcm/.config/i3/3_bars/config
case $desktop in

    i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload top -c ~/.config/i3/3_bars/config &
      done
    else
    polybar --reload top -c ~/.config/i3/3_bars/config &
    fi
    # second polybar at bottom
     if type "xrandr" > /dev/null; then
       for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
         MONITOR=$m polybar --reload left -c ~/.config/i3/3_bars/config &
       done
     else
     polybar --reload left -c ~/.config/i3/3_bars/config &
     fi
   
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload panel -c ~/.config/i3/3_bars/config &
      done
    else
    polybar --reload panel -c ~/.config/i3/3_bars/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-openbox-extra -c ~/.config/i3/3_bars/config &
    #   done
    # else
    # polybar --reload mainbar-openbox-extra -c ~/.config/i3/3_bars/config &
    # fi
    ;;

    bspwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/i3/3_bars/config &
      done
    else
    polybar --reload mainbar-bspwm -c ~/.config/i3/3_bars/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-bspwm-extra -c ~/.config/i3/3_bars/config &
    #   done
    # else
    # polybar --reload mainbar-bspwm-extra -c ~/.config/i3/3_bars/config &
    # fi
    ;;

    herbstluftwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-herbstluftwm -c ~/.config/i3/3_bars/config &
      done
    else
    polybar --reload mainbar-herbstluftwm -c ~/.config/i3/3_bars/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-herbstluftwm-extra -c ~/.config/i3/3_bars/config &
    #   done
    # else
    # polybar --reload mainbar-herbstluftwm-extra -c ~/.config/i3/3_bars/config &
    # fi
    ;;

    xmonad)
    if [ $count = 1 ]; then
      m=$(xrandr --query | grep " connected" | cut -d" " -f1)
      MONITOR=$m polybar --reload mainbar-xmonad -c ~/.config/i3/3_bars/config &
    else
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-xmonad -c ~/.config/i3/3_bars/config &
      done
    fi
    # second polybar at bottom
    # if [ $count = 1 ]; then
    #   m=$(xrandr --query | grep " connected" | cut -d" " -f1)
    #   MONITOR=$m polybar --reload mainbar-xmonad-extra -c ~/.config/i3/3_bars/config &
    # else
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-xmonad-extra -c ~/.config/i3/3_bars/config &
    #   done
    # fi
    ;;
esac
