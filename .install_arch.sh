#!/bin/bash
# Helper functions
function yes_or_no {
  while true; do
	  read -p "$* [y/n]: " yn
	  case $yn in
		  [Yy]*) echo "Yes" ; return 0 ;;
		  [Nn]*) echo "No" ; return 1 ;;
  esac
done
}

os=""
summary=""
# Declare repos to add. The key must be the exact name, as we use it to detect existing repos.
declare -A REPOS=(
["lizardbyte"]="[lizardbyte]
SigLevel = Optional
Server = https://github.com/LizardByte/pacman-repo/releases/latest/download

[lizardbyte-beta]
SigLevel = Optional
Server = https://github.com/LizardByte/pacman-repo/releases/download/beta "
["oglo-arch-repo"]="[oglo-arch-repo]
SigLevel = Optional DatabaseOptional
Server = https://gitlab.com/Oglo12/\$repo/-/raw/main/\$arch "
)

summary+="- Install for $opt"

# Create cache file for pywal colors for Hyprland
if [ ! -f ~/.cache/wal/colors-hyprland.conf ]; then
    sudo mkdir -p ~/.cache/wal
    sudo touch ~/.cache/wal/colors-hyprland.conf
    summary+="\n- Created ~/.cache/wal/colors-hyprland.conf"
fi


# Setup yay
yes_or_no "Install and setup yay (AUR helper)?" && {
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	echo "Run yay first time use"
	yay -Y --gendb
	yay -Syu --devel
	yay -Y --devel --save
	summary+="\n- Installed and setup yay (AUR helper)"
}

# Setup tmux
yes_or_no "Install and setup tmux and plugin manager?" && {
	sudo pacman -S --needed tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	summary+="\n- Installed and setup tmux and tmux plugin manager"
}

# Setup github CLI
yes_or_no "Do you want to setup the Github CLI?" && {
	sudo pacman -S --needed git github-cli
    echo "Github config:"
	read -p "email: " gitemail
	read -p "name: " gitname
    git config --global user.email "$gitemail"
    git config --global user.name "$gitname"
    gh auth login
	summary+="\n- Github CLI config setup"
}

# Install dotfiles
if [ -d "$HOME/dotfiles" ]; then
	echo "~/dotfiles directory already exists"
else
	echo "Installing dotfiles to ~/dotfiles..."
	git clone https://github.com/frederikbanke/dotfiles ~/dotfiles --depth=1
fi

echo "Installing stow..."
sudo pacman -S --needed --noconfirm stow
echo "Stow installed!"
echo "Installing flatpak..."
sudo pacman -S --needed --noconfirm flatpak
echo "Flatpak installed!"
stow -d ~/dotfiles -t ~ --adopt .
echo "Dotfiles installed and linked!"

# Backup pacman.conf
echo "Backing up /etc/pacman.conf to /etc/pacman.conf.bak"
sudo cp /etc/pacman.conf /etc/pacman.conf.bak

# Ask which repos to add
# Append each repo to pacman.conf. Will skip existing repos
for repo in "${!REPOS[@]}"; do
	read -p "Do you want to add the '$repo' repo? (y/n) " answer
	if [[ "$answer" =~ ^[Yy]$ ]]; then
		# Check if repo exists
		if ! grep -qF "[$repo]" /etc/pacman.conf; then
			echo "Adding: $repo"
			echo "${REPOS[$repo]}" | sudo tee -a /etc/pacman.conf > /dev/null
			echo "" | sudo tee -a /etc/pacman.conf > /dev/null # Add empty line
			summary+="\n- Added $repo to /etc/pacman.conf"
		else
			echo "Already exists: $repo"
		fi
	fi
done
echo "Repositories added!"

# Update databases
sudo pacman -Syu

# Install programs
# Install display manager
yes_or_no "Install and setup greetd? (display manager)" && {
	echo "Installing greetd and greetd-regreet..."
	sudo pacman -S greetd greetd-regreet
	echo "greetd and greetd-regreet installed! Run setup..."
    sudo mkdir -p /etc/greetd
	read -p "What is your username?: " USERNAME
	sudo tee /etc/greetd/config.toml > /dev/null <<EOF
[terminal]
vt = 1

[default_session]
command = "Hyprland --config /etc/greetd/hyprland.conf"
user = "$USERNAME"
EOF
	sudo tee /etc/greetd/hyprland.conf > /dev/null <<EOF
exec-once = regreet; hyprctl dispatch exit
misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    disable_hyprland_qtutils_check = true
}
EOF
    sudo systemctl enable greetd.service
    
	echo "greetd has been set up!"
	summary+="\n- Installed and setup greetd and greetd-regreet. The service has been enabled for the next boot. To run it now, type 'sudo systemctl start greetd.service'."
}

# Install Rebos
yes_or_no "Install and setup Rebos?" && {
	echo "Installing Rebos..."
	sudo pacman -S rebos
	echo "Rebos installed! Run setup..."
	rebos setup
	rebos config init
	rebos config check
	echo "Rebos has been set up!"
	summary+="\n- Installed and setup Rebos. Run 'rebos gen commit init' and then 'rebos gen current build'."
}

# Install and set zsh
yes_or_no "Install and setup zsh?" && {
	echo "Installing zsh..."
	sudo pacman -S --needed --noconfirm zsh
	echo "Set zsh as default shell"
	chsh -s $(which zsh)
	echo "zsh has been set up!"
	summary+="\n- Installed and setup zsh as default shell. Restart terminal for change to apply."
}

# Setup system keybinds
yes_or_no "Do you want to setup system wide keybinds?" && {
    if [ ! -f /etc/keyd/default.conf ]; then
        sudo mkdir -p /etc/keyd
        sudo touch /etc/keyd/default.conf
        sudo tee -a /etc/keyd/default.conf > /dev/null <<EOF
[ids]

*

[main]

EOF
		summary+="\n- Created /etc/keyd/default.conf"
    fi

	sudo pacman -S --needed keyd
    sudo systemctl enable keyd.service
    sudo systemctl start keyd.service
	# Check if keybind already exists
	if ! grep -qF "capslock = " /etc/keyd/default.conf; then
		echo "Adding keybind for capslock"
        sudo tee -a /etc/keyd/default.conf > /dev/null <<EOF
# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

EOF
		summary+="\n- Added keybind for capslock to /etc/keyd/default.conf"
	else
		echo "Keybind for capslock already exists. Change it manually in /etc/keyd/default.conf"
	fi
	if ! grep -qF "\` = " /etc/keyd/default.conf; then
		echo "Adding keybind for ½ = $"
        sudo tee -a /etc/keyd/default.conf > /dev/null <<EOF
# Remap ½ to $
# This is for Nordic Windows keyboards. Adds $ to the same place as it is on a MacOS keyboard.
\` = macro(G-4)

EOF
		summary+="\n- Added keybind for ½ = \$ to /etc/keyd/default.conf"
	else
		echo "Keybind for ½ already exists. Change it manually in /etc/keyd/default.conf"
	fi
    sudo keyd reload
}

printf "\n\nInstallation finished! Printing summary:\n\n"
printf -- "$summary"
