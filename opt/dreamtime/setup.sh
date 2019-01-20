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
    COUNTRY=$(whiptail --title "Country Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your country" 25 70 17 \
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
    "56" "Zimbabwe"  3>&1 1>&2 2>&3)

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
#}

#continentaustralia() {
#}

#continenteurope() {
#}

#continentnamerica() {
#}

#continentsamerica() {
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
    "11" "Biskra"  3>&1 1>&2 2>&3)

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

countrycm(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
   "1" "<-- Back" \
   "2" "Douala" \
   "3" "Yaoundé" \
   "4" "Bamenda" \
   "5" "Bafoussam" \
   "6" "Garoua" \
   "7" "Maroua" \
   "8" "Kumba" \
   "9" "Ngaoundéré" \
   "10" "Nkongsamba" \
   "11" "Buea" 3>&1 1>&2 2>&3)
    
    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Douala,"
        ;;
    3)
        VCITY="    \"city\": Yaoundé,"
        ;;
    4)
        VCITY="    \"city\": Bamenda,"
        ;;
    5)
        VCITY="    \"city\": Bafoussam,"
        ;;
    6)
        VCITY="    \"city\": Garoua,"
        ;;
    7)
        VCITY="    \"city\": Maroua,"
        ;;
    8)
        VCITY="    \"city\": Kumba,"
        ;;
    9)
        VCITY="    \"city\": Ngaoundéré,"
        ;;
    10)
        VCITY="    \"city\": Nkongsamba,"
        ;;
    11)
        VCITY="    \"city\": Buea,"
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
        continentafrica
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
        continentafrica
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

countrycv(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Ribeira da Barca" \
    "3" "Achada Falcão" \
    "4" "Achada Monte" \
    "5" "Palmeira" \
    "6" "Rabil" \
    "7" "Achada Tenda" \
    "8" "Chã de Tanque" \
    "9" "Calheta" \
    "10" "Ponta Verde" \
    "11" "Ribeira da Prata" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Ribeira da Barca,"
        ;;
    3)
        VCITY="    \"city\": Achada Falcão,"
        ;;
    4)
        VCITY="    \"city\": Achada Monte,"
        ;;
    5)
        VCITY="    \"city\": Palmeira,"
        ;;
    6)
        VCITY="    \"city\": Rabil,"
        ;;
    7)
        VCITY="    \"city\": Achada Tenda,"
        ;;
    8)
        VCITY="    \"city\": Chã de Tanque,"
        ;;
    9)
        VCITY="    \"city\": Calheta,"
        ;;
    10)
        VCITY="    \"city\": Ponta Verde,"
        ;;
    11)
        VCITY="    \"city\": Ribeira da Prata,"
        ;;
    esac
}

countrycf(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Bangui" \
    "3" "Bimbo" \
    "4" "Berbérati" \
    "5" "Carnot" \
    "6" "Bambari" \
    "7" "Bouar" \
    "8" "Bossangoa" \
    "9" "Bria" \
    "10" "Bangassou" \
    "11" "Nola" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Bangui,"
        ;;
    3)
        VCITY="    \"city\": Bimbo,"
        ;;
    4)
        VCITY="    \"city\": Berbérati,"
        ;;
    5)
        VCITY="    \"city\": Carnot,"
        ;;
    6)
        VCITY="    \"city\": Bambari,"
        ;;
    7)
        VCITY="    \"city\": Bouar,"
        ;;
    8)
        VCITY="    \"city\": Bossangoa,"
        ;;
    9)
        VCITY="    \"city\": Bria,"
        ;;
    10)
        VCITY="    \"city\": Bangassou,"
        ;;
    11)
        VCITY="    \"city\": Nola,"
        ;;
    esac
}

countrytd(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "N'Djamena" \
    "3" "Moundou" \
    "4" "Sarh" \
    "5" "Abéché" \
    "6" "Kélo" \
    "7" "Koumra" \
    "8" "Pala" \
    "9" "Am Timan" \
    "10" "Mongo" \
    "11" "Bongor" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": N'Djamena,"
        ;;
    3)
        VCITY="    \"city\": Moundou,"
        ;;
    4)
        VCITY="    \"city\": Sarh,"
        ;;
    5)
        VCITY="    \"city\": Abéché,"
        ;;
    6)
        VCITY="    \"city\": Kélo,"
        ;;
    7)
        VCITY="    \"city\": Koumra,"
        ;;
    8)
        VCITY="    \"city\": Pala,"
        ;;
    9)
        VCITY="    \"city\": Am Timan,"
        ;;
    10)
        VCITY="    \"city\": Mongo,"
        ;;
    11)
        VCITY="    \"city\": Bongor,"
        ;;
    esac
}

countrykm(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Moroni" \
    "3" "Moutsamoudou" \
    "4" "Fomboni" \
    "5" "Domoni" \
    "6" "Tsimbeo" \
    "7" "Adda-Douéni" \
    "8" "Sima" \
    "9" "Ouani" \
    "10" "Mirontsi" \
    "11" "Mkiriwadjumoi" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Moroni,"
        ;;
    3)
        VCITY="    \"city\": Moutsamoudou,"
        ;;
    4)
        VCITY="    \"city\": Fomboni,"
        ;;
    5)
        VCITY="    \"city\": Domoni,"
        ;;
    6)
        VCITY="    \"city\": Tsimbeo,"
        ;;
    7)
        VCITY="    \"city\": Adda-Douéni,"
        ;;
    8)
        VCITY="    \"city\": Sima,"
        ;;
    9)
        VCITY="    \"city\": Ouani,"
        ;;
    10)
        VCITY="    \"city\": Mirontsi,"
        ;;
    11)
        VCITY="    \"city\": Mkiriwadjumoi,"
        ;;
    esac
}

countrycg(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Brazzaville" \
    "3" "Pointe-Noire" \
    "4" "Dolisie" \
    "5" "Kayes" \
    "6" "Owando" \
    "7" "Ouésso" \
    "8" "Loandjili" \
    "9" "Madingou" \
    "10" "Gamboma" \
    "11" "Impfondo" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Brazzaville,"
        ;;
    3)
        VCITY="    \"city\": Pointe-Noire,"
        ;;
    4)
        VCITY="    \"city\": Dolisie,"
        ;;
    5)
        VCITY="    \"city\": Kayes,"
        ;;
    6)
        VCITY="    \"city\": Owando,"
        ;;
    7)
        VCITY="    \"city\": Ouésso,"
        ;;
    8)
        VCITY="    \"city\": Loandjili,"
        ;;
    9)
        VCITY="    \"city\": Madingou,"
        ;;
    10)
        VCITY="    \"city\": Gamboma,"
        ;;
    11)
        VCITY="    \"city\": Impfondo,"
        ;;
    esac
}

