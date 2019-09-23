#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lha --color=auto'
alias grep='grep --color=auto'
alias ssh='TERM=xterm-color ssh'
PS1='[\u@\h \W]\$ '

stty -ixon
