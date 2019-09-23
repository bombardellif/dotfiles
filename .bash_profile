#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    xinit ~/.xinitrc -- :0 vt1 -nolisten tcp -br -config nvidia-xorg.conf -configdir nvidia-xorg.conf.d
fi
