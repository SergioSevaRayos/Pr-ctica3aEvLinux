#!/bin/bash

# Desbloquear el acceso a Internet para las IPs específicas
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
sudo iptables -A FORWARD -i enp0s3 -o enp0s8 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -s 192.168.1.0/24 -o enp0s3 -j DROP  
sudo iptables -A OUTPUT -s 192.168.1.0/24 -j ACCEPT 
echo "Acceso a Internet desbloqueado"
