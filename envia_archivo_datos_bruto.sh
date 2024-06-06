#!/bin/bash

# Ruta del archivo a copiar
archivo_origen="/var/lib/samba/Compartida/Ingeniería/datos_bruto.txt"
# Ruta de destino donde se copiará el archivo
carpeta_destino="/var/lib/samba/Compartida/Simulador/"
archivo_destino="datos_bruto.txt"

# Guardar los permisos originales de las carpetas
perm_origen=$(stat -c "%a" "$(dirname "$archivo_origen")")
perm_destino=$(stat -c "%a" "$carpeta_destino")

# Cambiar los permisos de las carpetas para permitir el acceso
echo "Cambiando permisos de las carpetas a 777..."
sudo chmod 777 "$(dirname "$archivo_origen")"
sudo chmod 777 "$carpeta_destino"

# Comprobar si el archivo original existe
if [ -e "$archivo_origen" ]; then
    # Generar un nombre de archivo único con la fecha y hora actual
    timestamp=$(date +%Y%m%d%H%M%S)
    archivo_destino="${carpeta_destino}datos_bruto${timestamp}.txt"
    # Copiar el archivo
    cp "$archivo_origen" "$archivo_destino"
    echo "Archivo enviado a la carpeta Simulador: $archivo_destino"
else
    echo "El archivo original '$archivo_origen' no existe."
fi

# Restaurar los permisos originales de las carpetas
echo "Restaurando permisos de las carpetas a sus valores originales..."
sudo chmod "$perm_origen" "$(dirname "$archivo_origen")"
sudo chmod "$perm_destino" "$carpeta_destino"

echo "Permisos restaurados."