countrycd(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Kinshasa" \
    "3" "Lubumbashi" \
    "4" "Mbuji-Mayi" \
    "5" "Bukavu" \
    "6" "Kananga" \
    "7" "Kisangani" \
    "8" "Tshikapa" \
    "9" "Kolwezi" \
    "10" "Likasi" \
    "11" "Goma" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Kinshasa,"
        ;;
    3)
        VCITY="    \"city\": Lubumbashi,"
        ;;
    4)
        VCITY="    \"city\": Mbuji-Mayi,"
        ;;
    5)
        VCITY="    \"city\": Bukavu,"
        ;;
    6)
        VCITY="    \"city\": Kananga,"
        ;;
    7)
        VCITY="    \"city\": Kisangani,"
        ;;
    8)
        VCITY="    \"city\": Tshikapa,"
        ;;
    9)
        VCITY="    \"city\": Kolwezi,"
        ;;
    10)
        VCITY="    \"city\": Likasi,"
        ;;
    11)
        VCITY="    \"city\": Goma,"
        ;;
    esac
}

countryci(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Abidjan" \
    "3" "Bouaké" \
    "4" "Daloa" \
    "5" "Korhogo" \
    "6" "Yamoussoukro" \
    "7" "San-Pédro" \
    "8" "Gagnoa" \
    "9" "Man" \
    "10" "Divo" \
    "11" "Anyama" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Abidjan,"
        ;;
    3)
        VCITY="    \"city\": Bouaké,"
        ;;
    4)
        VCITY="    \"city\": Daloa,"
        ;;
    5)
        VCITY="    \"city\": Korhogo,"
        ;;
    6)
        VCITY="    \"city\": Yamoussoukro,"
        ;;
    7)
        VCITY="    \"city\": San-Pédro,"
        ;;
    8)
        VCITY="    \"city\": Gagnoa,"
        ;;
    9)
        VCITY="    \"city\": Man,"
        ;;
    10)
        VCITY="    \"city\": Divo,"
        ;;
    11)
        VCITY="    \"city\": Anyama,"
        ;;
    esac
}

countrydj(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Djibouti" \
    "3" "Ali Sabieh" \
    "4" "Dikhil" \
    "5" "Tadjoura" \
    "6" "Arta" \
    "7" "Obock" \
    "8" "Ali Adde" \
    "9" "Holhol" \
    "10" "Airolaf" \
    "11" "Randa" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Djibouti,"
        ;;
    3)
        VCITY="    \"city\": Ali Sabieh,"
        ;;
    4)
        VCITY="    \"city\": Dikhil,"
        ;;
    5)
        VCITY="    \"city\": Tadjoura,"
        ;;
    6)
        VCITY="    \"city\": Arta,"
        ;;
    7)
        VCITY="    \"city\": Obock,"
        ;;
    8)
        VCITY="    \"city\": Ali Adde,"
        ;;
    9)
        VCITY="    \"city\": Holhol,"
        ;;
    10)
        VCITY="    \"city\": Airolaf,"
        ;;
    11)
        VCITY="    \"city\": Randa,"
        ;;
    esac
}

countryeg(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Cairo" \
    "3" "Alexandria" \
    "4" "Giza" \
    "5" "Shubra El Kheima" \
    "6" "Port Said" \
    "7" "Suez" \
    "8" "Mansoura" \
    "9" "El Mahalla El Kubra" \
    "10" "Tanta" \
    "11" "Faiyum" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Cairo,"
        ;;
    3)
        VCITY="    \"city\": Alexandria,"
        ;;
    4)
        VCITY="    \"city\": Giza,"
        ;;
    5)
        VCITY="    \"city\": Shubra El Kheima,"
        ;;
    6)
        VCITY="    \"city\": Port Said,"
        ;;
    7)
        VCITY="    \"city\": Suez,"
        ;;
    8)
        VCITY="    \"city\": Mansoura,"
        ;;
    9)
        VCITY="    \"city\": El Mahalla El Kubra,"
        ;;
    10)
        VCITY="    \"city\": Tanta,"
        ;;
    11)
        VCITY="    \"city\": Faiyum,"
        ;;
    esac
}

countrygq(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Bata" \
    "3" "Malabo" \
    "4" "Ebebiyín" \
    "5" "Aconibe" \
    "6" "Añisoc" \
    "7" "Luba" \
    "8" "Evinayong" \
    "9" "Mongomo" \
    "10" "Mengomeyén" \
    "11" "Micomeseng" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Bata,"
        ;;
    3)
        VCITY="    \"city\": Malabo,"
        ;;
    4)
        VCITY="    \"city\": Ebebiyín,"
        ;;
    5)
        VCITY="    \"city\": Aconibe,"
        ;;
    6)
        VCITY="    \"city\": Añisoc,"
        ;;
    7)
        VCITY="    \"city\": Luba,"
        ;;
    8)
        VCITY="    \"city\": Evinayong,"
        ;;
    9)
        VCITY="    \"city\": Mongomo,"
        ;;
    10)
        VCITY="    \"city\": Mengomeyén,"
        ;;
    11)
        VCITY="    \"city\": Micomeseng,"
        ;;
    esac
}

countryer(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Asmara" \
    "3" "Keren" \
    "4" "Massawa" \
    "5" "Assab" \
    "6" "Mendefera" \
    "7" "Barentu" \
    "8" "Adi Keyh" \
    "9" "Edd" \
    "10" "Dek’emhāre" \
    "11" "Ak’ordat" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Asmara,"
        ;;
    3)
        VCITY="    \"city\": Keren,"
        ;;
    4)
        VCITY="    \"city\": Massawa,"
        ;;
    5)
        VCITY="    \"city\": Assab,"
        ;;
    6)
        VCITY="    \"city\": Mendefera,"
        ;;
    7)
        VCITY="    \"city\": Barentu,"
        ;;
    8)
        VCITY="    \"city\": Adi Keyh,"
        ;;
    9)
        VCITY="    \"city\": Edd,"
        ;;
    10)
        VCITY="    \"city\": Dek’emhāre,"
        ;;
    11)
        VCITY="    \"city\": Ak’ordat,"
        ;;
    esac
}

countryet(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Addis Ababa" \
    "3" "Gondar" \
    "4" "Mek'ele" \
    "5" "Adama" \
    "6" "Hawassa" \
    "7" "Bahir Dar" \
    "8" "Dire Dawa" \
    "9" "Dessie" \
    "10" "Jimma" \
    "11" "Jijiga" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Addis Ababa,"
        ;;
    3)
        VCITY="    \"city\": Gondar,"
        ;;
    4)
        VCITY="    \"city\": Mek'ele,"
        ;;
    5)
        VCITY="    \"city\": Adama,"
        ;;
    6)
        VCITY="    \"city\": Hawassa,"
        ;;
    7)
        VCITY="    \"city\": Bahir Dar,"
        ;;
    8)
        VCITY="    \"city\": Dire Dawa,"
        ;;
    9)
        VCITY="    \"city\": Dessie,"
        ;;
    10)
        VCITY="    \"city\": Jimma,"
        ;;
    11)
        VCITY="    \"city\": Jijiga,"
        ;;
    esac
}

