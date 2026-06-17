#!/bin/bash

LISTA_USUARIOS="/home/vagrant/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt"

grep -v '^#' "$LISTA_USUARIOS" | grep -v 'Nombre_Usuario' | while IFS=, read -r USUARIO GRUPO HOME_DIR; do
    
    USUARIO=$(echo "$USUARIO" | tr -d ' ')
    GRUPO=$(echo "$GRUPO" | tr -d ' ')
    HOME_DIR=$(echo "$HOME_DIR" | tr -d ' ')

    if [ ! -z "$USUARIO" ]; then
        if ! getent group "$GRUPO" > /dev/null 2>&1; then
            sudo groupadd "$GRUPO"
        fi

        CLAVE_CRYPT=$(openssl passwd -6 "$USUARIO")
        sudo useradd -m -d "$HOME_DIR" -g "$GRUPO" -p "$CLAVE_CRYPT" -s /bin/bash "$USUARIO"
    fi

done

echo "Usuarios, grupos y directorios creados con éxito."
