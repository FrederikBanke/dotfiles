# Init starship prompt. Configure look in ~/.config/starship.toml
# Function to handle missing commands and install them
if ! command -v "starship" &> /dev/null; then
    echo "Starship prompt not found. Installing..."
    curl -sS https://starship.rs/install.sh | sh
    # Check if the installation was successful
    if command -v "starship" &> /dev/null; then
        echo "Starship installed successfully."
    else
        echo "Failed to install Starship."
    fi
else
    # If the command exists, handle it normally
    eval "$(starship init zsh)"
fi

