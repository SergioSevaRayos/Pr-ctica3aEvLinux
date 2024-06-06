#!/bin/bash
# IP equipo simulador
IP_ESPECIFICA="192.168.1.2"

# Eliminar las reglas que bloquean el acceso a las carpetas compartidas con Samba desde la IP específica
sudo iptables -D INPUT -s $IP_ESPECIFICA -p udp --dport 137 -j DROP
sudo iptables -D INPUT -s $IP_ESPECIFICA -p udp --dport 138 -j DROP
sudo iptables -D INPUT -s $IP_ESPECIFICA -p tcp --dport 139 -j DROP
sudo iptables -D INPUT -s $IP_ESPECIFICA -p tcp --dport 445 -j DROP


echo "Acceso a carpetas compartidas desbloqueado para la IP $IP_ESPECIFICA"
