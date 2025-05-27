#!/bin/bash
echo "===================================="
echo " SYSTEM ADMINISTRATION DASHBOARD "
echo "===================================="
echo "1) System Information"
echo "2) User Management"
echo "3) Process Management"
echo "4) Exit"
echo "5) Network Information"

read -p "Choose an option: " choice
system_info() {
    echo "System Information:"
    echo "==================="
    echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2)"
    echo "Kernel Version: $(uname -r)"
    echo "CPU Info: $(lscpu | grep 'Model name')"
    echo "Memory Usage: $(free -h)"
    echo "Disk Usage: $(df -h)"
}
user_management() {
    echo "User Management:"
    echo "==================="
    echo "1) List all users"
    echo "2) Add new user"
    echo "3) Delete user"
    echo "4) Back to Menu"
    read -p "Choose an option: " user_choice

    if [[ $user_choice -eq 1 ]]; then
        cut -d: -f1 /etc/passwd
    elif [[ $user_choice -eq 2 ]]; then
        read -p "Enter new username: " new_user
        sudo adduser $new_user
    elif [[ $user_choice -eq 3 ]]; then
        read -p "Enter username to delete: " del_user
        sudo deluser $del_user
    fi
}
process_management() {
    echo "Process Management:"
    echo "==================="
    echo "1) Show running processes"
    echo "2) Kill a process"
    echo "3) Back to Menu"
    read -p "Choose an option: " process_choice

    if [[ $process_choice -eq 1 ]]; then
        ps aux --sort=-%cpu | head -10
    elif [[ $process_choice -eq 2 ]]; then
        read -p "Enter process ID to kill: " pid
        sudo kill -9 $pid
    fi
}
network_info() {
    echo "Network Information:"
    echo "======================"
    echo "IP Configuration:"
    ip a | grep "inet"

    echo "Routing Table:"
    ip route

    echo "Active Network Connections:"
    ss -tulnp

    echo "DNS Settings:"
    cat /etc/resolv.conf

    echo "ARP Table:"
    arp -a
}


