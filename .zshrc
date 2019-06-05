# Env. Vars

# History
export HISTSIZE=50000
export HISTFILE=$HOME/.history_zsh
export SAVEHIST=$HISTSIZE

# PATH
export PATH=$PATH:$HOME/bin

# nnn file browser
export NNN_BMS='h:~;d:~/docs;D:~/Downloads;w:~/walls'
export NNN_USE_EDITOR=1
export NNN_TMPFILE="/tmp/nnn"

n()
{
        nnn "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        fi
}

cast()
{
	mkchromecast -y $1 -n $2 --video --encoder-backend ffmpeg --resolution $3
}

# set prompt
export PROMPT=' [%~] '

# Display path in titlebar of terms.
case "$TERM" in
screen|(a|k|xterm*|rxvt*|st))
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    ;;
*)
    ;;
esac

unsetopt beep

# some nice keybindings
bindkey -e

zstyle :compinstall filename '/home/marcovl/.zshrc'

#local myhosts
#myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
#zstyle ':completion:*' hosts $myhosts

# zsh options
setopt hist_ignore_all_dups

# taken from https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals

# Completion Styles
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
#prompt adam1 cyan green green

# Load TCP user functions (see zshtcpsys(1) for usage)
autoload -U tcp_open

# ssh-agent config
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.socket
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
        ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

# Aliases
alias cl='curl -4 -L -D - -s -o /dev/null -i $1'
alias cl6='curl -6 -L -D - -s -o /dev/null -i $1'
alias clv='curl -4 -L -v -o /dev/null -i $1'
alias cl6v='curl -6 -L -v -o /dev/null -i $1'
alias ll='ls -lalhF'
alias llr='ls -lahtrF'
alias rrl='ls -lahRF'
alias ls='ls --color=auto'
alias s='sudo'
alias v='vim'
alias sv='sudo vim'
alias mute-toggle='pactl set-sink-mute 0 toggle'

# enable zsh command line syntax highlighting (http://github.com/zsh-users/zsh-syntax-highlighting)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

# start powerline daemon
powerline-daemon -q

# set monitor
#export MONITOR=LVDS-1
