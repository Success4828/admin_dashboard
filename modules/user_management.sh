#!/bin/bash

user_management() {
    echo "=============== USER MANAGEMENT ==============="
    echo "1) List all users"
    echo "2) Add new user"
    echo "3) Delete user"
    echo "4) Back to Menu"

    read -p "Choose an option: " user_choice

    case $user_choice in
        1) cut -d: -f1 /etc/passwd ;;
        2) read -p "Enter new username: " new_user; sudo adduser $new_user ;;
        3) read -p "Enter username to delete: " del_user; sudo deluser $del_user ;;
        4) return ;;
        *) echo "Invalid option! Please enter a number between 1-4." ;;
    esac
}