countryga(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Libreville" \
    "3" "Port-Gentil" \
    "4" "Franceville" \
    "5" "Owendo" \
    "6" "Oyem" \
    "7" "Moanda" \
    "8" "Ntoum" \
    "9" "Lambaréné" \
    "10" "Mouila" \
    "11" "Akanda" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Libreville,"
        ;;
    3)
        VCITY="    \"city\": Port-Gentil,"
        ;;
    4)
        VCITY="    \"city\": Franceville,"
        ;;
    5)
        VCITY="    \"city\": Owendo,"
        ;;
    6)
        VCITY="    \"city\": Oyem,"
        ;;
    7)
        VCITY="    \"city\": Moanda,"
        ;;
    8)
        VCITY="    \"city\": Ntoum,"
        ;;
    9)
        VCITY="    \"city\": Lambaréné,"
        ;;
    10)
        VCITY="    \"city\": Mouila,"
        ;;
    11)
        VCITY="    \"city\": Akanda,"
        ;;
    esac
}

countrygm(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Serekunda" \
    "3" "Brikama" \
    "4" "Bakau" \
    "5" "Banjul" \
    "6" "Farafenni" \
    "7" "Lamin" \
    "8" "Sukuta" \
    "9" "Basse Santa Su" \
    "10" "Gunjur" \
    "11" "Soma" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Serekunda,"
        ;;
    3)
        VCITY="    \"city\": Brikama,"
        ;;
    4)
        VCITY="    \"city\": Bakau,"
        ;;
    5)
        VCITY="    \"city\": Banjul,"
        ;;
    6)
        VCITY="    \"city\": Farafenni,"
        ;;
    7)
        VCITY="    \"city\": Lamin,"
        ;;
    8)
        VCITY="    \"city\": Sukuta,"
        ;;
    9)
        VCITY="    \"city\": Basse Santa Su,"
        ;;
    10)
        VCITY="    \"city\": Gunjur,"
        ;;
    11)
        VCITY="    \"city\": Soma,"
        ;;
    esac
}

countrygh(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Accra" \
    "3" "Kumasi" \
    "4" "Sekondi-Takoradi" \
    "5" "Ashaiman" \
    "6" "Sunyani" \
    "7" "Tamale" \
    "8" "Cape Coast" \
    "9" "Obuasi" \
    "10" "Teshie" \
    "11" "Tema" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Accra,"
        ;;
    3)
        VCITY="    \"city\": Kumasi,"
        ;;
    4)
        VCITY="    \"city\": Sekondi-Takoradi,"
        ;;
    5)
        VCITY="    \"city\": Ashaiman,"
        ;;
    6)
        VCITY="    \"city\": Sunyani,"
        ;;
    7)
        VCITY="    \"city\": Tamale,"
        ;;
    8)
        VCITY="    \"city\": Cape Coast,"
        ;;
    9)
        VCITY="    \"city\": Obuasi,"
        ;;
    10)
        VCITY="    \"city\": Teshie,"
        ;;
    11)
        VCITY="    \"city\": Tema,"
        ;;
    esac
}

countrygn(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Conakry" \
    "3" "Nzérékoré" \
    "4" "Kankan" \
    "5" "Manéah" \
    "6" "Dubréka" \
    "7" "Kindia" \
    "8" "Siguiri" \
    "9" "Kissidougou" \
    "10" "Labé" \
    "11" "Kamsar" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Conakry,"
        ;;
    3)
        VCITY="    \"city\": Nzérékoré,"
        ;;
    4)
        VCITY="    \"city\": Kankan,"
        ;;
    5)
        VCITY="    \"city\": Manéah,"
        ;;
    6)
        VCITY="    \"city\": Dubréka,"
        ;;
    7)
        VCITY="    \"city\": Kindia,"
        ;;
    8)
        VCITY="    \"city\": Siguiri,"
        ;;
    9)
        VCITY="    \"city\": Kissidougou,"
        ;;
    10)
        VCITY="    \"city\": Labé,"
        ;;
    11)
        VCITY="    \"city\": Kamsar,"
        ;;
    esac
}

countrygw(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Bissau" \
    "3" "Bafatá" \
    "4" "Gabú" \
    "5" "Bissorã" \
    "6" "Bolama" \
    "7" "Cacheu" \
    "8" "Bubaque" \
    "9" "Catió" \
    "10" "Mansôa" \
    "11" "Buba" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Bissau,"
        ;;
    3)
        VCITY="    \"city\": Bafatá,"
        ;;
    4)
        VCITY="    \"city\": Gabú,"
        ;;
    5)
        VCITY="    \"city\": Bissorã,"
        ;;
    6)
        VCITY="    \"city\": Bolama,"
        ;;
    7)
        VCITY="    \"city\": Cacheu,"
        ;;
    8)
        VCITY="    \"city\": Bubaque,"
        ;;
    9)
        VCITY="    \"city\": Catió,"
        ;;
    10)
        VCITY="    \"city\": Mansôa,"
        ;;
    11)
        VCITY="    \"city\": Buba,"
        ;;
    esac
}

countryke(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Nairobi" \
    "3" "Mombasa" \
    "4" "Kisumu" \
    "5" "Nakuru" \
    "6" "Eldoret" \
    "7" "Kehancha" \
    "8" "Ruiru" \
    "9" "Kikuyu" \
    "10" "Kangundo-Tala" \
    "11" "Malindi" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Nairobi,"
        ;;
    3)
        VCITY="    \"city\": Mombasa,"
        ;;
    4)
        VCITY="    \"city\": Kisumu,"
        ;;
    5)
        VCITY="    \"city\": Nakuru,"
        ;;
    6)
        VCITY="    \"city\": Eldoret,"
        ;;
    7)
        VCITY="    \"city\": Kehancha,"
        ;;
    8)
        VCITY="    \"city\": Ruiru,"
        ;;
    9)
        VCITY="    \"city\": Kikuyu,"
        ;;
    10)
        VCITY="    \"city\": Kangundo-Tala,"
        ;;
    11)
        VCITY="    \"city\": Malindi,"
        ;;
    esac
}

countryls(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Maseru" \
    "3" "Teyateyaneng" \
    "4" "Mafeteng" \
    "5" "Hlotse" \
    "6" "Mohale's Hoek" \
    "7" "Maputsoe" \
    "8" "Qacha's Nek" \
    "9" "Quthing" \
    "10" "Butha-Buthe" \
    "11" "Mokhotlong" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Maseru,"
        ;;
    3)
        VCITY="    \"city\": Teyateyaneng,"
        ;;
    4)
        VCITY="    \"city\": Mafeteng,"
        ;;
    5)
        VCITY="    \"city\": Hlotse,"
        ;;
    6)
        VCITY="    \"city\": Mohale's Hoek,"
        ;;
    7)
        VCITY="    \"city\": Maputsoe,"
        ;;
    8)
        VCITY="    \"city\": Qacha's Nek,"
        ;;
    9)
        VCITY="    \"city\": Quthing,"
        ;;
    10)
        VCITY="    \"city\": Butha-Buthe,"
        ;;
    11)
        VCITY="    \"city\": Mokhotlong,"
        ;;
    esac
}

