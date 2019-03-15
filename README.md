# auto-synergy

Script to start a Synergy Client automatically

## Requirements

* synergyc (dah!)
* NetworkManager
* nc 
* nmap
* telnet
* expect 

## Install & Configure

1. Clone this repo
2. Create a configuration in known_networks dir
3. Edit 90synergy accordingly
4. Copy it to /etc/NetworkManager/dispatcher.d/
5. Change owner/mask
6. Enjoy

## TODO

* [ ] Buscar una forma más elegante de obtener la red actual (ver función findCurrentNetwork)
* [ ] Homogeneizar los nombres de las funciones con un sufijo (synergy-?)
* [ ] Comprobar que las aplicaciones necesarias existan
* [ ] Script para instalar automáticamente
* [ ] Script para agregar redes
