#! /bin/bash

continent() {
    CONTINENT=$(whiptail --title "Continent Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your continent" 25 70 8 \
    "1" "<-- Back" \
    "2" "Africa" \
    "3" "Asia" \
    "4" "Australia" \
    "5" "Europe" \
    "6" "North America" \
    "7" "South America" \
    "8" "Skip location" 3>&1 1>&2 2>&3)

    case $CONTINENT in
        1)
            internetyn
            ;;
        2)
            VCONTINENT="    \"continent\": africa,"
            continentafrica
            ;;
        3)
            VCONTINENT="    \"continent\": asia,"
            continentasia
            ;;
        4)
            VCONTINENT="    \"continent\": australia,"
            continentaustralia
            ;;
        5)
            VCONTINENT="    \"continent\": europe,"
            continenteurope
            ;;
        6)
            VCONTINENT="    \"continent\": namerica,"
            continentnamerica
            ;;
        7)
            VCONTINENT="    \"continent\": samerica,"
            continentsamerica
            ;;
        8)
            VCONTINENT="    \"continent\": skipped,"
            ;;
    esac
}

continentafrica() {
    COUNTRY=$(whiptail --title "Country Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your country" 25 70 8 \
    "1" "<-- Back" \
    "2" "Algeria" \
    "3" "Angola" \
    "4" "Benin" \
    "5" "Botswana" \
    "6" "Burkina Faso" \
    "7" "Burundi" \
    "8" "Cameroon" \
    "9" "Cape Verde" \
    "10" "Central African Republic" \
    "11" "Chad" \
    "12" "Comoros" \
    "13" "Republic of the Congo" \
    "14" "Democratic Republic of the Congo" \
    "15" "Côte d'Ivoire" \
    "16" "Djibouti" \
    "17" "Egypt" \
    "18" "Equatorial Guinea" \
    "19" "Eritrea" \
    "20" "Ethiopia" \
    "21" "Gabon" \
    "22" "The Gambia" \
    "23" "Ghana" \
    "24" "Guinea" \
    "25" "Guine" \
    "26" "Kenya" \
    "27" "Lesotho" \
    "28" "Liberia" \
    "29" "Libya" \
    "30" "Madagascar" \
    "31" "Malawi" \
    "32" "Mali" \
    "33" "Mauritania" \
    "34" "Mauritius" \
    "35" "Morocco" \
    "36" "Mozambique" \
    "37" "Namibia" \
    "38" "Niger" \
    "39" "Nigeria" \
    "40" "Rwanda" \
    "41" "São Tomé and Príncipe" \
    "42" "Senegal" \
    "43" "Seychelles" \
    "44" "Sierra Leone" \
    "45" "Somalia" \
    "46" "South Africa" \
    "47" "South Sudan" \
    "48" "Sudan" \
    "49" "Swaziland" \
    "50" "Tanzania" \
    "51" "Togo" \
    "52" "Tunisia" \
    "53" "Uganda" \
    "54" "Western Sahara" \
    "55" "Zambia" \
    "56" "Zimbabwe" 3>&1 1>&2 2>&3)

    case $COUNTRY in
    1)
        continentafrica
        ;;
    2)
        VCOUNTRY="    \"country\": algeria,"
        countrydz
        ;;
    3)
        VCOUNTRY="    \"country\": angola,"
        countryao
        ;;
    4)
        VCOUNTRY="    \"country\": benin,"
        countrybj
        ;;
    5)
        VCOUNTRY="    \"country\": botswana,"
        countrybw
        ;;
    6)
        VCOUNTRY="    \"country\": burkina faso,"
        countrybf
        ;;
    7)
        VCOUNTRY="    \"country\": burundi,"
        countrybi
        ;;
    8)
        VCOUNTRY="    \"country\": cameroon,"
        countrycm
        ;;
    9)
        VCOUNTRY="    \"country\": cape verde,"
        countrycv
        ;;
    10)
        VCOUNTRY="    \"country\": central african republic,"
        countrycf
        ;;
    11)
        VCOUNTRY="    \"country\": chad,"
        countrytd
        ;;
    12)
        VCOUNTRY="    \"country\": comoros,"
        countrykm
        ;;
    13)
        VCOUNTRY="    \"country\": republic of the congo,"
        countrycg
        ;;
    14)
        VCOUNTRY="    \"country\": democratic republic of the congo,"
        countrycd
        ;;
    15)
        VCOUNTRY="    \"country\": côte d'ivoire,"
        countryci
        ;;
    16)
        VCOUNTRY="    \"country\": djibouti,"
        countrydj
        ;;
    17)
        VCOUNTRY="    \"country\": egypt,"
        countryeg
        ;;
    18)
        VCOUNTRY="    \"country\": equatorial guinea,"
        countrygq
        ;;
    19)
        VCOUNTRY="    \"country\": eritrea,"
        countryer
        ;;
    20)
        VCOUNTRY="    \"country\": ethiopia,"
        countryet
        ;;
    21)
        VCOUNTRY="    \"country\": gabon,"
        countryga
        ;;
    22)
        VCOUNTRY="    \"country\": the gambia,"
        countrygm
        ;;
    23)
        VCOUNTRY="    \"country\": ghana,"
        countrygh
        ;;
    24)
        VCOUNTRY="    \"country\": guinea,"
        countrygn
        ;;
    25)
        VCOUNTRY="    \"country\": guinea-bissau,"
        countrygw
        ;;
    26)
        VCOUNTRY="    \"country\": kenya,"
        countryke
        ;;
    27)
        VCOUNTRY="    \"country\": lesotho,"
        countryls
        ;;
    28)
        VCOUNTRY="    \"country\": liberia,"
        countrylr
        ;;
    29)
        VCOUNTRY="    \"country\": libya,"
        countryly
        ;;
    30)
        VCOUNTRY="    \"country\": madagascar,"
        countrymg
        ;;
    31)
        VCOUNTRY="    \"country\": malawi,"
        countrymw
        ;;
    32)
        VCOUNTRY="    \"country\": mali,"
        countryml
        ;;
    33)
        VCOUNTRY="    \"country\": mauritania,"
        countrymr
        ;;
    34)
        VCOUNTRY="    \"country\": mauritius,"
        countrymu
        ;;
    35)
        VCOUNTRY="    \"country\": morocco,"
        countryma
        ;;
    36)
        VCOUNTRY="    \"country\": mozambique,"
        countrymz
        ;;
    37)
        VCOUNTRY="    \"country\": namibia,"
        countryna
        ;;
    38)
        VCOUNTRY="    \"country\": niger,"
        countryne
        ;;
    39)
        VCOUNTRY="    \"country\": nigeria,"
        countryng
        ;;
    40)
        VCOUNTRY="    \"country\": rwanda,"
        countryrw
        ;;
    41)
        VCOUNTRY="    \"country\": são tomé and príncipe,"
        countryst
        ;;
    42)
        VCOUNTRY="    \"country\": senegal,"
        countrysn
        ;;
    43)
        VCOUNTRY="    \"country\": seychelles,"
        countrysc
        ;;
    44)
        VCOUNTRY="    \"country\": sierra leone,"
        countrysl
        ;;
    45)
        VCOUNTRY="    \"country\": somalia,"
        countryso
        ;;
    46)
        VCOUNTRY="    \"country\": south africa,"
        countryza
        ;;
    47)
        VCOUNTRY="    \"country\": south sudan,"
        countryss
        ;;
    48)
        VCOUNTRY="    \"country\": sudan,"
        countrysd
        ;;
    49)
        VCOUNTRY="    \"country\": swaziland,"
        countrysz
        ;;
    50)
        VCOUNTRY="    \"country\": tanzania,"
        countrytz
        ;;
    51)
        VCOUNTRY="    \"country\": togo,"
        countrytg
        ;;
    52)
        VCOUNTRY="    \"country\": tunisia,"
        countrytn
        ;;
    53)
        VCOUNTRY="    \"country\": uganda,"
        countryug
        ;;
    54)
        VCOUNTRY="    \"country\": western sahara,"
        countryeh
        ;;
    55)
        VCOUNTRY="    \"country\": zambia,"
        countryzm
        ;;
    56)
        VCOUNTRY="    \"country\": zimbabwe,"
        countryzw
        ;;
