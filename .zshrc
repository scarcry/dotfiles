# Env. Vars

# set PATH
#export PATH="/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/kitty.app/Contents/MacOS:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/kitty.app/Contents/MacOS"
export PATH=$PATH:$HOME/bin

# History
export HISTSIZE=50000
export HISTFILE=$HOME/.history_zsh
export SAVEHIST=$HISTSIZE

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

# XDG environment variables
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# mpv
# XDG_RUNTIME_DIR for mpv hardware acceleration
if [ -z "$XDG_RUNTIME_DIR" ]; then
export XDG_RUNTIME_DIR=/tmp
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
mkdir "$XDG_RUNTIME_DIR"
chmod 0700 "$XDG_RUNTIME_DIR"
fi
fi

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
screen|(a|k|xterm*|rxvt*|st*|alacritty*))
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

export KEYTIMEOUT=1

# try to make the Del key work in some programs using the st(1) terminal emulator
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

zstyle :compinstall filename '/Users/marcovl/.zshrc'

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
alias s='sudo'
alias sc='sudo cat'
alias sv='sudo vim'
alias v='vim'
alias nv='nvim'
alias grep='grep --color'
alias pstree='pstree -g 2'

# handy OpenSSL aliases
alias csr_info='openssl req -text -noout -in'
alias csr_mod='openssl req -modulus -noout -in'
alias crt_info='openssl x509 -text -in'
alias crt_mod='openssl x509 -modulus -noout -in'
alias key_info='openssl rsa -text -noout -in'
alias key_mod='openssl rsa -modulus -noout -in'

# enable shells/zsh-autosuggestions
if [ -e /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]
then
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# enable shells/zsh-syntax-highlighting
if [ -e /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

neofetch --kitty ~/pix/Anime/Cyberpunk:\ Edgerunners/Rebecca.jpg --size 10% --cpu_temp C

