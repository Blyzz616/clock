#! /bin/bash

#UPDATE() {
    # SEND IMAGE TO DISPLAY
    #/IT8951/IT8951 0 0 /tmp/display.bmp
#}

WEATHER() {
    curl -s "http://api.openweathermap.org/data/2.5/weather?id=5881792&units=metric&appid=12cf76465a58356df52c88853dbfe100" > /opt/cl0ck/weather/now.json
    OPENWEATHER=$(cat /opt/cl0ck/weather/now.json)
    TEMP=$(echo $OPENWEATHER | egrep -o 'temp\":[0-9.]*' | awk -F: '{print $2}' | awk '{print ($0-int($0)<0.499)?int($0):int($0)+1}')
    FEELSLIKE=$(echo $OPENWEATHER | egrep -o 'feels\_like\":[0-9.]*' | awk -F: '{print $2}' | awk '{print ($0-int($0)<0.499)?int($0):int($0)+1}')
    TMIN=$(echo $OPENWEATHER | egrep -o 'temp\_min\":[0-9.]*' | awk -F: '{print $2}')
    TMAX=$(echo $OPENWEATHER | egrep -o 'temp\_max\":[0-9.]*' | awk -F: '{print $2}')
    PRESSURE=$(echo $OPENWEATHER | egrep -o 'pressure\":[0-9]*' | awk -F: '{print $2}')
    HUMIDITY=$(echo $OPENWEATHER | egrep -o 'humidity\":[0-9]*' | awk -F: '{print $2}')
    WINDSPEED=$(echo $OPENWEATHER | egrep -o 'speed\":[0-9]*' | awk -F: '{print $2}')
    WINDBEARING=$(echo $OPENWEATHER | egrep -o 'deg\":[0-9]*' | awk -F: '{print $2}')
    SUNRISE=$(echo $OPENWEATHER | egrep -o 'sunrise\":[0-9]*' | awk -F: '{print $2}')
    SUNSET=$(echo $OPENWEATHER | egrep -o 'sunset\":[0-9]*' | awk -F: '{print $2}')
    CLOUDS=$(echo $OPENWEATHER | egrep -o 'description\":\"[a-zA-Z ]*' | awk -F: '{print $2}' | cut -c2-)
    ICON=$(echo $OPENWEATHER | egrep -o 'icon\":\"[a-z0-9]*' | awk -F: '{print $2}' | cut -c2-)

    echo "TEMP = $TEMP" > /opt/cl0ck/weather/weather.dump
    echo "FEELSLIKE = $FEELSLIKE" >> /opt/cl0ck/weather/weather.dump
    echo "TMIN = $TMIN" >> /opt/cl0ck/weather/weather.dump
    echo "TMAX = $TMAX" >> /opt/cl0ck/weather/weather.dump
    echo "PRESSURE = $PRESSURE" >> /opt/cl0ck/weather/weather.dump
    echo "HUMIDITY = $HUMIDITY" >> /opt/cl0ck/weather/weather.dump
    echo "WINDSPEED = $WINDSPEED" >> /opt/cl0ck/weather/weather.dump
    echo "WINDBEARING = $WINDBEARING" >> /opt/cl0ck/weather/weather.dump
    echo "SUNRISE = $SUNRISE" >> /opt/cl0ck/weather/weather.dump
    echo "SUNSET = $SUNSET" >> /opt/cl0ck/weather/weather.dump
    echo "CLOUDS = $CLOUDS" >> /opt/cl0ck/weather/weather.dump
    echo "ICON = $ICON" >> /opt/cl0ck/weather/weather.dump
}

# WAS THE CL0CK RECENTLY REBOOTED?
READY=$(cat /opt/cl0ck/status.rdy)

# WHICH CLOCK FACE DO YOU FEEL LIKE SEEING TODAY? DIGITAL OR ANALOGUE
FLAVOUR=$(cat /etc/cl0ck/settings.json | grep flavour | awk -F: '{print $2}')

# LIGHT OR DARK?
SCHEME=$(cat /etc/cl0ck/settings.json | grep scheme | awk -F: '{print $2}')

# WHICH FONT FACE?
FACE="-font $(cat /etc/cl0ck/settings.json | grep face | awk -F: '{print $2}')"
#SOME FONT ALIGNMENT
if [[ $FACE = "Digital-7-MonoItalic" ]];
then
    ALIGN="0,-50"
else
    ALIGN="0,0"
fi
# FONT SIZES
TIMESIZE="-pointsize 300"
DATESIZE="-pointsize 50"

