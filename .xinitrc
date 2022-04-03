#!/bin/sh

# set PROPER locale(1) with LC_ALL variable
export LC_ALL=en_US.UTF-8

# enable tap-to-click on Touchpad (requires install of xf86-input-synaptics)
synclient TapButton1=1

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
xrandr --output eDP-1 --primary --mode 2560x1440 --rate 60

# include font awesome 5
xset +fp /usr/local/share/fonts/font-awesome
xset fp rehash

#while xsetroot -name "$(date +'%H:%M:%S')"
#    do
#    	sleep 1
#    done &

# disable screen blanking
xset s off
# disable audible bell
xset b off
# disable DPMS
xset -dpms
# improve up key auto delay (default 600 25)
xset r rate 300 50
# startup of favourite utils

# run sysutils/dunst
dunst &

# run misc/unclutter
# unclutter &

# set background for dwm (requires graphics/feh)
feh --bg-fill /home/marcovl/pix/walls/nenad-novakovic-L2QB-rG5NM0-unsplash.jpg
#feh --bg-fill /home/marcovl/pix/F1/AMR21/Screenshot_20211103-090829__01.jpg
#feh --bg-max /home/marcovl/pix/walls/fantasy\ girls/wallhaven-4gp533.png

# run x11-wm/picom
picom --config ~/.config/picom.conf -b

# run slstatus (http://tools.suckless.org/slstatus)
slstatus &

# run dwm (http://dwm.suckless.org)
exec dwm
