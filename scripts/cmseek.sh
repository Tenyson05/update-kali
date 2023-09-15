#!/bin/bash
set -Eeuo pipefail
trap "echo -e \"\033[1;31m[!] \e[0m Script error occured.\"" ERR

GREEN="\033[1;32m"
ENDCOLOR="\e[0m"

# === Exit without proceeding if run in WSL ===
if [ -f /mnt/c/Windows/System32/wsl.exe ]; then
    exit 0
fi

# === Exit without proceeding if run on a non-Kali distro ===
if ! grep -Fxvq "kali-rolling" /etc/debian_version; then
    exit 0
fi

# Check if cmseek is installed
if [ ! -d "/opt/cmseek" ]
then
    echo -ne $GREEN"[+] "$ENDCOLOR; echo "Installing cmseek"
    sudo apt install cmseek
fi
