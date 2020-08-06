#! /bin/bash

#SEND IMAGE TO DISPLAY
#/IT8951/IT8951 0 0 /tmp/display.bmp

# WHICH CLOCK FACE DO YOU FEEL LIKE SEEING TODAY? DIGITAL OR ANALOGUE
FLAVOUR=$(cat /etc/cl0ck/settings.json | grep flavour | awk -F: '{print $2}')

#LIGHT OR DARK?
SCHEME=$(cat /etc/cl0ck/settings.json | grep scheme | awk -F: '{print $2}')

# OK, LET'S BUILD THE IMAGE FOR THE NEXT DISPLAY UPDATE
# FIRST, LET'S FIGURE OUT WHAT THE TIME WILL BE IN A MINUTE

PDH=$(date +%H) #Pre-Date-Hour
PDM=$(date +%M) #Pre-Date-Minute
if [[ $PDM -eq 59 ]];
then
        M="00"
        if [[ $PDH -eq 23 ]];
        then
                H="00"
        else
                H=$(expr $PDH + 1)
        fi
else
        M=$(expr $PDM + 1)
fi

# NOW TO DO THE HEAVY LIFTING
# FIRST UP IS THE DIGITAL CL0CK
function DIGITAL() {

if [[ $SCHEME = "direct" ]];
then
    # Simple Vanilla Clock
    convert -size 800x600 xc:white -font Nimbus-Roman-No9-L-Regular-Italic -pointsize 300 -gravity center -draw "text 0,0 '$H:$M' " /tmp/display.bmp
else
    # Inverse Vanilla
    convert -size 800x600 xc:black -fill white -font Nimbus-Roman-No9-L-Regular-Italic -pointsize 300 -gravity center -draw "text 0,0 '$H:$M' " /tmp/display.bmp
fi

}

# NEXT IS THE ANALOGUE
function ANALOGUE() {

MDEG=$(expr 6 \* $M)
GEDH=$(expr 30 \* $H)
GEDM=$(echo "scale = 1; 0.5 * $M" | bc)
HDEG=$(echo "scale = 1; $GEDM + $GEDH" | bc)

if [[ $SCHEME = "direct" ]];
then
    convert -size 800x600 xc:white \
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
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 6 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 12 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 18 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 24 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 36 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 42 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 48 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 54 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 66 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 72 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 78 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 84 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 96 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 102 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 108 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 114 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 126 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 132 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 138 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 144 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 156 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 162 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 168 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 174 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 186 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 192 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 198 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 204 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 216 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 222 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 228 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 234 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 246 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 252 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 258 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 264 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 276 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 282 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 288 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 294 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 306 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 312 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 318 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 324 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 336 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 342 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 348 line 0,280 0,270" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 354 line 0,280 0,270" \
-stroke black -strokewidth 3 -draw "translate 400.5,300.5 rotate $MDEG line 0,60 0,-240" \
-stroke black -strokewidth 8 -draw "translate 400.5,300.5 rotate $HDEG line 0,40 0,-150" \
/tmp/display.bmp
else
    convert -size 800x600 xc:black \
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
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 6 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 12 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 18 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 24 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 36 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 42 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 48 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 54 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 66 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 72 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 78 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 84 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 96 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 102 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 108 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 114 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 126 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 132 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 138 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 144 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 156 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 162 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 168 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 174 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 186 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 192 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 198 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 204 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 216 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 222 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 228 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 234 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 246 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 252 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 258 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 264 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 276 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 282 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 288 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 294 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 306 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 312 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 318 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 324 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 336 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 342 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 348 line 0,280 0,270" \
-stroke white -strokewidth 1 -draw "translate 400.5,300.5 rotate 354 line 0,280 0,270" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate $MDEG line 0,60 0,-240" \
-stroke white -strokewidth 8 -draw "translate 400.5,300.5 rotate $HDEG line 0,40 0,-150" \
/tmp/display.bmp
fi

}

# WHAT CLOCK FACE ARE WE GOING TO USE?
if [[ $FLAVOUR = "digital" ]];
then
    DIGITAL
else
    ANALOGUE
fi
