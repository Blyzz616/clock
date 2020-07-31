Vanilla

# Simple Vanilla Clock
convert -size 800x600 xc:white -font Nimbus-Roman-No9-L-Regular-Italic -pointsize 300 -gravity center -draw "text 0,0 '$(date +%H:%M)' " /tmp/display.bmp

![Time Display](readme/display.bmp?raw=true "Time Display")

# Inverse Vanilla
convert -size 800x600 xc:black -fill white -font Nimbus-Roman-No9-L-Regular-Italic -pointsize 300 -gravity center -draw "text 0,0 '$(date +%H:%M)' " /tmp/display.bmp

![Time Display1](readme/display1.bmp?raw=true "Time Display1")

# Send to Display
/IT8951/IT8951 0 0 /tmp/display.bmp
