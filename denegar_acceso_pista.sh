#!/bin/bash

# Directorio compartido
DIRECTORIO="/var/lib/samba/Compartida/Pista"

# Revocar permisos a 'ingenieria' para el directorio
echo "Revocando permisos a 'ingenieria'..."
sudo setfacl -x u:ingenieria $DIRECTORIO
echo "Permisos ajustados: acceso revocado a 'ingenieria' para el directorio $DIRECTORIO"
