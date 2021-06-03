#!/bin/sh

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi


# start some nice programs

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#  [ -x "$f" ] && . "$f"
# done
# unset f
#fi

#doas .bin/internet.sh 
#setxkbmap -model pc104 -layout tr -variant f 
setxkbmap -layout us -variant engram
sxhkd &
#picom &
#wal -R &
exec bspwm -c $HOME/.config/bspwm/bspwmrc
