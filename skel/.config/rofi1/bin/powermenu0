#!/bin/bash

# Available Styles
# >> Styles Below Only Works With "rofi-git(AUR)", Tested On Version: 1.5.4-76-gca067234
# full     full_circle     full_rounded     full_alt
# card     card_circle     column     column_circle
# row     row_alt     row_circle
# single     single_circle     single_full     single_full_circle     single_rounded     single_text

## Default
DIR=powermenus
STYLE=Full_Rounded

rofi_command="rofi -theme $DIR/$STYLE.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
if [[ "$DIR" == "powermenus" ]]; then
	shutdown=""
	reboot=""
	lock=""
	suspend=""
	logout=""
	ddir="$HOME/.config/rofi/$DIR"
else
	shutdown=" Shutdown"
	reboot=" Restart"
	lock=" Lock"
	suspend=" Sleep"
	logout=" Logout"
	ddir="$HOME/.config/rofi/dialogs"
fi

rdialog () {
rofi -dmenu\
    -i\
    -no-fixed-num-lines\
    -p "Are You Sure? : "\
    -theme "$ddir/confirm.rasi"
}

# Variable passed to rofi
MSG="Options : yes/no/y/n"
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
	systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen --lock
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        betterlockscreen --suspend
        ;;
    $logout)
        openbox --exit
        ;;
esac

