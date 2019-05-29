#!/bin/sh

userresources=$HOME/.Xresources
userdefaults=$HOME/.Xdefaults
export XCURSOR_PATH=""

# merge in defaults

if [ -f $userresources ]; then
	xrdb -merge "$userresources"
fi

if [ -f $userdefaults ]; then
	xrdb -merge "$userdefaults"
fi

exec i3