esac
}

#continentasia() {
#
#}
#
#continentaustralia() {
#
#}
#
#continenteurope() {
#
#}
#
#continentnamerica() {
#
#}
#
#continentsamerica() {
#
#}

countrydz(){
    CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Algiers" \
    "3" "Oran" \
    "4" "Constantine" \
    "5" "Annaba" \
    "6" "Blida" \
    "7" "Batna" \
    "8" "Djelfa" \
    "9" "Sétif" \
    "10" "Sidi Bel Abbès" \
    "11" "Biskra" \
    "12" "Tébessa" \
    "13" "El Oued" \
    "14" "Skikda" \
    "15" "Tiaret" \
    "16" "Béjaïa" \
    "17" "Tlemcen" \
    "18" "Ouargla" \
    "19" "Béchar" \
    "20" "Mostaganem" \
    "21" "Bordj Bou Arréridj" \
    "22" "Chlef" \
    "23" "Souk Ahras" \
    "24" "Médéa" \
    "25" "El Eulma" \
    "26" "Touggourt" \
    "27" "Ghardaïa" \
    "28" "Saïda" \
    "29" "Laghouat" \
    "30" "M'Sila" \
    "31" "Jijel" \
    "32" "Relizane" \
    "33" "Guelma" \
    "34" "Aïn Béïda" \
    "35" "Khenchela" \
    "36" "Bousaada" \
    "37" "Mascara" \
    "38" "Tindouf" \
    "39" "Tizi Ouzou" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Algiers,"
        ;;
    3)
        VCITY="    \"city\": Oran,"
        ;;
    4)
        VCITY="    \"city\": Constantine,"
        ;;
    5)
        VCITY="    \"city\": Annaba,"
        ;;
    6)
        VCITY="    \"city\": Blida,"
        ;;
    7)
        VCITY="    \"city\": Batna,"
        ;;
    8)
        VCITY="    \"city\": Djelfa,"
        ;;
    9)
        VCITY="    \"city\": Sétif,"
        ;;
    10)
        VCITY="    \"city\": Sidi Bel Abbès,"
        ;;
    11)
        VCITY="    \"city\": Biskra,"
        ;;
    12)
        VCITY="    \"city\": Tébessa,"
        ;;
    13)
        VCITY="    \"city\": El Oued,"
        ;;
    14)
        VCITY="    \"city\": Skikda,"
        ;;
    15)
        VCITY="    \"city\": Tiaret,"
        ;;
    16)
        VCITY="    \"city\": Béjaïa,"
        ;;
    17)
        VCITY="    \"city\": Tlemcen,"
        ;;
    18)
        VCITY="    \"city\": Ouargla,"
        ;;
    19)
        VCITY="    \"city\": Béchar,"
        ;;
    20)
        VCITY="    \"city\": Mostaganem,"
        ;;
    21)
        VCITY="    \"city\": Bordj Bou Arréridj,"
        ;;
    22)
        VCITY="    \"city\": Chlef,"
        ;;
    23)
        VCITY="    \"city\": Souk Ahras,"
        ;;
    24)
        VCITY="    \"city\": Médéa,"
        ;;
    25)
        VCITY="    \"city\": El Eulma,"
        ;;
    26)
        VCITY="    \"city\": Touggourt,"
        ;;
    27)
        VCITY="    \"city\": Ghardaïa,"
        ;;
    28)
        VCITY="    \"city\": Saïda,"
        ;;
    29)
        VCITY="    \"city\": Laghouat,"
        ;;
    30)
        VCITY="    \"city\": M'Sila,"
        ;;
    31)
        VCITY="    \"city\": Jijel,"
        ;;
    32)
        VCITY="    \"city\": Relizane,"
        ;;
    33)
        VCITY="    \"city\": Guelma,"
        ;;
    34)
        VCITY="    \"city\": Aïn Béïda,"
        ;;
    35)
        VCITY="    \"city\": Khenchela,"
        ;;
    36)
        VCITY="    \"city\": Bousaada,"
        ;;
    37)
        VCITY="    \"city\": Mascara,"
        ;;
    38)
        VCITY="    \"city\": Tindouf,"
        ;;
    39)
        VCITY="    \"city\": Tizi Ouzou,"
        ;;
    esac
}

