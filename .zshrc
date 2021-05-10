# Env. Vars

# History
export HISTSIZE=50000
export HISTFILE=$HOME/.history_zsh
export SAVEHIST=$HISTSIZE

# locale (LANG defined in ~/.login_conf)

# nnn file browser
export NNN_BMS='h:~;d:~/docs;D:~/downz;w:~/pix/walls'
export NNN_USE_EDITOR=1
export NNN_TMPFILE=/tmp/nnn
export NNN_FALLBACK_OPENER=xdg-open
export NNN_COLORS='6237'
export NNN_PLUG='v:imgview'

n()
{
        nnn -de "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        fi
}

export VISUAL=vim
export EDITOR=vim
export PAGER=less

cast()
{
	mkchromecast -y $1 -n $2 --video --encoder-backend ffmpeg --control --hijack --resolution $3
}

# set prompt
export PROMPT=' [%~] '

# man colours
export MANCOLOR=1

# change the default ls colours
export LSCOLORS="GxDxFxdxCxegedadagExEx"

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

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

#function zle-line-init zle-keymap-select {
#	    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#	        RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#		    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select
export KEYTIMEOUT=1

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

# Load version control information
autoload -Uz vcs_info
precmd() {
	vcs_info
}

# Completion Styles
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
#prompt adam1 cyan green green

# Load colours in prompt
autoload -U colors && colors

# Load TCP user functions (see zshtcpsys(1) for usage)
autoload -U tcp_open

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats "%s %r/%S %b (%a) %m%u%c "

# Setup the prompt (with git branch name)
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_

# ssh-agent config
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.socket
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
        ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

# gpg-agent
export GPG_TTY=$(tty)

# Aliases
alias cl='curl -4 -L -D - -s -o /dev/null -i $1'
alias cl6='curl -6 -L -D - -s -o /dev/null -i $1'
alias clv='curl -4 -L -v -o /dev/null -i $1'
alias cl6v='curl -6 -L -v -o /dev/null -i $1'
alias ll='ls -lalhF'
alias llr='ls -lahtrF'
alias rrl='ls -lahRF'
alias ls='ls --color'
alias d='doas'
alias db='doas bastille'
alias dc='doas cat'
alias dv='doas vim'
alias ncm='ncmpcpp'
alias v='vim'
alias grep='grep --color'
alias mute-toggle='pactl set-sink-mute 0 toggle'

alias clip='xsel -c'

# power settings
alias freq='sysctl dev.cpu.{{0..7}.cx_usage,0.freq}'
alias temp='sysctl dev.{acpi_ibm.0.fan_speed,cpu.{0..7}.temperature} hw.acpi.thermal.tz0.temperature'

# handy OpenSSL aliases
alias crt_info='openssl x509 -text -in'
alias crt_mod='openssl x509 -modulus -noout -in'
alias csr_info='openssl req -text -noout -in'
alias csr_mod='openssl req -modulus -noout -in'
alias key_mod='openssl rsa -modulus -noout -in'

# enable zsh command line syntax highlighting (http://github.com/zsh-users/zsh-syntax-highlighting)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

# start powerline daemon
#powerline-daemon -q

# set monitor
#export MONITOR=LVDS-1

# solarized zsh dircolors
#source /usr/share/zsh/plugins/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

# powerlevel9K config
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#POWERLEVEL9K_COLOR_SCHEME='dark'
#POWERLEVEL9K_CONTEXT_FOREGROUND='white'
#POWERLEVEL9K_CONTEXT_BACKGROUND='light blue'
#POWERLEVEL9K_DIR_FOREGROUND='white'
#POWERLEVEL9K_DIR_BACKGROUND='038' # deepskyblue2

#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

