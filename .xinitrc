#!/bin/sh

userresources=$HOME/.Xdefaults
export XCURSOR_PATH=""

# merge in defaults

if [ -f $userresources ]; then
	xrdb -merge "$userresources"
fi

exec i3
