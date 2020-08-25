#!/bin/sh

userresources=$HOME/.Xresources
userdefaults=$HOME/.Xdefaults
export XCURSOR_PATH=""

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1
export GDK_DPI_SCALE=0.5

# merge in defaults

if [ -f $userresources ]; then
	xrdb -merge "$userresources"
fi

if [ -f $userdefaults ]; then
	xrdb -merge "$userdefaults"
fi

#xrandr --dpi 220
xrandr --output LVDS-1 --mode 1366x768
xrandr --output DP-1 --primary --mode 3440x1440 --above  LVDS-1

exec i3