countrylr(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Monrovia" \
    "3" "Gbarnga" \
    "4" "Kakata" \
    "5" "Bensonville" \
    "6" "Harper" \
    "7" "Voinjama" \
    "8" "Buchanan" \
    "9" "Zwedru" \
    "10" "New Yekepa" \
    "11" "Greenville" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Monrovia,"
        ;;
    3)
        VCITY="    \"city\": Gbarnga,"
        ;;
    4)
        VCITY="    \"city\": Kakata,"
        ;;
    5)
        VCITY="    \"city\": Bensonville,"
        ;;
    6)
        VCITY="    \"city\": Harper,"
        ;;
    7)
        VCITY="    \"city\": Voinjama,"
        ;;
    8)
        VCITY="    \"city\": Buchanan,"
        ;;
    9)
        VCITY="    \"city\": Zwedru,"
        ;;
    10)
        VCITY="    \"city\": New Yekepa,"
        ;;
    11)
        VCITY="    \"city\": Greenville,"
        ;;
    esac
}

countryly(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Tripoli" \
    "3" "Benghazi" \
    "4" "Misrata" \
    "5" "Zliten" \
    "6" "Bayda" \
    "7" "Zawiya" \
    "8" "Ajdabiya" \
    "9" "Tobruk" \
    "10" "Sabha" \
    "11" "Khoms " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Tripoli,"
        ;;
    3)
        VCITY="    \"city\": Benghazi,"
        ;;
    4)
        VCITY="    \"city\": Misrata,"
        ;;
    5)
        VCITY="    \"city\": Zliten,"
        ;;
    6)
        VCITY="    \"city\": Bayda,"
        ;;
    7)
        VCITY="    \"city\": Zawiya,"
        ;;
    8)
        VCITY="    \"city\": Ajdabiya,"
        ;;
    9)
        VCITY="    \"city\": Tobruk,"
        ;;
    10)
        VCITY="    \"city\": Sabha,"
        ;;
    11)
        VCITY="    \"city\": Khoms,"
        ;;
    esac
}

countrymg(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Antananarivo" \
    "3" "Toamasina" \
    "4" "Antsirabe" \
    "5" "Mahajanga" \
    "6" "Fianarantsoa" \
    "7" "Toliara" \
    "8" "Antsiranana" \
    "9" "Ambovombe" \
    "10" "Antanifotsy" \
    "11" "Amparafaravola " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Antananarivo,"
        ;;
    3)
        VCITY="    \"city\": Toamasina,"
        ;;
    4)
        VCITY="    \"city\": Antsirabe,"
        ;;
    5)
        VCITY="    \"city\": Mahajanga,"
        ;;
    6)
        VCITY="    \"city\": Fianarantsoa,"
        ;;
    7)
        VCITY="    \"city\": Toliara,"
        ;;
    8)
        VCITY="    \"city\": Antsiranana,"
        ;;
    9)
        VCITY="    \"city\": Ambovombe,"
        ;;
    10)
        VCITY="    \"city\": Antanifotsy,"
        ;;
    11)
        VCITY="    \"city\": Amparafaravola,"
        ;;
    esac
}

countrymw(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Lilongwe" \
    "3" "Blantyre" \
    "4" "Zomba" \
    "5" "Kasungu" \
    "6" "Mangochi" \
    "7" "Karonga" \
    "8" "Salima" \
    "9" "Nkhotakota" \
    "10" "Liwonde" \
    "11" "Nsanje " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Lilongwe,"
        ;;
    3)
        VCITY="    \"city\": Blantyre,"
        ;;
    4)
        VCITY="    \"city\": Zomba,"
        ;;
    5)
        VCITY="    \"city\": Kasungu,"
        ;;
    6)
        VCITY="    \"city\": Mangochi,"
        ;;
    7)
        VCITY="    \"city\": Karonga,"
        ;;
    8)
        VCITY="    \"city\": Salima,"
        ;;
    9)
        VCITY="    \"city\": Nkhotakota,"
        ;;
    10)
        VCITY="    \"city\": Liwonde,"
        ;;
    11)
        VCITY="    \"city\": Nsanje,"
        ;;
    esac
}

countryml(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Bamako" \
    "3" "Sikasso" \
    "4" "Mopti" \
    "5" "Koutiala" \
    "6" "Ségou" \
    "7" "Gao" \
    "8" "Kayes" \
    "9" "Markala" \
    "10" "Kolokani" \
    "11" "Kati " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Bamako,"
        ;;
    3)
        VCITY="    \"city\": Sikasso,"
        ;;
    4)
        VCITY="    \"city\": Mopti,"
        ;;
    5)
        VCITY="    \"city\": Koutiala,"
        ;;
    6)
        VCITY="    \"city\": Ségou,"
        ;;
    7)
        VCITY="    \"city\": Gao,"
        ;;
    8)
        VCITY="    \"city\": Kayes,"
        ;;
    9)
        VCITY="    \"city\": Markala,"
        ;;
    10)
        VCITY="    \"city\": Kolokani,"
        ;;
    11)
        VCITY="    \"city\": Kati,"
        ;;
    esac
}

countrymr(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Nouakchott" \
    "3" "Nouadhibou" \
    "4" "Rosso" \
    "5" "Adel Bagrou" \
    "6" "Boghé" \
    "7" "Kiffa" \
    "8" "Zouérat" \
    "9" "Kaédi" \
    "10" "Boû Gâdoûm" \
    "11" "Boutilimit " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Nouakchott,"
        ;;
    3)
        VCITY="    \"city\": Nouadhibou,"
        ;;
    4)
        VCITY="    \"city\": Rosso,"
        ;;
    5)
        VCITY="    \"city\": Adel Bagrou,"
        ;;
    6)
        VCITY="    \"city\": Boghé,"
        ;;
    7)
        VCITY="    \"city\": Kiffa,"
        ;;
    8)
        VCITY="    \"city\": Zouérat,"
        ;;
    9)
        VCITY="    \"city\": Kaédi,"
        ;;
    10)
        VCITY="    \"city\": Boû Gâdoûm,"
        ;;
    11)
        VCITY="    \"city\": Boutilimit,"
        ;;
    esac
}

