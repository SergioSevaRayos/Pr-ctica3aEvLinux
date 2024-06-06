#!/bin/bash

# Directorio compartido
DIRECTORIO="/var/lib/samba/Compartida/Pista"

# Grupo compartido
GRUPO="sharedgroup"

# Asegurarse de que el grupo existe y agregar los usuarios
sudo groupadd -f $GRUPO

sudo usermod -aG $GRUPO ingenieria
sudo usermod -aG $GRUPO pista

# Cambiar el grupo del directorio y ajustar permisos
if [ -d "$DIRECTORIO" ]; then
    sudo chown -R pista:$GRUPO $DIRECTORIO
    sudo chmod -R 770 $DIRECTORIO
    echo "Permisos ajustados: acceso permitido a 'ingenieria' y 'pista' para el directorio $DIRECTORIO"
else
    echo "El directorio $DIRECTORIO no existe. Creándolo..."
    sudo mkdir -p "$DIRECTORIO"
    sudo chown -R pista:$GRUPO $DIRECTORIO
    sudo chmod -R 770 $DIRECTORIO
    echo "Directorio $DIRECTORIO creado y permisos ajustados: acceso permitido a 'ingenieria' y 'pista'."
fi

# Cambiar permisos para permitir que 'ingenieria' acceda al directorio
sudo setfacl -m u:ingenieria:rwx $DIRECTORIO
echo "Permisos adicionales ajustados: acceso permitido a 'ingenieria' para el directorio $DIRECTORIO"
