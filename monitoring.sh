#!/bin/bash

# Architecture
arc=$(uname -a)

# CPU physique
pcpu=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)

# vCPU
vcpu=$(grep "processor" /proc/cpuinfo | wc -l)

# RAM
mem_usage=$(free -m | awk '$1 == "Mem:" {print $3}')
mem_total=$(free -m | awk '$1 == "Mem:" {print $2}')
mem_percent=$(free -m | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# Disque
disk_usage=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{sum+=$3} END {print sum}')
disk_total=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{sum+=$2} END {print sum}')
disk_percent=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{sum+=$3} {total+=$2} END {printf("%d"), sum/total*100}')

# Charge CPU 
cpuload=$(top -bn1 | grep "^%Cpu" | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')

# Last boot
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# LVM use
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

# TCP Connections
tcpc=$(ss -ta | grep ESTAB | wc -l)

# User log
ulog=$(users | wc -w)

# Network (IP / MAC)
ip=$(hostname -I)
mac=$(ip link | grep "link/ether" | awk '{print $2}')

# Sudo commands (On compte les lignes dans le fichier de log qu'on a configuré)
cmnd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
# Note : Si journalctl ne donne rien, utilise : grep "COMMAND" /var/log/sudo/sudo.log | wc -l

wall "	#Architecture: $arc
	#CPU physical : $pcpu
	#vCPU : $vcpu
	#Memory Usage: $mem_usage/${mem_total}MB ($mem_percent%)
	#Disk Usage: $disk_usage/${disk_total}Mb ($disk_percent%)
	#CPU load: $cpuload
	#Last boot: $lb
	#LVM use: $lvmu
	#Connections TCP : $tcpc ESTABLISHED
	#User log: $ulog
	#Network: IP $ip ($mac)
	#Sudo : $cmnd cmd"
