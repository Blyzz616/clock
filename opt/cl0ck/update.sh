###
#THIS FILE IS DEPRECATED 
# NEW FILE IS UUPDATEDISPLAY.SH
###


#! /bin/bash

H=$(date +%H)
M=$(date +%M)
FACE=$(cat /etc/cl0ck/settings.json | egrep '^\s+"face' | awk -F: '{print $2}' | awk -F, '{print $1}')
FLAVOUR=$(cat /etc/cl0ck/settings.json | egrep '^\s+"flavour' | awk -F: '{print $2}' | awk -F, '{print $1}')
SCHEME=$(cat /etc/cl0ck/settings.json | egrep '^\s+"scheme' | awk -F: '{print $2}' | awk -F, '{print $1}')

# MAYBE BUILD THE IMAGE AND DISPLAY THAT 
# Display the pre-built image
# /IT8951/IT8951 0 0 /tmp/display.bmp
# Then Build the image for the next minute
# importatnt to take into consideration the cycling of minutes at the end of the hour
# and the cycling of the hours at the end of the day
#PDH=$(date +%H) #Pre-Date-Hour
#PDM=$(date +%M) #Pre-Date-Minute
#if [[ $PDM -eq 59 ]];
#then
#	M="00"
#	if [[ $PDH -eq 23 ]];
#	then
#		H="00"
#	else
#		H=$(expr $PDH + 1)
#	fi
#else
#	M=$(expr $PDM + 1)
#fi
#MAKE SURE THERE ARE LEADINF ZEROS!!!
#convert hours/$H.bmp minutes/$M.bmp +append /tmp/display.bmp

# OR JUST DISPLAY THE 2 IMAGES SEPARATELY
/IT8951/IT8951 0 0 /opt/cl0ck/$FACE/$FLAVOUR/$SCHEME/$H.bmp
/IT8951/IT8951 400 0 /opt/cl0ck/$FACE/$FLAVOUR/$SCHEME/$M.bmp
