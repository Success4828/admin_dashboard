#!/bin/bash

system_info() {
    echo "System Information:"
    echo "======================"
    echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2)"
    echo "Kernel: $(uname -r)"
    echo "CPU Info: $(lscpu | grep 'Model name')"
    echo "Memory Usage: $(free -h)"
    echo "Disk Usage: $(df -h)"
}
