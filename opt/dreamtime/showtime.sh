#! /bin/bash

# MATCH OUTPUT IN checknet() TO SHOW NOT CONNECTED WARNING

checknet() {
	if [[  $(cat /etc/dreamtime/settings.json | grep wifi | grep - v disabled | wc -l) -ne 0 ]]; then
		curl www.icanhazip.com -o --create-dirs /etc/dreamtime/last.ip
		if [[ $? -eq 0 ]]; then
			MYIP="$(cat /etc/dreamtime/last.ip)"
			sed -i "s/.*public_ip.*/    \"public_ip\": $MYIP,"
			echo "1" > /etc/dreamtime/connected.dat
		else
			sed -i "s/.*public_ip.*/    \"public_ip\": error,"
			echo "0" > /etc/dreamtime/connected.dat

}
