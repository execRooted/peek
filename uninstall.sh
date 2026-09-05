#!/bin/bash

set -e

if [ -z "$TERM" ]; then
    export TERM=xterm
fi

clear
echo -e "\033[34mpeek uninstaller\033[0m"
echo -e "\033[34m================\033[0m"

echo -e "\033[34mby execRooted\033[0m"
echo ""

INSTALL_DIR="${HOME}/.local/bin"

if [ -f "${INSTALL_DIR}/peek" ]; then
    echo -e "\033[1;33m[INFO]\033[0m Removing peek from ${INSTALL_DIR}..."
    rm -f "${INSTALL_DIR}/peek"
    echo -e "\033[36m[SUCCESS]\033[0m Uninstallation complete!"
else
    echo -e "\033[1;33m[INFO]\033[0m peek is not installed."
fi
