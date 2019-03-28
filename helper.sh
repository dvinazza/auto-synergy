#!/bin/bash -x

debug_level="DEBUG"
script_dir=$(dirname $(realpath $0))
source $script_dir/synergy-tools

#me fijo si no esta abierto el synergy (gui) ya
if [ "$(pidof synergy)" != "" ] || [ "$(pidof synergyc)" != "" ]; then
    echo "Ya esta corriendo el Synergy"
    ps aux | grep '[s]ynergy'
    exit 1
fi

if autosyn-network-getCurrent; then
  echo "Conozco la red: $network_name"
  if autosyn-host-test $server_ip; then
    echo "El ip conocido esta activo: $server_ip"
    autosyn-host-connect $server_ip
  else
    echo "No pude conectarme a la IP que esperaba ($server_ip)"
    
    echo "Intentando encontrarla mediante nmap/arp..."
    ip=$(autosyn-mac2ip $network $server_mac)
    
    echo "Encontre: $ip"
    if autosyn-config-update $ip; then
        autosyn-host-connect $ip
    fi
  fi
fi
