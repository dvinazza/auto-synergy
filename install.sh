#!/bin/bash

dispatcher_dir=/etc/NetworkManager/dispatcher.d
required_apps="expect flock nc nmap telnet synergyc"

for required_app in ${required_apps}; do
    if ! which "${required_app}" > /dev/null; then
        echo "${required_app} missing!"
        exit 1
    fi
done

sudo cp 90synergy ${dispatcher_dir}
sudo sed 's|^USER=.*|USER='"$(whoami)"'|' -i ${dispatcher_dir}/90synergy
sudo sed 's|^AUTOSYN_GIT=.*|AUTOSYN_GIT='"$(pwd)"'|' -i ${dispatcher_dir}/90synergy
