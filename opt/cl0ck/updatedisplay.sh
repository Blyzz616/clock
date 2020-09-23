#! /bin/bash

CPATH=/opt/cl0ck
WPATH=/opt/cl0ck/weather

touch $WPATH/clouds.csv
touch $WPATH/hourly.out
touch $WPATH/hourstemps.csv
touch $WPATH/now.json
touch $WPATH/owmapi.log
touch $WPATH/rains.csv
touch $WPATH/rains.tmp
touch $WPATH/ready.csv
touch $WPATH/temps.csv
touch $WPATH/times.csv
touch $WPATH/weather.dump
LOGDATE=$(date +%y%m%d)
touch /var/log/cl0ck$LOGDATE.log

echo -e "\n\n\n\n NEW LOG - $(date +%H:%M)" >> /var/log/cl0ck$LOGDATE.log

# WAS THE CL0CK RECENTLY REBOOTED?
READY=$(cat /opt/cl0ck/status.rdy)

# WHICH CLOCK FACE DO YOU FEEL LIKE SEEING TODAY? DIGITAL OR ANALOGUE
FLAVOUR=$(cat /etc/cl0ck/settings.json | grep flavour | awk -F: '{print $2}')

# LIGHT OR DARK?
SCHEME=$(cat /etc/cl0ck/settings.json | grep scheme | awk -F: '{print $2}')

# WHICH FONT FACE?
FACE="-font $(cat /etc/cl0ck/settings.json | grep face | awk -F: '{print $2}')"
SUNFACE="-font $(cat /etc/cl0ck/settings.json | grep sunface | awk -F: '{print $2}')"

# FONT SIZES
TIMESIZE="-pointsize 300"
DATESIZE="-pointsize 50"
WEATHERSIZE="-pointsize 75"
HUMSIZE="-pointsize 50"
SUNSIZE="-pointsize 25"

# WHAT DATE TO DISPLAY
DATEFORMAT=$(cat /etc/cl0ck/settings.json | grep dateformat | awk -F: '{print $2}')

# WHAT SORT OF WEATHER TO DISPLAY
SHOWWEATHER=$(cat /etc/cl0ck/settings.json | grep weather | awk -F: '{print $2}')

# WHERE THE OUTPUT WILL BE SENT
OUT="/tmp/display.bmp"

UPDATE() {
    # SEND IMAGE TO DISPLAY
    echo "sending update to display" >> /var/log/cl0ck$LOGDATE.log
    /IT8951/IT8951 0 0 /tmp/display.bmp
}

# SOMETIMES THE UPDATE DOESN'T COMPLETE, WHEN THIS HAPPENS THE IT8951 PROCESS STAYS OPEN
# AND THEY START BUILDING UP. THIS FUNCTION COUNTS THE NUMBER OF OPEN PROCESSES WITH THE
# IT8951 APP. IF THAT NUMBER IS MORE THAN THREE, IT WILL GO THROUGH THOSE PROCESSES AND
# KILL THEM WITH EXTREME PREDJUDICE.
CLEAN() {
    if [[ $(ps aux | grep IT8951 | grep -v grep | awk '{print $2}' | wc -l) -gt 3 ]];
    then
        echo "Cleaning update processes" >> /var/log/cl0ck$LOGDATE.log
        for p in $(ps aux | grep IT8951 | grep -v grep | awk '{print $2}');
        do
            kill -9 $p
        done
    fi
}
# RUN THIS PROCESS IMMEDIATELY
CLEAN

