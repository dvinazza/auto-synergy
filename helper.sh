#!/bin/bash


script_dir=$(dirname $(realpath $0))

source $script_dir/synergy-tools
source $script_dir/autosyn-env

# https://stackoverflow.com/questions/3173131/redirect-copy-of-stdout-to-log-file-from-within-bash-script-itself
# Redirect stdout ( > ) into a named pipe ( >() ) running "tee"
exec > >(tee -i ${AUTOSYN_HELPER_LOG})
exec 2>&1

#me fijo si no esta abierto el synergy (gui) ya
if [ "$(pidof synergy)" != "" ] || [ "$(pidof synergyc)" != "" ]; then
    echo "Ya esta corriendo el Synergy"
    ps aux | grep '[s]ynergy'
    exit 1
fi

if autosyn-network-getCurrent; then
  echo "Conozco la red: $AUTOSYN_NET_NAME [AUTOSYN_MODE=$AUTOSYN_MODE]"

  case $AUTOSYN_MODE in
    server)
      autosyn-server-start
      ;;
    *)
      if autosyn-client-test; then
        echo "El ip conocido esta activo: $AUTOSYN_SERVER_IP"
        autosyn-client-connect $AUTOSYN_SERVER_IP
      else
        echo "No pude conectarme a la IP que esperaba ($AUTOSYN_SERVER_IP)"

        echo "Intentando encontrarla mediante nmap/arp..."
        ip=$(autosyn-mac2ip $AUTOSYN_NET $AUTOSYN_SERVER_MAC)

        echo "Encontre: $ip"
        if autosyn-config-update $ip; then
            autosyn-client-connect $ip
        fi
      fi
      ;;
  esac
fi
