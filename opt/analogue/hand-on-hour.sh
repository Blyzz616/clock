#! /bin/bash

MDEG=$(expr 6 \* $(date +%M))
HDEG=$(expr 30 \* $(date +%H))

if [[ $(cat /etc/cl0ck/settings.json | grep scheme | awk -F: '{print $2}' | awk -F, '{print $1}') -eq "direct" ]];
then
convert -size 800x600 xc:white \
-stroke black -fill white -strokewidth 2 -draw "circle 400.5,300.5 400.5,20.5" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 0 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 30 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 60 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 90 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 120 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 150 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 180 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 210 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 240 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 270 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 300 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate 330 line 0,280 0,260" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate $MDEG line 0,60 0,-240" \
-stroke black -strokewidth 8 -draw "translate 400.5,300.5 rotate $HDEG line 0,40 0,-150" \
/home/cl0ck/tmp/line.bmp
else
convert -size 800x600 xc:black \
-stroke white -fill black -strokewidth 2 -draw "circle 400.5,300.5 400.5,20.5" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 0 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 30 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 60 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 90 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 120 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 150 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 180 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 210 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 240 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 270 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 300 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate 330 line 0,280 0,260" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate $MDEG line 0,60 0,-240" \
-stroke white -strokewidth 8 -draw "translate 400.5,300.5 rotate $HDEG line 0,40 0,-150" \
/home/cl0ck/tmp/line.bmp
fi
