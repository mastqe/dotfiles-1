#!/bin/bash
TMPBG=/tmp/screen.png
LOCK=$HOME/.dotfiles/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
[ "$1" = "off" ] && $(sleep 2 && xset dpms force off) &

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=10:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet

i3lock -ef -i $TMPBG
rm $TMPBG
