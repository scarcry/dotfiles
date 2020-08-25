export TERMINAL="st"
export BROWSER="chrome"
export READER="zathura"

if [[ "$(tty)" = "/dev/ttyv0" ]]; then
        pgrep -x i3 || startx
fi
