export TERMINAL="st"
export BROWSER="surf"
export READER="zathura"

if [[ "$(tty)" = "/dev/ttyv0" ]]; then
        pgrep -x dwm || startx
fi
