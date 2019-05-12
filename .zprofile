export EDITOR="vim"
export TERMINAL="urxvt"

if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep i3 || startx
fi
