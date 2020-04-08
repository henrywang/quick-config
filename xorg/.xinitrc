#!/bin/sh

# Map CapsLock key to Ctrl and set layout to us and cn
setxkbmap -layout us,cn -option "caps:ctrl_modifier"
# Disable Trackpad
ID=$(xinput list | grep -Eo 'TM.*id\=[0-9]{1,2}' | grep -Eo '\=[0-9]{1,2}'| grep -Eo '[0-9]{1,2}')
xinput set-prop $ID "Device Enabled" 0

# Default external monitors setup (turn off laptop screen and make external one primary)
xrandr -q | grep -q "HDMI1 connected" && xrandr --output eDP1 --off --output HDMI1 --primary --auto --scale 1.0x1.0
# Wallpaper setup
nitrogen --restore
# Transparent dependence
compton &
# Lock display after 5 minutes of user inactivity
xautolock -time 12 -locker 'sxlock -f "-misc-liberation mono-medium-r-normal--0-0-0-0-m-0-iso10646-1"' &
# Start dunst (notification)
dunst &

# Start slstatus(status bar)
slstatus &
exec dwm