# GET HOURLY INFO (EVERY 5 MINUTES)
FORECAST() {
    curl -s "https://api.openweathermap.org/data/2.5/onecall?lat=49.05&lon=-122.29&exclude=current,minutely,daily&appid=12cf76465a58356df52c88853dbfe100&units=metric" > /tmp/hourly.out
    echo $(date '+%Y-%m-%d %H:%M') >> $WPATH/owmapi.log
    echo "Curled onecall from owm" >> /var/log/cl0ck$LOGDATE.log

    # MAKE SURE THAT THE FILES ARE THERE AND READY
    rm $WPATH/times.csv
    touch $WPATH/times.csv
    rm $WPATH/temps.csv
    touch $WPATH/temps.csv
    rm $WPATH/rains.tmp
    touch $WPATH/rains.tmp
    rm $WPATH/rains.csv
    touch $WPATH/rains.csv
    rm $WPATH/clouds.csv
    touch $WPATH/clouds.csv
    touch /tmp/hourly.out

    # GET THE TIMES AND TEMPS FROM THE FILE
    FOREDATE=$(cat /tmp/hourly.out | egrep -o '\{\"dt\"\:[0-9]*' | awk -F: '{print $2}')
    FORETEMP=$(cat /tmp/hourly.out | egrep -o '\"temp\"\:[0-9.-]*' | awk -F: '{print $2}')
    FORERAIN=$(cat /tmp/hourly.out | egrep -o 'pop\":[0-9\.]+(,\"rain\":\{\"1h\":[0-9\.]+)?')
    FORECLOUD=$(cat /tmp/hourly.out | egrep -o '\"clouds\":[0-9]+' | awk -F: '{print $2}')

echo "Setting FOREDATE" >> /var/log/cl0ck$LOGDATE.log
for i in $FOREDATE;
do
    # WRITE THE TIMES TO A FILE
    echo $(date -d @$i +%H:%M) >> $WPATH/times.csv
done

echo "Setting FORETEMP" >> /var/log/cl0ck$LOGDATE.log
for i in $FORETEMP;
do
    # WRITE THE TEMPS TO A FILE
    echo $i >> $WPATH/temps.csv
done

echo "Setting FORERAIN" >> /var/log/cl0ck$LOGDATE.log
for i in $FORERAIN;
do
    # WRITE THE RAINS TO A FILE
    echo $i >> $WPATH/rains.tmp
done

echo "Setting FORECLOUD" >> /var/log/cl0ck$LOGDATE.log
for i in $FORECLOUD;
do
    #WRITE THE CLOUDS TO A FILE
    echo $i >> $WPATH/clouds.csv
done

# HOW MANY NUMBERS TO SHOW ON Y1AXIS
# GET MAX TEMP
TEMPMAX=$(printf "%.0f\n" $(cat /opt/cl0ck/weather/temps.csv | sort -u | tail -n1))
# GET MIN TEMP
TEMPMIN=$(printf "%.0f\n" $(cat /opt/cl0ck/weather/temps.csv | sort -u | head -n1))
TEMPDIFF=$(expr $TEMPMAX - $TEMPMIN)
echo "TEMPDIFF = $TEMPDIFF" >> /var/log/cl0ck$LOGDATE.log

echo "Cleaning up rain.tmp to rains.csv" >> /var/log/cl0ck$LOGDATE.log
cat $WPATH/rains.tmp | awk -F: '{print $4}' >> $WPATH/rains.csv

    # REMOVE ALL THE HOURS THAT AREN'T 0,6,12,18
    sed -i -e 's/01:00/ /g' $WPATH/times.csv
    sed -i -e 's/02:00/ /g' $WPATH/times.csv
    sed -i -e 's/03:00/ /g' $WPATH/times.csv
    sed -i -e 's/04:00/ /g' $WPATH/times.csv
    sed -i -e 's/05:00/ /g' $WPATH/times.csv
    sed -i -e 's/07:00/ /g' $WPATH/times.csv
    sed -i -e 's/08:00/ /g' $WPATH/times.csv
    sed -i -e 's/09:00/ /g' $WPATH/times.csv
    sed -i -e 's/10:00/ /g' $WPATH/times.csv
    sed -i -e 's/11:00/ /g' $WPATH/times.csv
    sed -i -e 's/13:00/ /g' $WPATH/times.csv
    sed -i -e 's/14:00/ /g' $WPATH/times.csv
    sed -i -e 's/15:00/ /g' $WPATH/times.csv
    sed -i -e 's/16:00/ /g' $WPATH/times.csv
    sed -i -e 's/17:00/ /g' $WPATH/times.csv
    sed -i -e 's/19:00/ /g' $WPATH/times.csv
    sed -i -e 's/20:00/ /g' $WPATH/times.csv
    sed -i -e 's/21:00/ /g' $WPATH/times.csv
    sed -i -e 's/22:00/ /g' $WPATH/times.csv
    sed -i -e 's/23:00/ /g' $WPATH/times.csv

    #SET 6-HOUR MARKERS
    cp $WPATH/times.csv $TIMES/quarter.csv
    sed -i -e 's/.*:00/1/g' $WPATH/quarter.csv
    sed -i -e 's/^[[:blank:]]*$/0/g' $WPATH/quarter.csv

    # MERGE TIMES, TEMPS, RAINS, CLOUDS AND MARKERS INTO ONE FILE
    echo -e "Pasting \n1) times\n2) temps\n3) rains\n4) clouds\n5) quarter\n to ready.csv" >> /var/log/cl0ck$LOGDATE.log
    paste -d , $WPATH/times.csv $WPATH/temps.csv $WPATH/rains.csv $WPATH/clouds.csv $WPATH/quarter.csv > $WPATH/ready.csv

    # DRAW THE GRAPH
    echo "Getting RAINMAX" >> /var/log/cl0ck$LOGDATE.log
    RAINMAX=$(cat $WPATH/ready.csv | awk -F, '{print $3}' | sort -un | tail -n1)
    echo "RAINMAX = $RAINMAX" >> /var/log/cl0ck$LOGDATE.log

if [[ $TEMPDIFF -le 10 ]];
then
    echo "TEMPDIFF <= 10" >> /var/log/cl0ck$LOGDATE.log
    if (( $(echo "$RAINMAX < 1" | bc -l) ));
    then
    echo "    and RAINMAX < 1" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage1.plot > $WPATH/foregraph.png
    elif (( $(echo "$RAINMAX < 5" | bc -l) ));
    then
    echo "    and RAINMAX < 5" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage5.plot > $WPATH/foregraph.png
    elif (( $(echo "$RAINMAX < 10" | bc -l) ));
    then
    echo "    and RAINMAX < 10" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage10.plot > $WPATH/foregraph.png
    elif (( $(echo "$RAINMAX < 20" | bc -l) ));
    then
    echo "    and RAINMAX < 20" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage20.plot > $WPATH/foregraph.png
    else
    echo "    and RAINMAX > 20" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage.plot > $WPATH/foregraph.png
    fi
else
    echo "TEMPDIFF > 10" >> /var/log/cl0ck$LOGDATE.log
    if (( $(echo "$RAINMAX < 1" | bc -l) ));
    then
    echo "    and RAINMAX < 1" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage1-20.plot > $WPATH/foregraph.png
    elif (( $(echo "$RAINMAX < 5" | bc -l) ));
    then
    echo "    and RAINMAX < 5" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage5-20.plot > $WPATH/foregraph.png
    elif (( $(echo "$RAINMAX < 10" | bc -l) ));
    then
    echo "    and RAINMAX < 10" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage10-20.plot > $WPATH/foregraph.png
    elif (( $(echo "$RAINMAX < 20" | bc -l) ));
    then
    echo "    and RAINMAX < 20" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage20-20.plot > $WPATH/foregraph.png
    else
    echo "    and RAINMAX > 20" >> /var/log/cl0ck$LOGDATE.log
    gnuplot $WPATH/usage-20.plot > $WPATH/foregraph.png
    fi
fi

    # CROP THE GRAPH
    echo "Cropping Graph" >> /var/log/cl0ck$LOGDATE.log
    mogrify -crop 554x147+14+317 $WPATH/foregraph.png
}

