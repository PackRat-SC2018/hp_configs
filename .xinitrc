#!/bin/sh

# this file is run when calling startx

# default arch init scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
fi

# user init scripts and settings
[ -r /etc/X11/xinit/.Xmodmap ] && xmodmap /etc/X11/xinit/.Xmodmap
[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.xprofile ] && . ~/.xprofile

# launch the session, commands below this line will be ignored
# exec openbox-session

# Window manager for X session
# to start a different WM, set session="WM" below, or in console run:
# startx ~/.xinitrc WM

# session to run if none passed as first arg ($1)
session="${1:-i3}"

# set environment wm for use in scripts
export WM="$session"

# do NOT put commands below the exec lines
case $session in
    i3)         exec i3 ;;
    openbox)    exec ~/.local/bin/openbox/openbox-session ;;
    dk)         exec dk ;;
    *)          exec "$session" # Unknown, try running it
esac

exit 0 ;
