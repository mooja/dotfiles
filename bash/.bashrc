# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# 24-bit colours
export TERM="xterm-256color"

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
HISTSIZE=1000
HISTFILESIZE=2000

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
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
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors/dircolors.gruvbox)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

# set editor for tmuxinator
export EDITOR='vim'

# virtualenvwrapper
export WORKON_HOME=~/venvs/
export PROJECT_HOME=~/projects/

# node stuff
export NPM_PACKAGES="$HOME/.npm-packages"
# Tell our environment about user-installed node tools
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
# Tell Node about these packages
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# end node stuff

# custom aliases
alias r='ranger'
alias t='tmux'
alias g='git'
alias gs='git status'
alias mux='tmuxinator'
alias weather='curl wttr.in/12401'



# customer colors

if [ "${TERM%%-*}" = "screen" ]; then
  if [ -n "$TMUX" ]; then
    printf "\033Ptmux;\033\033]4;236;rgb:32/30/2f\007\033\\"
    printf "\033Ptmux;\033\033]4;234;rgb:1d/20/21\007\033\\"

    printf "\033Ptmux;\033\033]4;235;rgb:28/28/28\007\033\\"
    printf "\033Ptmux;\033\033]4;237;rgb:3c/38/36\007\033\\"
    printf "\033Ptmux;\033\033]4;239;rgb:50/49/45\007\033\\"
    printf "\033Ptmux;\033\033]4;241;rgb:66/5c/54\007\033\\"
    printf "\033Ptmux;\033\033]4;243;rgb:7c/6f/64\007\033\\"

    printf "\033Ptmux;\033\033]4;244;rgb:92/83/74\007\033\\"
    printf "\033Ptmux;\033\033]4;245;rgb:92/83/74\007\033\\"

    printf "\033Ptmux;\033\033]4;228;rgb:f2/e5/bc\007\033\\"
    printf "\033Ptmux;\033\033]4;230;rgb:f9/f5/d7\007\033\\"

    printf "\033Ptmux;\033\033]4;229;rgb:fb/f1/c7\007\033\\"
    printf "\033Ptmux;\033\033]4;223;rgb:eb/db/b2\007\033\\"
    printf "\033Ptmux;\033\033]4;250;rgb:d5/c4/a1\007\033\\"
    printf "\033Ptmux;\033\033]4;248;rgb:bd/ae/93\007\033\\"
    printf "\033Ptmux;\033\033]4;246;rgb:a8/99/84\007\033\\"

    printf "\033Ptmux;\033\033]4;167;rgb:fb/49/34\007\033\\"
    printf "\033Ptmux;\033\033]4;142;rgb:b8/bb/26\007\033\\"
    printf "\033Ptmux;\033\033]4;214;rgb:fa/bd/2f\007\033\\"
    printf "\033Ptmux;\033\033]4;109;rgb:83/a5/98\007\033\\"
    printf "\033Ptmux;\033\033]4;175;rgb:d3/86/9b\007\033\\"
    printf "\033Ptmux;\033\033]4;108;rgb:8e/c0/7c\007\033\\"
    printf "\033Ptmux;\033\033]4;208;rgb:fe/80/19\007\033\\"

    printf "\033Ptmux;\033\033]4;88;rgb:9d/00/06\007\033\\"
    printf "\033Ptmux;\033\033]4;100;rgb:79/74/0e\007\033\\"
    printf "\033Ptmux;\033\033]4;136;rgb:b5/76/14\007\033\\"
    printf "\033Ptmux;\033\033]4;24;rgb:07/66/78\007\033\\"
    printf "\033Ptmux;\033\033]4;96;rgb:8f/3f/71\007\033\\"
    printf "\033Ptmux;\033\033]4;66;rgb:42/7b/58\007\033\\"
    printf "\033Ptmux;\033\033]4;130;rgb:af/3a/03\007\033\\"
  else
    printf "\033P\033]4;236;rgb:32/30/2f\007\033\\"
    printf "\033P\033]4;234;rgb:1d/20/21\007\033\\"

    printf "\033P\033]4;235;rgb:28/28/28\007\033\\"
    printf "\033P\033]4;237;rgb:3c/38/36\007\033\\"
    printf "\033P\033]4;239;rgb:50/49/45\007\033\\"
    printf "\033P\033]4;241;rgb:66/5c/54\007\033\\"
    printf "\033P\033]4;243;rgb:7c/6f/64\007\033\\"

    printf "\033P\033]4;244;rgb:92/83/74\007\033\\"
    printf "\033P\033]4;245;rgb:92/83/74\007\033\\"

    printf "\033P\033]4;228;rgb:f2/e5/bc\007\033\\"
    printf "\033P\033]4;230;rgb:f9/f5/d7\007\033\\"

    printf "\033P\033]4;229;rgb:fb/f1/c7\007\033\\"
    printf "\033P\033]4;223;rgb:eb/db/b2\007\033\\"
    printf "\033P\033]4;250;rgb:d5/c4/a1\007\033\\"
    printf "\033P\033]4;248;rgb:bd/ae/93\007\033\\"
    printf "\033P\033]4;246;rgb:a8/99/84\007\033\\"

    printf "\033P\033]4;167;rgb:fb/49/34\007\033\\"
    printf "\033P\033]4;142;rgb:b8/bb/26\007\033\\"
    printf "\033P\033]4;214;rgb:fa/bd/2f\007\033\\"
    printf "\033P\033]4;109;rgb:83/a5/98\007\033\\"
    printf "\033P\033]4;175;rgb:d3/86/9b\007\033\\"
    printf "\033P\033]4;108;rgb:8e/c0/7c\007\033\\"
    printf "\033P\033]4;208;rgb:fe/80/19\007\033\\"

    printf "\033P\033]4;88;rgb:9d/00/06\007\033\\"
    printf "\033P\033]4;100;rgb:79/74/0e\007\033\\"
    printf "\033P\033]4;136;rgb:b5/76/14\007\033\\"
    printf "\033P\033]4;24;rgb:07/66/78\007\033\\"
    printf "\033P\033]4;96;rgb:8f/3f/71\007\033\\"
    printf "\033P\033]4;66;rgb:42/7b/58\007\033\\"
    printf "\033P\033]4;130;rgb:af/3a/03\007\033\\"
  fi

