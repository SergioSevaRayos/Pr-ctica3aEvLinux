#!/bin/bash

# Bloquear el acceso a las carpetas compartidas con Samba
sudo iptables -A INPUT -p udp --dport 137 -j DROP
sudo iptables -A INPUT -p udp --dport 138 -j DROP
sudo iptables -A INPUT -p tcp --dport 139 -j DROP
sudo iptables -A INPUT -p tcp --dport 445 -j DROP

echo "Acceso a carpetas compartidas bloqueado"
