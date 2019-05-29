export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep -x i3 || startx
fi
