#! /bin/bash

UPDATE() {
    # SEND IMAGE TO DISPLAY
    /IT8951/IT8951 0 0 /tmp/display.bmp
}

# WAS THE CL0CK RECENTLY REBOOTED?
READY=$(cat /opt/cl0ck/status.rdy)

# WHICH CLOCK FACE DO YOU FEEL LIKE SEEING TODAY? DIGITAL OR ANALOGUE
FLAVOUR=$(cat /etc/cl0ck/settings.json | grep flavour | awk -F: '{print $2}')

# LIGHT OR DARK?
SCHEME=$(cat /etc/cl0ck/settings.json | grep scheme | awk -F: '{print $2}')

# RESOLUTION
REZ="-size 800x600"
# WHICH FONT FACE?
FACE=$(cat /etc/cl0ck/settings.json | grep face | awk -F: '{print $2}')

# WHERE THE OUTPUT WILL BE SENT
OUT="/tmp/display.bmp"

WORKING="/opt/cl0ck"

# OK, LET'S BUILD THE IMAGE FOR THE NEXT DISPLAY UPDATE
# FIRST, LET'S FIGURE OUT WHAT THE TIME WILL BE IN A MINUTE

MINUTEPLUS() {
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
    H=$PDH
fi
}

MINUTENOW() {
M=$(date +%M)
H=$(date +%H)
}

