#!/bin/bash

PS3="Please enter your choice: "
options=("Arch" "Ubuntu" "MacOS" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Arch")
			os="$opt"
			break;;
		"Ubuntu")
			os="$opt"
			break;;
		"MacOS")
			os="$opt"
			break;;
		"Quit")
			os=""
			break;;
		*) echo "Invalid option: $REPLY";;
	esac
done

if [ -z "$os" ]; then
	echo "Cancel installation"
	exit 0
fi

echo "Run $opt installation"

if [[ "$opt" == "MacOS" ]]; then
    read -p "Install for MacOS? (y/n) " -n 1 -r
    echo # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        [ -f .installmacos.sh ] && source .installmacos.sh
    fi
fi
if [[ "$opt" == "Arch" ]]; then
    read -p "Install for Arch? (y/n) " -n 1 -r
    echo # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        [ -f .install_arch.sh ] && source .install_arch.sh
    fi
fi
if [[ "$opt" == "Ubuntu" ]]; then
    read -p "Install for Ubuntu? (y/n) " -n 1 -r
    echo # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        [ -f .install_ubuntu.sh ] && source .install_ubuntu.sh
    fi
fi


# echo "Running install script. Checking which OS is running..."
# # Run MacOS specific installations.
# if [[ $(uname) == "Darwin" ]]; then
#     read -p "Install for MacOS? (y/n) " -n 1 -r
#     echo # move to a new line
#     if [[ $REPLY =~ ^[Yy]$ ]]; then
#         echo "Installing for MacOS"
#         [ -f .installmacos.sh ] && source .installmacos.sh
#     fi
# fi
# if [[ $(uname) == "Linux" ]]; then
#     DIST=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
#     read -p "Install for $DIST? (y/n) " -n 1 -r
#     echo # move to a new line
#     if [[ $REPLY =~ ^[Yy]$ ]]; then
#         echo "Install for Distro $DIST"
#         if [[ $DIST == "ubuntu" ]]; then
#             [ -f .install_ubuntu.sh ] && source .install_ubuntu.sh
#         fi
#     fi
# fi