WEATHER() {
    echo "Curling Current conditions" >> /var/log/cl0ck$LOGDATE.log
    curl -s "http://api.openweathermap.org/data/2.5/weather?id=5881792&units=metric&appid=12cf76465a58356df52c88853dbfe100" > $WPATH/now.json

    echo "Populating variables for all current conditions" >> /var/log/cl0ck$LOGDATE.log
    OPENWEATHER=$(cat $WPATH/now.json)
    TEMP="$(echo $OPENWEATHER | egrep -o 'temp\":[0-9.]*' | awk -F: '{print $2}' | awk '{print ($0-int($0)<0.499)?int($0):int($0)+1}')°"
    FEELSLIKE=$(echo $OPENWEATHER | egrep -o 'feels\_like\":[0-9.]*' | awk -F: '{print $2}' | awk '{print ($0-int($0)<0.499)?int($0):int($0)+1}')
    TMIN=$(echo $OPENWEATHER | egrep -o 'temp\_min\":[0-9.]*' | awk -F: '{print $2}')
    TMAX=$(echo $OPENWEATHER | egrep -o 'temp\_max\":[0-9.]*' | awk -F: '{print $2}')
    PRESSURE=$(echo $OPENWEATHER | egrep -o 'pressure\":[0-9]*' | awk -F: '{print $2}')
    HUMIDITY=$(echo $OPENWEATHER | egrep -o 'humidity\":[0-9]*' | awk -F: '{print $2}')
    WINDSPEED=$(echo $OPENWEATHER | egrep -o 'speed\":[0-9]*' | awk -F: '{print $2}')
    WINDBEARING=$(echo $OPENWEATHER | egrep -o 'deg\":[0-9]*' | awk -F: '{print $2}')
    ESUNRISE=$(echo $OPENWEATHER | egrep -o 'sunrise\":[0-9]*' | awk -F: '{print $2}')
    ESUNSET=$(echo $OPENWEATHER | egrep -o 'sunset\":[0-9]*' | awk -F: '{print $2}')
    CLOUDS=$(echo $OPENWEATHER | egrep -o 'description\":\"[a-zA-Z ]*' | awk -F: '{print $2}' | cut -c2-)
    ICON=$(echo $OPENWEATHER | egrep -o 'icon\":\"[a-z0-9]*' | awk -F: '{print $2}' | cut -c2-)

    SUNRISE=$(date -d @$ESUNRISE +%H:%M)
    SUNSET=$(date -d @$ESUNSET +%H:%M)

    echo "TEMP = $TEMP°" > $WPATH/weather.dump
    echo "FEELSLIKE = $FEELSLIKE°C" >> $WPATH/weather.dump
    echo "TMIN = $TMIN°C" >> $WPATH/weather.dump
    echo "TMAX = $TMAX°C" >> $WPATH/weather.dump
    echo "PRESSURE = $PRESSURE" >> $WPATH/weather.dump
    echo "HUMIDITY = $HUMIDITY" >> $WPATH/weather.dump
    echo "WINDSPEED = $WINDSPEED" >> $WPATH/weather.dump
    echo "WINDBEARING = $WINDBEARING°" >> $WPATH/weather.dump
    echo "ESUNRISE = $ESUNRISE" >> $WPATH/weather.dump
    echo "ESUNSET = $ESUNSET" >> $WPATH/weather.dump
    echo "SUNRISE = $SUNRISE" >> $WPATH/weather.dump
    echo "SUNSET = $SUNSET" >> $WPATH/weather.dump
    echo "CLOUDS = $CLOUDS" >> $WPATH/weather.dump
    echo "ICON = $ICON" >> $WPATH/weather.dump
    WEATHERICON="$WPATH/img/$ICON.bmp"
}

