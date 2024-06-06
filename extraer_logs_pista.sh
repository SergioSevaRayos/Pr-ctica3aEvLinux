  GNU nano 6.2                                                                                extraer_logs_pista.sh                                                                                         
#!/bin/bash
# Archivo de salida para los logs
LOG_FILE="/home/ingenieria/access_logs.txt"

# Extraer los logs de auditoría relacionados con la clave pista_access
sudo ausearch -k pista_access -i > "$LOG_FILE"

echo "Logs guardados en $LOG_FILE"
