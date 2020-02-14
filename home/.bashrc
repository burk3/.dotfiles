#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[32m\]\u@\h\[\033[34m\] \w \$\[\033[00m\] '
fi

# Put your fun stuff here.
export EDITOR=vim
