#! /bin/bash

# Draw picture of the time
convert -size 800x600 xc:white -font Nimbus-Roman-No9-L-Regular-Italic -pointsize 300 -gravity center -draw "text 0,0 '$(date +%H:%M)' " /home/cl0ck/time.bmp

# Send that picture to the display
./IT8951 0 0 /home/cl0ck/time.bmp