WEATHER

if [[ $(expr $(date +%M) % 5) -eq 0 ]];
then
    echo "Time is = divisible by 5 - getting forecast" >> /var/log/cl0ck$LOGDATE.log
    FORECAST
elif [[ $READY -eq 0 ]];
then
    echo "There's been a reboot - getting forecast" >> /var/log/cl0ck$LOGDATE.log
    FORECAST
fi

#SOME FONT ALIGNMENT
if [[ $FACE = "Digital-7-MonoItalic" ]];
then
    ALIGN="0,-50"
else
    ALIGN="0,20"
fi

# OK, LET'S BUILD THE IMAGE FOR THE NEXT DISPLAY UPDATE
# FIRST, LET'S FIGURE OUT WHAT THE TIME WILL BE IN A MINUTE

MINUTEPLUS() {
    PDH=$(date +%H) #Pre-Date-Hour
    PDM=$(date +%M) #Pre-Date-Minute

    if [[ $PDM -eq "59" ]];
    then
        M="00"
        if [[ $PDH -eq "23" ]];
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
then
    TODAY=$(date +%a", "%b" "%d", "%Y)
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
DIGITAL() {
    if [[ $DATEFORMAT = "none" ]];
    then
        convert -size 800x600 xc:$CANVAS $FACE $TIMESIZE -gravity center -draw "text $ALIGN '$H:$M' " $OUT
    else
        convert -size 800x600 xc:$CANVAS \
$FACE $TIMESIZE -gravity center -draw "text $ALIGN '$H:$M' " \
$FACE $WEATHERSIZE -gravity northwest -draw "text +100,+15 '$TEMP' " \
$FACE $DATESIZE -gravity southeast -draw "text +20,+40 '$TODAY' " \
$FACE $HUMSIZE -gravity northwest -draw "text +20,+95 '$HUMIDITY' " \
$SUNFACE $SUNSIZE -gravity southwest -draw "text +10,+25 '$SUNRISE' " \
$SUNFACE $SUNSIZE -gravity southwest -draw "text +145,+25 '$SUNSET' " \
$OUT

        composite $WEATHERICON -gravity northwest $OUT /tmp/display_w.bmp
        composite $WPATH/foregraph.png -gravity northeast /tmp/display_w.bmp /tmp/display_g.bmp
        composite $WPATH/img/humidity-50.bmp -gravity northwest -geometry +75+100 /tmp/display_g.bmp /tmp/display_h.bmp
        composite $WPATH/img/sunupdown.bmp -gravity southwest -geometry +45+55 /tmp/display_h.bmp $OUT
        rm /tmp/display_w.bmp
        rm /tmp/display_g.bmp
        rm /tmp/display_h.bmp
    fi
}

# NEXT IS THE ANALOGUE
ANALOGUE() {

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

    # AS WE'VE RUN SOME CODE SINCE REBOOTING, SET THE READY FLAG TO 1
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