countrymu(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Port Louis" \
    "3" "Beau Bassin-Rose Hill" \
    "4" "Vacoas" \
    "5" "Curepipe" \
    "6" "Quatre Bornes" \
    "7" "Triolet" \
    "8" "Goodlands" \
    "9" "Centre de Flacq" \
    "10" "Bel Air Rivière Sèche" \
    "11" "Mahébourg" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Port Louis,"
        ;;
    3)
        VCITY="    \"city\": Beau Bassin-Rose Hill,"
        ;;
    4)
        VCITY="    \"city\": Vacoas,"
        ;;
    5)
        VCITY="    \"city\": Curepipe,"
        ;;
    6)
        VCITY="    \"city\": Quatre Bornes,"
        ;;
    7)
        VCITY="    \"city\": Triolet,"
        ;;
    8)
        VCITY="    \"city\": Goodlands,"
        ;;
    9)
        VCITY="    \"city\": Centre de Flacq,"
        ;;
    10)
        VCITY="    \"city\": Bel Air Rivière Sèche,"
        ;;
    11)
        VCITY="    \"city\": Mahébourg,"
        ;;
    esac
}

countryma(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Casablanca" \
    "3" "Fez" \
    "4" "Tangier" \
    "5" "Marrakesh" \
    "6" "Salé" \
    "7" "Meknes" \
    "8" "Rabat" \
    "9" "Oujda" \
    "10" "Kenitra" \
    "11" "Agadir" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Casablanca,"
        ;;
    3)
        VCITY="    \"city\": Fez,"
        ;;
    4)
        VCITY="    \"city\": Tangier,"
        ;;
    5)
        VCITY="    \"city\": Marrakesh,"
        ;;
    6)
        VCITY="    \"city\": Salé,"
        ;;
    7)
        VCITY="    \"city\": Meknes,"
        ;;
    8)
        VCITY="    \"city\": Rabat,"
        ;;
    9)
        VCITY="    \"city\": Oujda,"
        ;;
    10)
        VCITY="    \"city\": Kenitra,"
        ;;
    11)
        VCITY="    \"city\": Agadir,"
        ;;
    esac
}

countrymz(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Maputo" \
    "3" "Matola" \
    "4" "Nampula" \
    "5" "Beira" \
    "6" "Chimoio" \
    "7" "Nacala" \
    "8" "Quelimane" \
    "9" "Tete" \
    "10" "Lichinga" \
    "11" "Pemba" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Maputo,"
        ;;
    3)
        VCITY="    \"city\": Matola,"
        ;;
    4)
        VCITY="    \"city\": Nampula,"
        ;;
    5)
        VCITY="    \"city\": Beira,"
        ;;
    6)
        VCITY="    \"city\": Chimoio,"
        ;;
    7)
        VCITY="    \"city\": Nacala,"
        ;;
    8)
        VCITY="    \"city\": Quelimane,"
        ;;
    9)
        VCITY="    \"city\": Tete,"
        ;;
    10)
        VCITY="    \"city\": Lichinga,"
        ;;
    11)
        VCITY="    \"city\": Pemba,"
        ;;
    esac
}

countryna(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Windhoek" \
    "3" "Walvis Bay" \
    "4" "Swakopmund" \
    "5" "Henties Bay" \
    "6" "Omaruru" \
    "7" "Otjiwarongo" \
    "8" "Okahandja" \
    "9" "Grootfontein" \
    "10" "Mariental" \
    "11" "Outjo" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Windhoek,"
        ;;
    3)
        VCITY="    \"city\": Walvis Bay,"
        ;;
    4)
        VCITY="    \"city\": Swakopmund,"
        ;;
    5)
        VCITY="    \"city\": Henties Bay,"
        ;;
    6)
        VCITY="    \"city\": Omaruru,"
        ;;
    7)
        VCITY="    \"city\": Otjiwarongo,"
        ;;
    8)
        VCITY="    \"city\": Okahandja,"
        ;;
    9)
        VCITY="    \"city\": Grootfontein,"
        ;;
    10)
        VCITY="    \"city\": Mariental,"
        ;;
    11)
        VCITY="    \"city\": Outjo,"
        ;;
    esac
}

countryne(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Niamey" \
    "3" "Maradi" \
    "4" "Zinder" \
    "5" "Tahoua" \
    "6" "Agadez" \
    "7" "Arlit" \
    "8" "Birni-N'Konni" \
    "9" "Dosso" \
    "10" "Gaya" \
    "11" "Tessaoua" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Niamey,"
        ;;
    3)
        VCITY="    \"city\": Maradi,"
        ;;
    4)
        VCITY="    \"city\": Zinder,"
        ;;
    5)
        VCITY="    \"city\": Tahoua,"
        ;;
    6)
        VCITY="    \"city\": Agadez,"
        ;;
    7)
        VCITY="    \"city\": Arlit,"
        ;;
    8)
        VCITY="    \"city\": Birni-N'Konni,"
        ;;
    9)
        VCITY="    \"city\": Dosso,"
        ;;
    10)
        VCITY="    \"city\": Gaya,"
        ;;
    11)
        VCITY="    \"city\": Tessaoua,"
        ;;
    esac
}

countryng(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Lagos" \
    "3" "Kano" \
    "4" "Ibadan" \
    "5" "Benin City" \
    "6" "Port Harcourt" \
    "7" "Jos" \
    "8" "Ilorin" \
    "9" "Abuja" \
    "10" "Kaduna" \
    "11" "Enugu" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Lagos,"
        ;;
    3)
        VCITY="    \"city\": Kano,"
        ;;
    4)
        VCITY="    \"city\": Ibadan,"
        ;;
    5)
        VCITY="    \"city\": Benin City,"
        ;;
    6)
        VCITY="    \"city\": Port Harcourt,"
        ;;
    7)
        VCITY="    \"city\": Jos,"
        ;;
    8)
        VCITY="    \"city\": Ilorin,"
        ;;
    9)
        VCITY="    \"city\": Abuja,"
        ;;
    10)
        VCITY="    \"city\": Kaduna,"
        ;;
    11)
        VCITY="    \"city\": Enugu,"
        ;;
    esac
}

countryrw(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Kigali" \
    "3" "Butare" \
    "4" "Muhanga" \
    "5" "Ruhengeri" \
    "6" "Gisenyi" \
    "7" "Byumba" \
    "8" "Cyangugu" \
    "9" "Nyanza" \
    "10" "Kabuga" \
    "11" "Ruhango" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Kigali,"
        ;;
    3)
        VCITY="    \"city\": Butare,"
        ;;
    4)
        VCITY="    \"city\": Muhanga,"
        ;;
    5)
        VCITY="    \"city\": Ruhengeri,"
        ;;
    6)
        VCITY="    \"city\": Gisenyi,"
        ;;
    7)
        VCITY="    \"city\": Byumba,"
        ;;
    8)
        VCITY="    \"city\": Cyangugu,"
        ;;
    9)
        VCITY="    \"city\": Nyanza,"
        ;;
    10)
        VCITY="    \"city\": Kabuga,"
        ;;
    11)
        VCITY="    \"city\": Ruhango,"
        ;;
    esac
}

