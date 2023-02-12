#!/bin/bash

numINPUT=$(sudo iptables -L INPUT --line-numbers | wc -l)
numINPUT=$(($numINPUT-2))

for (( i=1; i<=numINPUT; i++ ))
do

	sudo iptables -D INPUT 1
done

sudo iptables -A INPUT -i anywhere -j DROP
sudo iptables --policy INPUT DROP

numFORWARD=$(sudo iptables -L FORWARD --line-numbers | wc -l)
numFORWARD=$(($numFORWARD))

for (( j=1; j<=numFORWARD; j++ ))
do
	sudo iptables -D FORWARD 1
done

sudo iptables -A FORWARD -i anywhere -j DROP
sudo iptables --policy FORWARD DROP
numOUTPUT=$(sudo iptables -L OUTPUT --line-numbers | wc -l)
numOUTPUT=$((numOUTPUT-2)
for (( k=1; k<numOUTPUT; k++ ))
do
	sudo iptables -D OUTPUT 1
done

sudo iptables -A OUTPUT -o anywhere -j DROP
sudo iptables --policy OUTPUT DROP
