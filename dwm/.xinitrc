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

# set background for dwm
feh --bg-scale /home/marcovl/pix/walls/tree_silhouette_lonely_126139_3840x2160.jpg

# start compton
compton -fcCG --config ~/.config/compton.conf -b

#xrandr --dpi 220
xrandr --output LVDS-1 --mode 1366x768
xrandr --output DP-1 --primary --mode 3440x1440 --above  LVDS-1

while xsetroot -name "`date +'%H:%M'`"
    do
    	sleep 1
    done &

# start dwm
exec dwm
