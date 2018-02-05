#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# merge X Server settings
xrdb -merge ~/.Xresources

# run pcmanfm in daemon mode in the background
pcmanfm -d &
udiskie &
exec i3
