#!/bin/bash

LISTA_USUARIOS="/home/vagrant/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt"

tail -n +5 "$LISTA_USUARIOS" | while IFS=, read -r USUARIO GRUPO HOME_DIR; do
    
    if ! getent group "$GRUPO" > /dev/null 2>&1; then
        sudo groupadd "$GRUPO"
    fi

    CLAVE_CRYPT=$(openssl passwd -6 "$USUARIO")

    sudo useradd -m -d "$HOME_DIR" -g "$GRUPO" -p "$CLAVE_CRYPT" -s /bin/bash "$USUARIO"

done

echo "Usuarios, grupos y directorios creados con éxito."
