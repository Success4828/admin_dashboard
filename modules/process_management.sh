#!/bin/bash

process_management() {
    echo "=============== PROCESS MANAGEMENT ==============="
    echo "1) Show top running processes"
    echo "2) Kill a process"
    echo "3) Back to Menu"

    read -p "Choose an option: " process_choice

    case $process_choice in
        1) ps aux --sort=-%cpu | head -10 ;;
        2) read -p "Enter process ID to kill: " pid; sudo kill -9 $pid ;;
        3) return ;;
        *) echo "Invalid option! Please enter a number between 1-3." ;;
    esac
}
