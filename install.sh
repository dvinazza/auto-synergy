#!/bin/bash

DEST=/etc/NetworkManager/dispatcher.d

REQUIRED="expect nc nmap telnet synergyc"

for APP in ${REQUIRED}; do
    if ! which ${APP} >/dev/null; then
        echo "${APP} missing !"
        exit 1
    fi
done

sudo cp 90synergy ${DEST}
sudo sed 's|^USER=.*|USER='"$(whoami)"'|' -i ${DEST}/90synergy
sudo sed 's|^AUTO_SYNERGY_GIT=.*|AUTO_SYNERGY_GIT='"$(pwd)"'|' -i ${DEST}/90synergy