elif [ "$TERM" != "linux" ] && [ "$TERM" != "vt100" ] && [ "$TERM" != "vt220" ]; then

  printf "\033]4;236;rgb:32/30/2f\033\\"
  printf "\033]4;234;rgb:1d/20/21\033\\"

  printf "\033]4;235;rgb:28/28/28\033\\"
  printf "\033]4;237;rgb:3c/38/36\033\\"
  printf "\033]4;239;rgb:50/49/45\033\\"
  printf "\033]4;241;rgb:66/5c/54\033\\"
  printf "\033]4;243;rgb:7c/6f/64\033\\"

  printf "\033]4;244;rgb:92/83/74\033\\"
  printf "\033]4;245;rgb:92/83/74\033\\"

  printf "\033]4;228;rgb:f2/e5/bc\033\\"
  printf "\033]4;230;rgb:f9/f5/d7\033\\"

  printf "\033]4;229;rgb:fb/f1/c7\033\\"
  printf "\033]4;223;rgb:eb/db/b2\033\\"
  printf "\033]4;250;rgb:d5/c4/a1\033\\"
  printf "\033]4;248;rgb:bd/ae/93\033\\"
  printf "\033]4;246;rgb:a8/99/84\033\\"

  printf "\033]4;167;rgb:fb/49/34\033\\"
  printf "\033]4;142;rgb:b8/bb/26\033\\"
  printf "\033]4;214;rgb:fa/bd/2f\033\\"
  printf "\033]4;109;rgb:83/a5/98\033\\"
  printf "\033]4;175;rgb:d3/86/9b\033\\"
  printf "\033]4;108;rgb:8e/c0/7c\033\\"
  printf "\033]4;208;rgb:fe/80/19\033\\"

  printf "\033]4;88;rgb:9d/00/06\033\\"
  printf "\033]4;100;rgb:79/74/0e\033\\"
  printf "\033]4;136;rgb:b5/76/14\033\\"
  printf "\033]4;24;rgb:07/66/78\033\\"
  printf "\033]4;96;rgb:8f/3f/71\033\\"
  printf "\033]4;66;rgb:42/7b/58\033\\"
  printf "\033]4;130;rgb:af/3a/03\033\\"
fi