countryao(){
    CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Luanda" \
    "3" "Cabinda" \
    "4" "Huambo" \
    "5" "Lubango" \
    "6" "Kuito" \
    "7" "Malanje" \
    "8" "Lobito" \
    "9" "Benguela" \
    "10" "Uíge" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Luanda,"
        ;;
    3)
        VCITY="    \"city\": Cabinda,"
        ;;
    4)
        VCITY="    \"city\": Huambo,"
        ;;
    5)
        VCITY="    \"city\": Lubango,"
        ;;
    6)
        VCITY="    \"city\": Kuito,"
        ;;
    7)
        VCITY="    \"city\": Malanje,"
        ;;
    8)
        VCITY="    \"city\": Lobito,"
        ;;
    9)
        VCITY="    \"city\": Benguela,"
        ;;
    10)
        VCITY="    \"city\": Uíge,"
        ;;
    esac
}

countrybj(){
    CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Cotonou" \
    "3" "Porto-Novo" \
    "4" "Parakou" \
    "5" "Djougou" \
    "6" "Bohicon" \
    "7" "Kandi" \
    "8" "Abomey" \
    "9" "Natitingou" \
    "10" "Lokossa" \
    "11" "Ouidah" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        <-- continentafrica
        ;;
    2)
        VCITY="    \"city\": cotonou,"
        ;;
    3)
        VCITY="    \"city\": porto-novo,"
        ;;
    4)
        VCITY="    \"city\": parakou,"
        ;;
    5)
        VCITY="    \"city\": djougou,"
        ;;
    6)
        VCITY="    \"city\": bohicon,"
        ;;
    7)
        VCITY="    \"city\": kandi,"
        ;;
    8)
        VCITY="    \"city\": abomey,"
        ;;
    9)
        VCITY="    \"city\": natitingou,"
        ;;
    10)
        VCITY="    \"city\": lokossa,"
        ;;
    11)
        VCITY="    \"city\": ouidah,"
        ;;
    esac
}

