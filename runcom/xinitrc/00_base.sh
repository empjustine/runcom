#!/bin/sh

# load system-wide xinitrc files
. sources /etc/X11/xinit/xinitrc.d/*

setxkbmap -option terminate:ctrl_alt_bksp &

pulseaudio --kill && pulseaudio --start &


xset +fp /usr/share/fonts/local
xset fp rehash


# Disable the touchpad while typing
#syndaemon -k -i 2 -d &

# disable pc speaker beep
xset -b &

