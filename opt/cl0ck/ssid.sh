#! /bin/bash

#In this file
#(1)The first boot will scan nearby networks then compile a list of those networks and their relative signal strengths ---- DONE
#(2)It will then create an AP to which the user should connect with their phone (using a QR code)
#(3)When a phone is connected, the screen will display another QR code to the site hosted on the clock to select the AP (or enter details manually)
#(4)Once an AP is selected, username and password need to be entered and saved to the clock
#(5)Location information should also be provided now - myabe use GPS?
#(6)The clock must then try and connect to the AP
#(7)If connected, display success message and start operating normally
#(8)if not connected, display error and rescan networks

echo "send 'finding nearby networks...' to display"
#/IT8951/IT8951 0 0 /opt/cl0ck/images/apscan.bmp

SCAN() {
    echo "performing scan $i"
    # GET LIST WITH STRENGTHS
    sudo iw dev wlan0 scan | egrep 'signal|SSID:' | cut -c2- > /tmp/wifi.lst

    # SEPARATE THE AP SSID's AND THEIR STRENGTHS
    cat /opt/cl0ck/resources/signalstrength.dat | egrep "$(cat /tmp/wifi.lst | egrep '^signal' | awk -F: '{print $2}' | sed 's/.00 dBm//' | awk '{$1=$1};1' | sed 's/-/s/')" | awk '{print $2}' > /tmp/percent.lst
    cat /tmp/wifi.lst | egrep '^SSID:' | awk -F: '{print $2}' | awk '{$1=$1};1' > /tmp/ssid.lst

#    for s in $(cat /tmp/signal.lst)
#    do
#        cat /opt/cl0ck/resources/signalstrength.dat | egrep $s | awk '{print $2}' > /tmp/percent.lst
#    done

    # PUT THEM BACK TOGETHER IN THE CORRECT ORDER
    paste -d' ' /tmp/ssid.lst /tmp/percent.lst > /tmp/tosort.lst

    # SOME MAGIC HERE - PUT LAST FIELD 1st, then all the other fields, then sort by first field, then remove the first field
    awk '{print $NF " " $0}' /tmp/tosort.lst | sort -n -r -k1 | sed 's/^[0-9][0-9]* //' > /tmp/scan-$i.lst
}

# I FIND THAT SCANNING MORE TIMES BRINGS UP MORE APs
for i in 1 2 3 4 5 6 7 8 9
do
    SCAN
done

if [[ $(wc -l /tmp/scan-*.lst | sort -r | grep total | awk '{print $1}') -eq 0 ]];
then
    echo "send 'no networks found' to display"
    #/IT8951/IT8951 0 0 /opt/cl0ck/images/nowifi.bmp
else
    # ADD THE QR CODE WITH AP NAME, USERNAME AND PASSWORD
    #mogrify
    echo "send 'Networs found, connect to clock with phone'"
    #/IT8951/IT8951 0 0 /opt/cl0ck/images/clockconnect.bmp
fi

HIGH=$(wc -l /tmp/scan-*.lst | sort -r | grep -v total | head -n1 | awk '{print $1}' | egrep -o '[1-9]')

cat /tmp/scan-$HIGH.lst

