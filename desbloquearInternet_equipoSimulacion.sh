#!/bin/bash
sudo iptables -F
sudo iptables -X
sudo iptables -Z
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t nat -Z
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -t mangle -Z
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

sudo ./desbloquearInternetIP192_168_1_2.sh
sudo ./bloquearInternetIP192_168_1_1.sh
sudo ./bloquearInternetIP192_168_1_3.sh
#sudo ./desbloquearInternetIP192_168_1_2.sh



echo "Acceso a Internet desbloqueado"
