# auto-synergy

Script to start a Synergy Client automatically

## Requirements

nmap
synergyc
telnet
expect 

## Install & Configure

Clone this repo
Create a configuration in known_networks dir
Edit 90synergy accordingly
Copy it to /etc/NetworkManager/dispatcher.d/
Change owner/mask
Enjoy

## TODO

[ ] Buscar una forma más elegante de obtener la red actual (ver función findCurrentNetwork)
[ ] Homogeneizar los nombres de las funciones con un sufijo (synergy-?)
[ ] Comprobar que las aplicaciones necesarias existan

