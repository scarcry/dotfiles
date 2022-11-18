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

# include font awesome 6
xset +fp /usr/local/share/fonts/font-awesome
xset fp rehash

# disable screen blanking
xset s off
# disable audible bell
xset b off
# disable DPMS
xset -dpms
# improve up key auto delay (default 660 25)
xset r rate 300 50

# startup of favourite utils

# run audio/musicpd
musicpd /home/marcovl/.config/mpd/mpd.conf

# run sysutils/dunst
dunst &

# run misc/unclutter
# unclutter &

# set background for dwm (requires graphics/feh)
feh --bg-scale ~/pix/walls/anime/cyberpunk_2077/1280307.png
#feh --bg-fill /home/marcovl/pix/walls/night_17-wallpaper-3440x1440.jpg
#feh --bg-fill /home/marcovl/pix/walls/palm_trees_tropical_island-wallpaper-3440x1440.jpg
#feh --bg-fill /home/marcovl/pix/walls/1193309.png
#feh --bg-fill /home/marcovl/pix/walls/macos/macOS\ Monterey\ light\ wallpaper.jpeg
#feh --bg-fill /home/marcovl/pix/walls/anime/wallhaven-wygwyp.jpg
#feh --bg-fill /home/marcovl/pix/F1/AMR21/Screenshot_20211103-090829__01.jpg
#feh --bg-max /home/marcovl/pix/walls/fantasy\ girls/wallhaven-4gp533.png

# run x11-wm/picom
picom --experimental-backends --config ~/.config/picom.conf -b

# run slstatus (http://tools.suckless.org/slstatus)
slstatus &

# run dwm (http://dwm.suckless.org)
exec dwm