# WHAT DATE TO DISPLAY
DATEFORMAT=$( cat /etc/cl0ck/settings.json | grep dateformat | awk -F: '{print $2}')

# WHERE THE OUTPUT WILL BE SENT
OUT="/tmp/display.bmp"

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
            if [[ ${#H} -eq 1 ]];
            then
                H="0$H"
            fi
        fi
    else
        M=$(expr $PDM + 1)
        if [[ ${#M} -eq 1 ]];
        then
            M="0$M"
        fi
        H=$PDH
    fi
}

MINUTENOW() {
M=$(date +%M)
H=$(date +%H)
}

# SET BACKGROUND COLOURS
if [[ $SCHEME = "direct" ]];
then
    CANVAS="white"
    HANDS="-stroke black"
else
    CANVAS="black -fill white"
    HANDS="-stroke white"
fi

### MIGHT NEED TO UPDATE THE DATE FOR THE PRE-DATE SHIFT (00:00)
# SET DATE FORMAT
if [[ $DATEFORMAT = "full"  ]];
    TODAY=$(date +%A", "%B" "%d", "%Y)
then
    TODAY=$(date +%A", "%B" "%d", "%Y)
elif [[ $DATEFORMAT = "yymmdd"  ]];
then
    TODAY=$(date +%Y-%m-%d)
elif [[ $DATEFORMAT = "ddmmyy"  ]];
then
    TODAY=$(date + %d-%m-%Y)
elif [[ $DATEFORMAT = "mmddyy"  ]];
then
    TODAY=$(date + %m-%d-%Y)
elif [[ $DATEFORMAT = "none" ]];
then
    TODAY=""
else
    echo "Could not determine date format" >> /var/log/cl0ck.err
fi

# NOW TO DO THE HEAVY LIFTING
# FIRST UP IS THE DIGITAL CL0CK
function DIGITAL() {
    if [[ $DATEFORMAT = "none" ]];
    then
        convert -size 800x600 xc:$CANVAS $FACE $TIMESIZE -gravity center -draw "text $ALIGN '$H:$M' " $OUT
    else
        convert -size 800x600 xc:$CANVAS $FACE $TIMESIZE -gravity center -draw "text $ALIGN '$H:$M' " $FACE $DATESIZE -gravity southeast -draw "text -20,+20 '$TODAY' " $OUT
    fi
}

# NEXT IS THE ANALOGUE
function ANALOGUE() {

MDEG=$(expr 6 \* $M)
GEDH=$(expr 30 \* $H)
GEDM=$(echo "scale = 1; 0.5 * $M" | bc)
HDEG=$(echo "scale = 1; $GEDM + $GEDH" | bc)

convert -size 800x600 xc:$CANVAS \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 0 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 30 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 60 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 90 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 120 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 150 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 180 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 210 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 240 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 270 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 300 line 0,280 0,260" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate 330 line 0,280 0,260" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 6 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 12 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 18 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 24 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 36 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 42 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 48 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 54 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 66 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 72 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 78 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 84 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 96 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 102 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 108 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 114 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 126 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 132 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 138 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 144 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 156 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 162 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 168 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 174 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 186 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 192 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 198 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 204 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 216 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 222 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 228 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 234 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 246 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 252 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 258 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 264 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 276 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 282 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 288 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 294 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 306 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 312 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 318 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 324 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 336 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 342 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 348 line 0,280 0,273" \
$HANDS -strokewidth 1 -draw "translate 400.5,300.5 rotate 354 line 0,280 0,273" \
$HANDS -strokewidth 3 -draw "translate 400.5,300.5 rotate $MDEG line 0,60 0,-240" \
$HANDS -strokewidth 8 -draw "translate 400.5,300.5 rotate $HDEG line 0,40 0,-150" \
$OUT

}

# WHAT CLOCK FACE ARE WE GOING TO USE?
#if [[ $FLAVOUR = "digital" ]];
#then
#    DIGITAL
#else
#    ANALOGUE
#fi

# LEGACY CODE
# THIS IS THE CIRCLE AROUND THE ANALOGUE CL0CK
#-stroke black -fill white -strokewidth 2 -draw "circle 400.5,300.5 400.5,20.5" \
#-stroke white -fill black -strokewidth 2 -draw "circle 400.5,300.5 400.5,20.5" \
# silly code with the circle is (define centre) (define one point on circle)

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
    #UPDATE
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
    #UPDATE
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

WEATHER

