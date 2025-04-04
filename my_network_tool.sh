#!/bin/bash


echo "1) Check Network Interface Information"
echo "2) Ping a Host"
echo "3)Port Scan with Nmap"
echo "4) Display Routing Table"
echo "5) Traceroute to Host"
echo "6) Exit"

read -p "Escolha uma opção: " opcao

echo -e "\n===================================================================="
case $opcao in
    1)
    ip a
    ;;
    2)
    ping -c 4 8.8.8.8
    ;;
    3)
    nmap 192.168.1.0/24
    ;;
    4)
    netstat -rn
    ;;
    5)
    traceroute "8.8.8.8"
    ;;
    6)
    echo "Finish"
    ;;
    *)
    echo "Opção inválida, digite um número de 1 a 6"
    ;;

esac

echo -e "====================================================================\n"