countrybf(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Ouagadougou" \
    "3" "Bobo Dioulasso" \
    "4" "Banfora" \
    "5" "Koudougou" \
    "6" "Ouahigouya" \
    "7" "Kaya" \
    "8" "Fada N'gourma" \
    "9" "Tenkodogo" \
    "10" "Houndé" \
    "11" "Dédougou" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        <-- continentafrica
        ;;
    2)
        VCITY="    \"city\": ouagadougou,"
        ;;
    3)
        VCITY="    \"city\": bobo dioulasso,"
        ;;
    4)
        VCITY="    \"city\": banfora,"
        ;;
    5)
        VCITY="    \"city\": koudougou,"
        ;;
    6)
        VCITY="    \"city\": ouahigouya,"
        ;;
    7)
        VCITY="    \"city\": kaya,"
        ;;
    8)
        VCITY="    \"city\": fada n'gourma,"
        ;;
    9)
        VCITY="    \"city\": tenkodogo,"
        ;;
    10)
        VCITY="    \"city\": houndé,"
        ;;
    11)
        VCITY="    \"city\": dédougou,"
        ;;
    esac
}

internetyn(){
        whiptail --backtitle "$BACKTITLE" --yesno "Do you want to connect your ePuncta to the internet (WiFi)?" --yes-button "Yes" --no-button "No" 10 70
        [[ $? == 0 ]] && ssidselect || netcancel
}

ssidselect(){
        WNL=()  # declare list array to be built up
        SSIDLIST=$(iwlist wlan0 scan | grep ESSID | sed 's/.*:"//;s/"//') # get list of available SSIDs
        while read -r LINE; do
                WNL+=("$LINE" "$LINE") # append each SSID to the WNL array
        done <<< "$SSIDLIST" # feed in the SSIDLIST to the while loop
        SSID=$(whiptail --notags --backtitle "$BACKTITLE" --menu "Select WiFi Network" 20 80 10 "${WNL[@]}" 3>&1 1>&2 2>&3) # display whiptail menu listing out available SSIDs
        VSSID="    \"ssid\": $SSID,"
        [[ -z $SSID ]] && netcancel || wifipass
}