countryst(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "São Tomé" \
    "3" "Santo Amaro" \
    "4" "Neves" \
    "5" "Santana" \
    "6" "Trindade" \
    "7" "Santa Cruz" \
    "8" "Pantufo" \
    "9" "Guadalupe" \
    "10" "Santo António" \
    "11" "Santa Catarina" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": São Tomé,"
        ;;
    3)
        VCITY="    \"city\": Santo Amaro,"
        ;;
    4)
        VCITY="    \"city\": Neves,"
        ;;
    5)
        VCITY="    \"city\": Santana,"
        ;;
    6)
        VCITY="    \"city\": Trindade,"
        ;;
    7)
        VCITY="    \"city\": Santa Cruz,"
        ;;
    8)
        VCITY="    \"city\": Pantufo,"
        ;;
    9)
        VCITY="    \"city\": Guadalupe,"
        ;;
    10)
        VCITY="    \"city\": Santo António,"
        ;;
    11)
        VCITY="    \"city\": Santa Catarina,"
        ;;
    esac
}

countrysn(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Dakar" \
    "3" "Touba" \
    "4" "Thiès" \
    "5" "Rufisque" \
    "6" "Kaolack" \
    "7" "M'Bour" \
    "8" "Ziguinchor" \
    "9" "Saint-Louis" \
    "10" "Diourbel" \
    "11" "Louga" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Dakar,"
        ;;
    3)
        VCITY="    \"city\": Touba,"
        ;;
    4)
        VCITY="    \"city\": Thiès,"
        ;;
    5)
        VCITY="    \"city\": Rufisque,"
        ;;
    6)
        VCITY="    \"city\": Kaolack,"
        ;;
    7)
        VCITY="    \"city\": M'Bour,"
        ;;
    8)
        VCITY="    \"city\": Ziguinchor,"
        ;;
    9)
        VCITY="    \"city\": Saint-Louis,"
        ;;
    10)
        VCITY="    \"city\": Diourbel,"
        ;;
    11)
        VCITY="    \"city\": Louga,"
        ;;
    esac
}

countrysc(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Victoria" \
    "3" "Anse Boileau" \
    "4" "Bel Ombre" \
    "5" "Beau Vallon" \
    "6" "Cascade" \
    "7" "Anse Royale" \
    "8" "Takamaka" \
    "9" "Port Glaud" \
    "10" "Anse Lazio" \
    "11" "Saint Louis" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Victoria,"
        ;;
    3)
        VCITY="    \"city\": Anse Boileau,"
        ;;
    4)
        VCITY="    \"city\": Bel Ombre,"
        ;;
    5)
        VCITY="    \"city\": Beau Vallon,"
        ;;
    6)
        VCITY="    \"city\": Cascade,"
        ;;
    7)
        VCITY="    \"city\": Anse Royale,"
        ;;
    8)
        VCITY="    \"city\": Takamaka,"
        ;;
    9)
        VCITY="    \"city\": Port Glaud,"
        ;;
    10)
        VCITY="    \"city\": Anse Lazio,"
        ;;
    11)
        VCITY="    \"city\": Saint Louis,"
        ;;
    esac
}

countrysl(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Freetown" \
    "3" "Bo" \
    "4" "Kenema" \
    "5" "Makeni" \
    "6" "Koidu Town" \
    "7" "Lunsar" \
    "8" "Port Loko" \
    "9" "Pandebu-Tokpombu" \
    "10" "Kabala" \
    "11" "Waterloo" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Freetown,"
        ;;
    3)
        VCITY="    \"city\": Bo,"
        ;;
    4)
        VCITY="    \"city\": Kenema,"
        ;;
    5)
        VCITY="    \"city\": Makeni,"
        ;;
    6)
        VCITY="    \"city\": Koidu Town,"
        ;;
    7)
        VCITY="    \"city\": Lunsar,"
        ;;
    8)
        VCITY="    \"city\": Port Loko,"
        ;;
    9)
        VCITY="    \"city\": Pandebu-Tokpombu,"
        ;;
    10)
        VCITY="    \"city\": Kabala,"
        ;;
    11)
        VCITY="    \"city\": Waterloo,"
        ;;
    esac
}

countryso(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Mogadishu" \
    "3" "Hargeisa" \
    "4" "Burao" \
    "5" "Bosaso" \
    "6" "Borama" \
    "7" "Baidoa" \
    "8" "Beledweyne" \
    "9" "Bardera" \
    "10" "Kismaio" \
    "11" "Galkaio" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Mogadishu,"
        ;;
    3)
        VCITY="    \"city\": Hargeisa,"
        ;;
    4)
        VCITY="    \"city\": Burao,"
        ;;
    5)
        VCITY="    \"city\": Bosaso,"
        ;;
    6)
        VCITY="    \"city\": Borama,"
        ;;
    7)
        VCITY="    \"city\": Baidoa,"
        ;;
    8)
        VCITY="    \"city\": Beledweyne,"
        ;;
    9)
        VCITY="    \"city\": Bardera,"
        ;;
    10)
        VCITY="    \"city\": Kismaio,"
        ;;
    11)
        VCITY="    \"city\": Galkaio,"
        ;;
    esac
}

countryza(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Cape Town" \
    "3" "Durban" \
    "4" "Johannesburg" \
    "5" "Soweto" \
    "6" "Pretoria" \
    "7" "Port Elizabeth" \
    "8" "Pietermarizburg" \
    "9" "Benoni" \
    "10" "Tembisa" \
    "11" "East London" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Cape Town,"
        ;;
    3)
        VCITY="    \"city\": Durban,"
        ;;
    4)
        VCITY="    \"city\": Johannesburg,"
        ;;
    5)
        VCITY="    \"city\": Soweto,"
        ;;
    6)
        VCITY="    \"city\": Pretoria,"
        ;;
    7)
        VCITY="    \"city\": Port Elizabeth,"
        ;;
    8)
        VCITY="    \"city\": Pietermarizburg,"
        ;;
    9)
        VCITY="    \"city\": Benoni,"
        ;;
    10)
        VCITY="    \"city\": Tembisa,"
        ;;
    11)
        VCITY="    \"city\": East London,"
        ;;
    esac
}

countryss(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Juba" \
    "3" "Yei" \
    "4" "Wau" \
    "5" "Malakal" \
    "6" "Aweil" \
    "7" "Nimule" \
    "8" "Gogrial" \
    "9" "Yambio" \
    "10" "Rumbek" \
    "11" "Renk" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Juba,"
        ;;
    3)
        VCITY="    \"city\": Yei,"
        ;;
    4)
        VCITY="    \"city\": Wau,"
        ;;
    5)
        VCITY="    \"city\": Malakal,"
        ;;
    6)
        VCITY="    \"city\": Aweil,"
        ;;
    7)
        VCITY="    \"city\": Nimule,"
        ;;
    8)
        VCITY="    \"city\": Gogrial,"
        ;;
    9)
        VCITY="    \"city\": Yambio,"
        ;;
    10)
        VCITY="    \"city\": Rumbek,"
        ;;
    11)
        VCITY="    \"city\": Renk,"
        ;;
    esac
}

