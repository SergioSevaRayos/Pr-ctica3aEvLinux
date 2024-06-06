#!/bin/bash
# Bloquear el acceso a Internet desde la IP específica 192.168.1.2
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
sudo iptables -A FORWARD -i enp0s3 -o enp0s8 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
sudo iptables -A FORWARD -s 192.168.1.2 -o enp0s3 -j DROP  # Bloquear tráfico saliente hacia Internet desde 192.168.1.2
sudo iptables -A OUTPUT -s 192.168.1.2 -j DROP  # Bloquear tráfico saliente desde 192.168.1.2

echo "Acceso a Internet bloqueado para 192.168.1.2"