# NOW TO DO THE HEAVY LIFTING
# FIRST UP IS THE DIGITAL CL0CK
function DIGITAL() {

if [[ $FACE = "Digital-7-Italic" ]];
then
    if [[ ${#M} -eq 1 ]];
    then
        if [[ $SCHEME = "direct" ]];
        then
            # Black on White
            convert -size 800x600 xc:white -font Digital-7-Italic -pointsize 380 -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:0$M' " $OUT
        else
            # White on Black
            convert -size 800x600 xc:black -fill white -font Digital-7-Italic -pointsize 380 -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:0$M' " $OUT
        fi
    else
        if [[ $SCHEME = "direct" ]];
        then
            # Black on White
            convert -size 800x600 xc:white -font Digital-7-Italic -pointsize 380 -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:$M' " $OUT
        else
            # White on Black
            convert -size 800x600 xc:black -fill white -font Digital-7-Italic -pointsize 380 Digital-7-Italic -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:$M' " $OUT
        fi
    fi
elif [[ $FACE = "Roboto-Thin-Italic" ]];
then
    if [[ ${#M} -eq 1 ]];
    then
        if [[ $SCHEME = "direct" ]];
        then
            # Black on White
            convert -size 800x600 xc:white -font Roboto-Thin-Italic -pointsize 300 -gravity center -draw "text 0,0 '$H:0$M' " $OUT
        else
            # White on Black
            convert -size 800x600 xc:black -fill white -font Roboto-Thin-Italic -pointsize 300 -gravity center -draw "text 0,0 '$H:0$M' " $OUT
        fi
    else
        if [[ $SCHEME = "direct" ]];
        then
            # Black on White
            convert -size 800x600 xc:white -font Roboto-Thin-Italic -pointsize 300 -gravity center -draw "text 0,0 '$H:$M' " $OUT
        else
            # White on Black
            convert -size 800x600 xc:black -fill white Roboto-Thin-Italic -pointsize 300 -gravity center -draw "text 0,0 '$H:$M' " $OUT
        fi
    fi
elif [[ $FACE = "Digital-7-MonoItalic" ]];
then
    if [[ ${#M} -eq 1 ]];
    then
        if [[ $SCHEME = "direct" ]];
        then
            # Black on White
            convert -size 800x600 xc:white -font Digital-7-MonoItalic -pointsize 300 -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:0$M' " $OUT
        else
            # White on Black
            convert -size 800x600 xc:black -fill white -font Digital-7-MonoItalic -pointsize 300 -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:0$M' " $OUT
        fi
    else
        if [[ $SCHEME = "direct" ]];
        then
            # Black on White
            convert -size 800x600 xc:white -font Digital-7-MonoItalic -pointsize 300 -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:$M' " $OUT
        else
            # White on Black
            convert -size 800x600 xc:black -fill white Digital-7-MonoItalic -pointsize 300 -gravity center -region 800x600+0-50 -draw "text 0,0 '$H:$M' " $OUT
        fi
    fi
else
    convert -size 800x600 xc:white  -pointsize 30 -gravity center -draw "text 0,0 'Font not found' " $OUT
    echo "Missing font" >> /var/log/cl0ck.err
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
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 6 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 12 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 18 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 24 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 36 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 42 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 48 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 54 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 66 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 72 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 78 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 84 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 96 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 102 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 108 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 114 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 126 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 132 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 138 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 144 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 156 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 162 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 168 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 174 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 186 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 192 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 198 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 204 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 216 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 222 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 228 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 234 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 246 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 252 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 258 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 264 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 276 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 282 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 288 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 294 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 306 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 312 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 318 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 324 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 336 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 342 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 348 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate 354 line 0,280 0,273" \
-stroke black -strokewidth 1 -draw "translate 400.5,300.5 rotate $MDEG line 0,60 0,-240" \
-stroke black -strokewidth 8 -draw "translate 400.5,300.5 rotate $HDEG line 0,40 0,-150" \
$OUT
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
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 6 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 12 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 18 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 24 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 36 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 42 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 48 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 54 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 66 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 72 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 78 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 84 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 96 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 102 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 108 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 114 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 126 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 132 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 138 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 144 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 156 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 162 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 168 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 174 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 186 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 192 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 198 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 204 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 216 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 222 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 228 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 234 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 246 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 252 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 258 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 264 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 276 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 282 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 288 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 294 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 306 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 312 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 318 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 324 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 336 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 342 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 348 line 0,280 0,273" \
-stroke grey -strokewidth 1 -draw "translate 400.5,300.5 rotate 354 line 0,280 0,273" \
-stroke white -strokewidth 3 -draw "translate 400.5,300.5 rotate $MDEG line 0,60 0,-240" \
-stroke white -strokewidth 8 -draw "translate 400.5,300.5 rotate $HDEG line 0,40 0,-150" \
$OUT
fi

}

# IF WE'VE JUST REBOOTED
if [[ $READY = 0 ]];
then
    # SET THE TIME TO NOW
    MINUTENOW
    # RUN THE CODE TO SAVE THE DISPLAY IMAGE
    if [[ $FLAVOUR = "digital" ]];
    then
        DIGITAL
    else
        ANALOGUE
    fi

    # AND UPDATE IT
    UPDATE
    # THEN IMMEDIATELY PREP FOR NEXT UPDAT BY GETTING THE NEXT MINUTE
    MINUTEPLUS
    # AND FIGURING OUT THE CL0CK TYPE AND SAVING THE DISPLAY
    if [[ $FLAVOUR = "digital" ]];
    then
        DIGITAL
    else
        ANALOGUE
    fi

    # AS WE'VE RUN SIME CODE SINCE REBOOTING, SET THE READY FLAG TO 1
    echo "1" > /opt/cl0ck/status.rdy
else
    # THIS IS WHAT HAPPENS IF WE HAVEN'T JUST REBOOTED
    # THERE SHOULD BE AN IMAGE READY TO GO
    UPDATE
    # SET THE TIME TO NEXT MINUTE
    MINUTEPLUS
    # WHAT CLOCK FACE ARE WE GOING TO USE?
    if [[ $FLAVOUR = "digital" ]];
    then
        DIGITAL
    else
        ANALOGUE
    fi
fi

# LEGACY CODE
# THIS IS THE CIRCLE AROUND THE ANALOGUE CL0CK
#-stroke black -fill white -strokewidth 2 -draw "circle 400.5,300.5 400.5,20.5" \
#-stroke white -fill black -strokewidth 2 -draw "circle 400.5,300.5 400.5,20.5" \
# silly code with the circle is (define centre) (define one point on circle)