netcancel() {
        whiptail --backtitle "$BACKTITLE" --yesno "Canceling Wi-Fi Selection will put \nyour $BACKTITLE in Offline mode? \n\n Are you sure?" --yes-button "Yes (offline)" --no-button "No (Set up Wi-Fi)" 10 70
        [[ $? == 0 ]] && continent || ssidselect
}

wifipass(){
        WPASSWORD=$(whiptail --backtitle "$BACKTITLE" --passwordbox "Please enter your Wi-Fi password" 8 78 --title "Password for $SSID" 3>&1 1>&2 2>&3)
        [[ $? -ne 0 ]] && ssidselect || VPASS="    \"wifipass\": $WPASSWORD,"
        netsetup
}

ipaddress() {
        whiptail --backtitle "$BACKTITLE" --yesno "Would you like to set your IP address manually?\nOr would you like the $BACKTITLE to get\nan IP address automatically? (DHCP)" --yes-button "Manual" --no-button "DHCP" 10 70
        [[ $? == 0 ]] && manualip || dhcp
}

manualip() {
        IP=$(whiptail --backtitle "$BACKTITLE" --inputbox "Enter IP Address:" 10 30 3>&1 1>&2 2>&3)
        MASK=$(whiptail --backtitle "$BACKTITLE" --inputbox "Enter netmask (usually 24):" 10 30 3>&1 1>&2 2>&3)
        ROUTER=$(whiptail --backtitle "$BACKTITLE" --inputbox "Enter Router Address:" 10 30 3>&1 1>&2 2>&3)
        DNS1=$(whiptail --backtitle "$BACKTITLE" --inputbox "Enter Primary DNS Address:" 10 30 3>&1 1>&2 2>&3)
        DNS2=$(whiptail --backtitle "$BACKTITLE" --inputbox "Enter Secondary DNS Address:" 10 30 3>&1 1>&2 2>&3)
        setip
}

setip() {
        cp /opt/files/dchpcd.conf /etc/dhcpcd.conf_
        echo "interface wlan0" >> /etc/dhcpcd.conf_
        echo "static ip_address=$IP/$MASK" >> /etc/dhcpcd.conf_
        echo "static routers=$ROUTER" >> /etc/dhcpcd.conf_
        echo "static domain_name_servers=$DNS1 $DNS2" >> /etc/dhcpcd.conf_
        netsetup
}

dhcp() {
        cp /opt/files/dhcpcd.conf /etc/dhcpcd.conf
        netsetup
}

netsetup() {
        echo "country=CA" > /etc/wpa_supplicant/wpa_supplicant.conf_
        echo "network={" >> /etc/wpa_supplicant/wpa_supplicant.conf_
        echo "       ssid=\"$SSID\"" >> /etc/wpa_supplicant/wpa_supplicant.conf_
        echo "       psk=\"$WPASSWORD\"" >> /etc/wpa_supplicant/wpa_supplicant.conf_
        echo "       key_mgmt=WPA-PSK" >> /etc/wpa_supplicant/wpa_supplicant.conf_
        echo "    }" >> /etc/wpa_supplicant/wpa_supplicant.conf_

        continent
}

BACKTITLE="ePuncta"
SETTINGS="/etc/epuncta/settings.json"
#[[ ! -d /etc/upuncta ]] && mkdir /etc/epuncta
touch $SETTINGS
VSTART="{"
VEND="}"
internetyn

echo $VSTART > $SETTINGS
echo $VCONTINENT >> $SETTINGS
echo $VCOUNTRY >> $SETTINGS
echo $VCITY >> $SETTINGS
[[ ! -z $VSSID ]] && echo $VSSID >> $SETTINGS || echo "    \"wifi\": disabled," >> $SETTINGS
echo $VPASS >> $SETTINGS
echo $VEND >> $SETTINGS
echo $PASSWORD