countrysd(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Omdurman" \
    "3" "Khartoum" \
    "4" "Khartoum North" \
    "5" "Nyala" \
    "6" "Port Sudan" \
    "7" "El-Obeid" \
    "8" "Kassala" \
    "9" "Madani" \
    "10" "El-Gadarif" \
    "11" "Al-Fashir" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Omdurman,"
        ;;
    3)
        VCITY="    \"city\": Khartoum,"
        ;;
    4)
        VCITY="    \"city\": Khartoum North,"
        ;;
    5)
        VCITY="    \"city\": Nyala,"
        ;;
    6)
        VCITY="    \"city\": Port Sudan,"
        ;;
    7)
        VCITY="    \"city\": El-Obeid,"
        ;;
    8)
        VCITY="    \"city\": Kassala,"
        ;;
    9)
        VCITY="    \"city\": Madani,"
        ;;
    10)
        VCITY="    \"city\": El-Gadarif,"
        ;;
    11)
        VCITY="    \"city\": Al-Fashir,"
        ;;
    esac
}

countrytz(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Dar es Salaam" \
    "3" "Mwanza" \
    "4" "Arusha" \
    "5" "Dodoma" \
    "6" "Mbeya" \
    "7" "Morogoro" \
    "8" "Tanga" \
    "9" "Kahama" \
    "10" "Tabora" \
    "11" "Zanzibar City" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Dar es Salaam,"
        ;;
    3)
        VCITY="    \"city\": Mwanza,"
        ;;
    4)
        VCITY="    \"city\": Arusha,"
        ;;
    5)
        VCITY="    \"city\": Dodoma,"
        ;;
    6)
        VCITY="    \"city\": Mbeya,"
        ;;
    7)
        VCITY="    \"city\": Morogoro,"
        ;;
    8)
        VCITY="    \"city\": Tanga,"
        ;;
    9)
        VCITY="    \"city\": Kahama,"
        ;;
    10)
        VCITY="    \"city\": Tabora,"
        ;;
    11)
        VCITY="    \"city\": Zanzibar City,"
        ;;
    esac
}

countrytg(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Lomé" \
    "3" "Sokodé" \
    "4" "Kara" \
    "5" "Kpalimé" \
    "6" "Atakpamé" \
    "7" "Bassar" \
    "8" "Tsévié" \
    "9" "Aného" \
    "10" "Mango" \
    "11" "Dapaong" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Lomé,"
        ;;
    3)
        VCITY="    \"city\": Sokodé,"
        ;;
    4)
        VCITY="    \"city\": Kara,"
        ;;
    5)
        VCITY="    \"city\": Kpalimé,"
        ;;
    6)
        VCITY="    \"city\": Atakpamé,"
        ;;
    7)
        VCITY="    \"city\": Bassar,"
        ;;
    8)
        VCITY="    \"city\": Tsévié,"
        ;;
    9)
        VCITY="    \"city\": Aného,"
        ;;
    10)
        VCITY="    \"city\": Mango,"
        ;;
    11)
        VCITY="    \"city\": Dapaong,"
        ;;
    esac
}

countrytn(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Tunis" \
    "3" "Sfax" \
    "4" "Sousse" \
    "5" "Ettadhamen" \
    "6" "Kairouan" \
    "7" "Gabès" \
    "8" "Bizerte" \
    "9" "Aryanah" \
    "10" "Gafsa" \
    "11" "El Mourouj" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Tunis,"
        ;;
    3)
        VCITY="    \"city\": Sfax,"
        ;;
    4)
        VCITY="    \"city\": Sousse,"
        ;;
    5)
        VCITY="    \"city\": Ettadhamen,"
        ;;
    6)
        VCITY="    \"city\": Kairouan,"
        ;;
    7)
        VCITY="    \"city\": Gabès,"
        ;;
    8)
        VCITY="    \"city\": Bizerte,"
        ;;
    9)
        VCITY="    \"city\": Aryanah,"
        ;;
    10)
        VCITY="    \"city\": Gafsa,"
        ;;
    11)
        VCITY="    \"city\": El Mourouj,"
        ;;
    esac
}

countryug(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Kampala" \
    "3" "Nansana" \
    "4" "Kira" \
    "5" "Ssabagabo" \
    "6" "Mbarara" \
    "7" "Mukono" \
    "8" "Gulu" \
    "9" "Lugazi" \
    "10" "Masaka" \
    "11" "Kasese" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Kampala,"
        ;;
    3)
        VCITY="    \"city\": Nansana,"
        ;;
    4)
        VCITY="    \"city\": Kira,"
        ;;
    5)
        VCITY="    \"city\": Ssabagabo,"
        ;;
    6)
        VCITY="    \"city\": Mbarara,"
        ;;
    7)
        VCITY="    \"city\": Mukono,"
        ;;
    8)
        VCITY="    \"city\": Gulu,"
        ;;
    9)
        VCITY="    \"city\": Lugazi,"
        ;;
    10)
        VCITY="    \"city\": Masaka,"
        ;;
    11)
        VCITY="    \"city\": Kasese,"
        ;;
    esac
}

countryeh(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Laayoun" \
    "3" "Ad-Dakhla" \
    "4" "Smara" \
    "5" "Cape Bojador" \
    "6" "El Marsa" \
    "7" "Hawza" \
    "8" "Mahbes" \
    "9" "Guelta Zemmur" \
    "10" "Bir Anzarane" \
    "11" "Tichla" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Laayoun,"
        ;;
    3)
        VCITY="    \"city\": Ad-Dakhla,"
        ;;
    4)
        VCITY="    \"city\": Smara,"
        ;;
    5)
        VCITY="    \"city\": Cape Bojador,"
        ;;
    6)
        VCITY="    \"city\": El Marsa,"
        ;;
    7)
        VCITY="    \"city\": Hawza,"
        ;;
    8)
        VCITY="    \"city\": Mahbes,"
        ;;
    9)
        VCITY="    \"city\": Guelta Zemmur,"
        ;;
    10)
        VCITY="    \"city\": Bir Anzarane,"
        ;;
    11)
        VCITY="    \"city\": Tichla,"
        ;;
    esac
}

countryzm(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Lusaka" \
    "3" "Ndola" \
    "4" "Kitwe" \
    "5" "Kabwe" \
    "6" "Chingola" \
    "7" "Mufulira" \
    "8" "Livingstone" \
    "9" "Luanshya" \
    "10" "Chipata" \
    "11" "Kasama" 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Lusaka,"
        ;;
    3)
        VCITY="    \"city\": Ndola,"
        ;;
    4)
        VCITY="    \"city\": Kitwe,"
        ;;
    5)
        VCITY="    \"city\": Kabwe,"
        ;;
    6)
        VCITY="    \"city\": Chingola,"
        ;;
    7)
        VCITY="    \"city\": Mufulira,"
        ;;
    8)
        VCITY="    \"city\": Livingstone,"
        ;;
    9)
        VCITY="    \"city\": Luanshya,"
        ;;
    10)
        VCITY="    \"city\": Chipata,"
        ;;
    11)
        VCITY="    \"city\": Kasama,"
        ;;
    esac
}

