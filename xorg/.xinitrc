#!/bin/sh

# Map CapsLock key to Ctrl and set layout to us and cn
setxkbmap -layout us,cn -option "caps:ctrl_modifier"
# Disable Trackpad
ID=$(xinput list | grep -Eo 'TM.*id\=[0-9]{1,2}' | grep -Eo '\=[0-9]{1,2}'| grep -Eo '[0-9]{1,2}')
xinput set-prop $ID "Device Enabled" 0

# Default two monitors setup (independent)
xrandr --output eDP1 --auto --scale 1.0x1.0 --output HDMI2 --auto --scale 1.0x1.0 --right-of eDP1
# Wallpaper setup
nitrogen --restore
# Transparent dependence
compton &
# Lock display after 5 minutes of user inactivity
xautolock -time 12 -locker sxlock -f "-misc-liberation mono-medium-r-normal--0-0-0-0-m-0-iso10646-1" &
# Start dunst (notification)
dunst &

# Start slstatus(status bar)
slstatus &
exec dwm
