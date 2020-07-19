#! /bin/bash

# If file /etc/dreamtime/settings.json DOES NOT EXIST
# Run /opt/dreamtime/setup.sh
# Else Run dreamtime.sh

[[ ! -e /etc/dreamtime/settings.json ]] && /opt/dreamtime/setup.sh || dreamtime.sh
