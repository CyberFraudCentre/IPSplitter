#!/bin/bash

x=0
while [ "1" = "1" ]
do

    read -n 30 -p "Please input the IP range (Enter X if done)" ip
    if [ "$ip" = "X" ]; then
        break
    fi
    x=$(( $x + 1 ))
    nmap -sn $ip -oG - | awk '/Up$/{print $2}'  > ip$x.txt
done

b=0
while [ $b -le $x ]
do
    b=$(( $b + 1 ))
    $(cat "ip$b.txt" >> final)
done

lines=$(cat final | wc -l)
read -n 1 -p "How many people are on the internal?" people

calc=$(echo $(( $lines / $people )))
split final -l $calc


rm final ip*.txt
