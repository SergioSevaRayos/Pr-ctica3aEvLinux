#!/bin/bash

# Ruta del archivo a copiar
archivo_origen="/var/lib/samba/Compartida/Ingeniería/programa_pruebas.txt"

# Ruta de destino donde se copiará el archivo
carpeta_destino="/var/lib/samba/Compartida/Pista/"

# Nombre del archivo destino con timestamp
timestamp=$(date +%Y%m%d%H%M%S)
archivo_destino="${carpeta_destino}programa_pruebas${timestamp}.txt"

# Comprobar si el archivo original existe
if [ -e "$archivo_origen" ]; then
    # Comprobar si el directorio de destino existe, si no, crearlo
    if [ ! -d "$carpeta_destino" ]; then
        echo "El directorio de destino no existe. Creándolo..."
        sudo mkdir -p "$carpeta_destino"
    fi

    # Cambiar permisos del directorio de destino a 777
    echo "Cambiando permisos del directorio de destino a 777..."
    sudo chmod 777 "$carpeta_destino"

    # Copiar el archivo
    cp "$archivo_origen" "$archivo_destino"
    if [ $? -eq 0 ]; then
        echo "Archivo enviado a la carpeta Pista: $archivo_destino"
    else
        echo "Error al copiar el archivo."
    fi

    # Cambiar permisos del directorio de destino a 700
    echo "Restaurando permisos del directorio de destino a 700..."
    sudo chmod 700 "$carpeta_destino"
else
    echo "El archivo original '$archivo_origen' no existe."
fi

