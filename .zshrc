# path
export PATH=$PATH:$HOME/bin

# History
export HISTSIZE=50000
export HISTFILE=$HOME/.history_zsh
export SAVEHIST=$HISTSIZE

# path to oh-my-zsh config
ZSH=$HOME/git-repos/oh-my-zsh

# set name of theme to load
ZSH_THEME="agnoster"

autoload -Uz promptinit
promptinit

# set prompt
#export PROMPT=' [%~] '

# ssh-agent config
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.socket
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
        ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi

# some nice keybindings
bindkey -e

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

# Load TCP user functions (see zshtcpsys(1) for usage)
autoload -U tcp_open

# Aliases
alias cl='curl -4 -L -D - -s -o /dev/null -i $1'
alias cl6='curl -6 -L -D - -s -o /dev/null -i $1'
alias clv='curl -4 -L -v -o /dev/null -i $1'
alias cl6v='curl -6 -L -v -o /dev/null -i $1'
alias ls='ls --color=auto'
alias ll='ls -lalhF'
alias s='sudo'
alias v='vim'
alias sv='sudo vim'

# enable zsh command line syntax highlighting (http://github.com/zsh-users/zsh-syntax-highlighting)
source ~/git-repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red
