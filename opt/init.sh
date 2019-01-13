#! /bin/bash

[[ !-e /etc/clock/settings.json ]] && /opt/clock/firstrun.sh || /opt/clock/letsgo.sh
