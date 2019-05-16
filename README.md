# auto-synergy

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

* [ ] https://google.github.io/styleguide/shell.xml
* [ ] Buscar una forma más elegante de obtener la red actual (ver función autosyn-network-getCurrent)
* [x] Homogeneizar los nombres de las funciones con un sufijo (autosyn-*)
* [x] Script para instalar automáticamente
  * [x] Comprobar que las aplicaciones necesarias existan
  * [ ] Comprobar que el gestor de redes sea NetworkManager
* [ ] Script para agregar redes (modo cliente/servidor) 
* [ ] Distinguir entre niveles los de verbosidad/logueo del synergy y de los scripts autosyn
* [ ] CLIENTE: Esperar a que el servidor levante, cualquiera sea su IP