countryzw(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Harare" \
    "3" "Bulawayo" \
    "4" "Chitungwiza" \
    "5" "Mutare" \
    "6" "Epworth" \
    "7" "Gweru" \
    "8" "Kwekwe" \
    "9" "Kadoma" \
    "10" "Masvingo" \
    "11" "Chinhoyi " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Harare,"
        ;;
    3)
        VCITY="    \"city\": Bulawayo,"
        ;;
    4)
        VCITY="    \"city\": Chitungwiza,"
        ;;
    5)
        VCITY="    \"city\": Mutare,"
        ;;
    6)
        VCITY="    \"city\": Epworth,"
        ;;
    7)
        VCITY="    \"city\": Gweru,"
        ;;
    8)
        VCITY="    \"city\": Kwekwe,"
        ;;
    9)
        VCITY="    \"city\": Kadoma,"
        ;;
    10)
        VCITY="    \"city\": Masvingo,"
        ;;
    11)
        VCITY="    \"city\": Chinhoyi,"
        ;;
    esac
}

countryyt(){
CITY=$(whiptail --title "City Selection" --notags --backtitle "$BACKTITLE" --menu "Pick your closest city" 25 70 8 \
    "1" "<-- Back" \
    "2" "Mamoudzou" \
    "3" "Koungou" \
    "4" "Dzaoudzi" \
    "5" "Dembeni" \
    "6" "Sada" \
    "7" "Pamandzi" \
    "8" "Bandraboua" \
    "9" "Mtsamboro" \
    "10" "Tsingoni" \
    "11" "Ouangani " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        continentafrica
        ;;
    2)
        VCITY="    \"city\": Mamoudzou,"
        ;;
    3)
        VCITY="    \"city\": Koungou,"
        ;;
    4)
        VCITY="    \"city\": Dzaoudzi,"
        ;;
    5)
        VCITY="    \"city\": Dembeni,"
        ;;
    6)
        VCITY="    \"city\": Sada,"
        ;;
    7)
        VCITY="    \"city\": Pamandzi,"
        ;;
    8)
        VCITY="    \"city\": Bandraboua,"
        ;;
    9)
        VCITY="    \"city\": Mtsamboro,"
        ;;
    10)
        VCITY="    \"city\": Tsingoni,"
        ;;
    11)
        VCITY="    \"city\": Ouangani,"
        ;;
    esac
}

tzselect() {
	whiptail --backtitle "$BACKTITLE" --yesno "Set up Timezone:" --yes-button "By City" --no-button "By UTC" 10 70
        [[ $? == 0 ]] && tzcont || tzutc
}

tzcont() {
    TZCONT=$(whiptail --title "TZ Selection" --notags --backtitle "$BACKTITLE" --menu "In which area is your Timezone?" 25 70 8 \
    "1" "<-- Back" \
    "2" "Africa" \
    "3" "America (non-US)" \
    "4" "Arctic" \
    "5" "Asia" \
    "6" "Atlantic" \
    "7" "Australia" \
    "8" "Brazil" \
    "9" "Canada" \
    "10" "Chile" \
    "11" "Europe" \
    "12" "Indian" \
    "13" "Mexico" \
    "14" "Pacific" \
    "15" "US " 3>&1 1>&2 2>&3)

    case $CITY in
    1)
        tzselect
        ;;
    2)
        TZCONT="    \"tzcontinent\": Africa,"
	tzcityafrica
        ;;
    3)
        TZCONT="    \"tzcontinent\": America,"
	tzcityamerica
        ;;
    4)
        TZCONT="    \"tzcontinent\": Arctic,"
	tzcityarctic
        ;;
    5)
        TZCONT="    \"tzcontinent\": Asia,"
	tzcityasia
        ;;
    6)
        TZCONT="    \"tzcontinent\": Atlantic,"
	tzcityatlantic
        ;;
    7)
        TZCONT="    \"tzcontinent\": Australia,"
	tzcityaustralia
        ;;
    8)
        TZCONT="    \"tzcontinent\": Brazil,"
	tzcitybrazil
        ;;
    9)
        TZCONT="    \"tzcontinent\": Canada,"
	tzcitycanada
        ;;
    10)
        TZCONT="    \"tzcontinent\": Chile,"
        ;;
    11)
        TZCONT="    \"tzcontinent\": Europe,"
        ;;
    12)
        TZCONT="    \"tzcontinent\": Indian,"
        ;;
    13)
        TZCONT="    \"tzcontinent\": Mexico,"
        ;;
    14)
        TZCONT="    \"tzcontinent\": Pacific,"
        ;;
    15)
        TZCONT="    \"tzcontinent\": US,"
        ;;
    esac
}

#tzcityafrica() {

#}
#tzcityamerica() {

#}
#tzcityarctic() {

#}
#tzcityasia() {

#}
#tzcityatlantic() {

#}
#tzcityaustralia() {

#}
#tzcitybrazil() {

#}
#tzcitycanada() {

#}
#tzcitychile() {

#}
#tzcityeurope() {

#}
#tzcityindian() {

#}
#tzcitymexico() {

#}
#tzcitypacific() {

#}
#tzcityus() {

#}

#tzutc() {

#}

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
        ipaddress
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
	rm /etc/dhcpcd.conf
        cp /opt/epuncta/files/dhcpcd.conf /etc/dhcpcd.conf
        echo "interface wlan0" >> /etc/dhcpcd.conf
        echo "static ip_address=$IP/$MASK" >> /etc/dhcpcd.conf
        echo "static routers=$ROUTER" >> /etc/dhcpcd.conf
        echo "static domain_name_servers=$DNS1 $DNS2" >> /etc/dhcpcd.conf
        netsetup
}

dhcp() {
        cp /opt/files/dhcpcd.conf /etc/dhcpcd.conf
        netsetup
}

netsetup() {
	echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev" > /etc/wpa_supplicant/wpa_supplicant.conf
        echo "country=CA" >> /etc/wpa_supplicant/wpa_supplicant.conf
        echo "network={" >> /etc/wpa_supplicant/wpa_supplicant.conf
        echo "       ssid=\"$SSID\"" >> /etc/wpa_supplicant/wpa_supplicant.conf
        echo "       psk=\"$WPASSWORD\"" >> /etc/wpa_supplicant/wpa_supplicant.conf
        echo "       key_mgmt=WPA-PSK" >> /etc/wpa_supplicant/wpa_supplicant.conf
        echo "    }" >> /etc/wpa_supplicant/wpa_supplicant.conf

        continent
}

BACKTITLE="ePuncta"
SETTINGS="/etc/epuncta/settings.json"
mkdir -p /etc/epuncta
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
