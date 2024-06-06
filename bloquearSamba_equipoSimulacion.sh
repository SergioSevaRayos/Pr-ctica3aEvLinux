#!/bin/bash
# IP del equipo simulador
IP_ESPECIFICA="192.168.1.2"

# Bloquear el acceso a las carpetas compartidas con Samba desde la IP específica
sudo iptables -A INPUT -s $IP_ESPECIFICA -p udp --dport 137 -j DROP
sudo iptables -A INPUT -s $IP_ESPECIFICA -p udp --dport 138 -j DROP
sudo iptables -A INPUT -s $IP_ESPECIFICA -p tcp --dport 139 -j DROP
sudo iptables -A INPUT -s $IP_ESPECIFICA -p tcp --dport 445 -j DROP

echo "Acceso a carpetas compartidas bloqueado para la IP $IP_ESPECIFICA"
