!/bin/bash

# Permitir el acceso a las carpetas compartidas con Samba
sudo iptables -D INPUT -p udp --dport 137 -j DROP 2>/dev/null || true
sudo iptables -D INPUT -p udp --dport 138 -j DROP 2>/dev/null || true
sudo iptables -D INPUT -p tcp --dport 139 -j DROP 2>/dev/null || true
sudo iptables -D INPUT -p tcp --dport 445 -j DROP 2>/dev/null || true

echo "Acceso a carpetas compartidas permitido"
