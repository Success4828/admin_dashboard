#!/bin/bash
# Load module scripts to enable their functions
source modules/system_info.sh
source modules/user_management.sh
source modules/process_management.sh
source modules/network_info.sh

# Display the menu system

while true; do
    echo "===================================="
    echo " SYSTEM ADMINISTRATION DASHBOARD "
    echo "===================================="
    echo "1) System Information"
    echo "2) User Management"
    echo "3) Process Management"
    echo "4) Network Information"
    echo "5) Exit"

    read -p "Choose an option: " choice

    case $choice in
        1) system_info ;;
        2) user_management ;;
        3) process_management ;;
        4) network_info ;;
        5) echo "Exiting... Goodbye!" ; exit 0 ;;
        *) echo "Invalid choice! Please enter a number between 1-5." ;;
    esac
done
        4) network_info ;;
        5) echo "Exiting... Goodbye!" ; exit 0 ;;
        *) echo "Invalid choice! Please enter a number between 1-5." ;;
    esac
done
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

