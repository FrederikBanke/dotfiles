#!/bin/bash

echo "Running install script. Checking which OS is running..."
# Run MacOS specific installations.
if [[ $(uname) == "Darwin" ]]; then
    read -p "Install for MacOS? (y/n) " -n 1 -r
    echo # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing for MacOS"
        [ -f .installmacos.sh ] && source .installmacos.sh
    fi
fi
if [[ $(uname) == "Linux" ]]; then
    DIST=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
    read -p "Install for $DIST? (y/n) " -n 1 -r
    echo # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Install for Distro $DIST"
        if [[ $DIST == "ubuntu" ]]; then
            [ -f .install_ubuntu.sh ] && source .install_ubuntu.sh
        fi
    fi
fi
