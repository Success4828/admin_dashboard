#!/bin/bash

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
