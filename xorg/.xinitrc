#!/bin/sh

# Map CapsLock key to Ctrl and set layout to us and cn
setxkbmap -layout us,cn -option "caps:ctrl_modifier"
# Disable Trackpad
ID=$(xinput list | grep -Eo 'TM.*id\=[0-9]{1,2}' | grep -Eo '\=[0-9]{1,2}'| grep -Eo '[0-9]{1,2}')
xinput set-prop $ID "Device Enabled" 0

# Wallpaper setup
nitrogen --restore &
# Transparent dependence
compton &
# Lock display after 5 minutes of user inactivity
xautolock -time 5 -locker "sxlock -f -*-clean-bold-*-*-*-16-*-*-*-*-*-*-*" &
# Start dunst (notification)
dunst &

# Start slstatus(status bar)
slstatus &
exec dwm
