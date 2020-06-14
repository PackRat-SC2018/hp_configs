#!/bin/sh
#
pgrep conky &>/dev/null; [ $? = 0 ] && killall conky
pgrep picom &>/dev/null; [ $? = 0 ] && killall picom
pkill -x polybar
#
# conky -p2 -dc /home/doug/conky/conkyvertrc &
# conky -p2 -dc /home/doug/conky/conkyfluxboxrc &
conky -p2 -dc /home/doug/conky/conkyfvwmrc &

exit 0;

