#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Bash prompt customize
GREEN='\[\e[32m\]'
RED='\[\e[31m\]'
RESET='\[\e[0m\]'
# DOT='\342\200\242'
LC="\`[ \$? = 0 ] && echo $GREEN\w$RESET || echo $RED\w$RESET\`"
PS1="< ${LC} > "
# PS1=$'\u250F\u2501\u276A\[\033[0;31m\]\e[219;50;50m\u\e[0m : \w\u276B\n\u2517\u2501\u27A4 '   Red
# PS1=$'\u250F\u2501\u276A\e[1m\e[219;50;50m\u\e[0m : \w\u276B\n\u2517\u2501\u27A4 '    Bold

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim='vim -u NONE'

# Functions
cdd() { cd "$@" && ls -all; }
fehbg() { feh --bg-fill "$(xsel -b)"; }
diffDirs() { diff -r -q {$1,$2} -x "$3" -x "$4" -x "$5" -x "$6"; }
extract () {
if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)     echo "'$1' cannot be extracted via extract()" ;;
     esac
 else
     echo "'$1' is not a valid file"
 fi
}
