# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# flush dns
alias flushdns='sudo /etc/init.d/nscd restart'
# history alias
alias h='history'

## a quick way to get out of current directory ##
alias cd..='cd ..' 
alias ..='cd ..' 
alias ...='cd ../../../' 
alias ....='cd ../../../../' 
alias .....='cd ../../../../' 
alias .4='cd ../../../../' 
alias .5='cd ../../../../..'
alias b='cd ~/roi/bookcore'
alias bm='b && m shell_plus'
alias bf='b && fastmserve'

# migrate 
alias pendingmigrations='m showmigrations | grep  '\''^\( \[ \]\|[a-zA-Z_]\+\)'\'''

# serve alias
alias fastmserve='ROIBACK_OPTS=noadmin,cache m serve --sin-grunt --proxy proxy --workers 1'
alias fasttoolbar='ROIBACK_OPTS=dtoolbar m serve --sin-grunt'
alias fastdebugmserve='ROIBACK_OPTS=noadmin m serve --sin-grunt --workers 1'
alias fastnodebugmserve='ROIBACK_OPTS=noadmin,nodebug m serve --sin-grunt'
alias fastprofileserve='ROIBACK_OPTS=noadmin,nodebug m profile serve --sin-grunt --workers 1'
alias fastredis='ROIBACK_OPTS=cache,redis m serve --sin-grunt'

# alias proyectos update
alias st_bookcore_client2013='dsh -c -M -g libs  -- '\''git -C /var/roiback/libs/bookcore_client2013/bookcore_client status -s'\'''
alias sum_bookcore_client2013='dsh -c -M -g libs -- '\''git -C /var/roiback/libs/bookcore_client2013/bookcore_client log -1 HEAD --format='\''\'\'''\''%h'\''\'\'''\'''\'''
alias update_bookcore_client2013='dsh -c -M -g libs  -- '\''git -C /var/roiback/libs/bookcore_client2013/bookcore_client pull'\'''
alias reboot_all='dsh -c -M -g libs -- '\''touch /var/www/*/*.reload'\'''

alias scpbookcoredb='rsync -Paz -e "ssh -p 2245 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" bookcore@backup-pmi.services.prod.roiback.net:/var/backups-pmi/databases/databases-acdc/bookcore-$(date +%Y-%m-%d)-devel.dump.gz ~/roi/bookcore/tmp/db-dump-cache.gz'

alias gitalias='git config --get-regexp alias'

# test speed connection
alias speed_test='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# ngrok :) 
alias ngrok='~/ngrok'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


get_dbback(){
    if [ $DBBACK ]
    then
        printf "\e[0;33m${1:-[DB %s] }\e[0m" "$DBBACK"
    fi
}
export PS1="\$(get_branch)${PS1}"
#export PS1="\$(get_dbback)${PS1}"

ROIBACK_OPTS=cache,redis,noadmin

function wwwinfo() { dig +short $1 | xargs -I _digip_ curl http://ipinfo.io/_digip_; }
function ipinfo() { curl http://ipinfo.io/$1; }

function actualiza_librerias() {
    for r in ~/roi/libs/*/.git
    do
        echo "Pulling $(basename ${r%/.git})"
        git -C "${r%/.git}" clean -df
        git -C "${r%/.git}" pull
    done
}



# git config visual commandline 
source ~/.git_prompt_custom

###########################
# Git (ssh forwarded)

# This variable is used on commiting in other projects... i dont want this ! :(
#export GIT_AUTHOR_NAME=$(git config user.name)
#export GIT_AUTHOR_EMAIL=$(git config user.email)

# Hg (ssh forwarded)

###########################
# random hi
random=$(( ( RANDOM % 10 )  + 1 ))
[ $(($random%2)) -eq 0 ] && source ~/.javi-ascii

# resolv.conf temporal ! xd
if [ "$EUID" -eq 0 ]
      then 
           
    echo "# Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)
#     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN
nameserver 10.10.7.2
nameserver 10.10.7.3
nameserver 127.0.1.1
search roiback.com" > /etc/resolv.conf
fi


# mkvirtualenv stuff
export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fix command editor set as vim
FCEDIT=vim
source ~/.javirc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# sometimes PS1 and git functions dont get loaded in the shell
source /usr/lib/git-core/git-sh-prompt
