#!/bin/bash

# Exit immediately if any command fails
set -e

echo "==========================================="
echo "   Debian Fresh Install Automation Script   "
echo "==========================================="

# 1. Ensure the script is running with administrative privileges
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root or via sudo."
    echo "If sudo isn't installed yet, run: su -c 'apt update && apt install -y sudo && usermod -aG sudo \$USER'"
    echo "Then log out, log back in, and run this script again."
    exit 1
fi

echo "--> Updating package repositories..."
apt update

echo "--> Upgrading existing packages..."
apt upgrade -y

echo "--> Installing core network utilities (curl, wget)..."
apt install -y curl wget

echo "--> Installing terminal web browser (w3m)..."
apt install -y w3m w3m-img

echo "--> Cleaning up package cache..."
apt autoremove -y
apt clean

echo "==========================================="
echo "      Setup Complete Successfully!         "
echo "==========================================="
