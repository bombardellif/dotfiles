#!/bin/bash
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f ${sysresources} ]; then
    xrdb -merge ${sysresources}
fi

if [ -f ${sysmodmap} ]; then
    xmodmap ${sysmodmap}
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# load additional configs
if [ -d /etc/X11/xinit/nvidia-xinitrc.d ] ; then
 for f in /etc/X11/xinit/nvidia-xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export LD_LIBRARY_PATH=/usr/lib64/nvidia/:/usr/lib32/nvidia:/usr/lib:${LD_LIBRARY_PATH}
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

numlockx
i3

if [ $# -gt 0 ]
  then
 $*
fi
