#!/bin/sh

# Map CapsLock key to Ctrl and set layout to us and cn
setxkbmap -layout us,cn -option "caps:ctrl_modifier"

# Disable Trackpad
ID=$(xinput list | grep -Eo 'TM.*id\=[0-9]{1,2}' | grep -Eo '\=[0-9]{1,2}'| grep -Eo '[0-9]{1,2}')
xinput set-prop "$ID" "Device Enabled" 0

# Default external monitors setup and only for external monitor connected
if xrandr -q | grep -q "^DP1 connected"; then
    #turn off laptop screen and make external one primary)
    xrandr --output eDP1 --off --output DP1 --primary --auto --scale 1.0x1.0
    # set standby, suspend, and off to 12 hours if laptop docked
    # network connection will lose if suspended
    xset dpms 43200 43200 43200
    # disable x server access control
    # all application from container and chroot connect to host x server
    xhost +
fi

# Wallpaper setup
nitrogen --restore

# Transparent dependence
compton &

## Lock display after 5 minutes of user inactivity
## xautolock -time 8 -resetsaver -locker 'sxlock -f "-misc-liberation mono-medium-r-normal--0-0-0-0-m-0-iso10646-1"' &

# lock screen with xsecurelock after 5 mins inactive
xset s 300 5
xss-lock -n /usr/libexec/xsecurelock/dimmer -l -- env XSECURELOCK_SHOW_HOSTNAME=0 xsecurelock &

# Start dunst (notification)
dunst &

# Start slstatus(status bar)
slstatus &

# run dwm
exec dwm
