#! /bin/bash

[[ ! -e /etc/dreamtime/settings.json ]] && /opt/dreamtime/setup.sh || dreamtime.sh
