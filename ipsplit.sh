#!/bin/bash

args=("$@")

read -n 1 -p "How many IP ranges are you working with?" iprange

if [ "$iprange" = "1" ]; then
    clear
    read -n 30 -p "Please input the IP range" ip1
    nmap -sn $ip1 -oG - | awk '/Up$/{print $2}'  > ip1.txt

    elif [ "$iprange" = "2" ]; then
        clear
        read -n 30 -p "Please input the IP range for the first IP " ip1
        read -n 30 -p "Please input the IP range for the second IP " ip2
        nmap -sn $ip1 -oG - | awk '/Up$/{print $2}'  > ip1.txt
        nmap -sn $ip2 -oG - | awk '/Up$/{print $2}'  > ip2.txt
    elif [ "$iprange" = "3" ]; then
        clear
        read -n 30 -p "Please input the IP range for the first IP" ip1
        read -n 30 -p "Please input the IP range for the second IP" ip2
        read -n 30 -p "Please input the IP range for the third IP" ip3
        nmap -sn $ip1 -oG - | awk '/Up$/{print $2}'  > ip1.txt
        nmap -sn $ip2 -oG - | awk '/Up$/{print $2}'  > ip2.txt
        nmap -sn $ip3 -oG - | awk '/Up$/{print $2}'  > ip3.txt
    elif [ "$iprange" = "4" ]; then
        clear
        read -n 30 -p "Please input the IP range for the first IP" ip1
        read -n 30 -p "Please input the IP range for the second IP" ip2
        read -n 30 -p "Please input the IP range for the third IP" ip3
        read -n 30 -p "Please input the IP range for the fourth IP" ip4
        nmap -sn $ip1 -oG - | awk '/Up$/{print $2}'  > ip1.txt
        nmap -sn $ip2 -oG - | awk '/Up$/{print $2}'  > ip2.txt
        nmap -sn $ip3 -oG - | awk '/Up$/{print $2}'  > ip3.txt
        nmap -sn $ip4 -oG - | awk '/Up$/{print $2}'  > ip4.txt
    fi

$(cat "ip1.txt" >> final)
$(cat "ip2.txt" >> final)
$(cat "ip3.txt" >> final)
$(cat "ip4.txt" >> final)

lines=$(cat final | wc -l)
read -n 1 -p "How many people are on the internal?" people

calc=$(echo $(( $lines / $people )))
split final -l $calc