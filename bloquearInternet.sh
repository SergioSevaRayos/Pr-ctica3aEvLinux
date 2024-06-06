#!/bin/bash

# Bloquear el acceso a Internet para las IPs específicas
sudo iptables -t nat -D POSTROUTING -o enp0s3 -j MASQUERADE 2>/dev/null || true

sudo iptables -D FORWARD -i enp0s3 -o enp0s8 -m state --state RELATED,ESTABLISHED -j ACCEPT 2>/dev/null || true

sudo iptables -D FORWARD -i enp0s8 -o enp0s3 -j ACCEPT 2>/dev/null || true

sudo iptables -D FORWARD -s 192.168.1.0/24 -o enp0s3 -j DROP 2>/dev/null || true

sudo iptables -D OUTPUT -s 192.168.1.0/24 -j ACCEPT 2>/dev/null || true

echo "Acceso a Internet bloqueado"

