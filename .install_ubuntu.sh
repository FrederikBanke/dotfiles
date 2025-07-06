# Make sure we have the necessary packages installed.

### This is for Ubuntu ###

# Setup PATH
# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add apt repositories
if [ -f /etc/apt/sources.list.d/rust-tools.list ]; then
    echo "rust-tools repository already added."
else
    echo "Adding repository rust-tools."
    curl -fsSL https://apt.cli.rs/pubkey.asc | sudo tee -a /usr/share/keyrings/rust-tools.asc
    curl -fsSL https://apt.cli.rs/rust-tools.list | sudo tee /etc/apt/sources.list.d/rust-tools.list
    sudo apt update
fi

# Install stow
if ! command -v "stow" &> /dev/null; then
    echo "stow command not found. Installing..."
    sudo apt install stow

    # Check if the installation was successful
    if command -v "brew" &> /dev/null; then
        echo "stow installed successfully."
    else
        echo "Failed to install stow."
    fi
else
    echo "stow already installed."
fi

# Install homebrew
if ! command -v "brew" &> /dev/null; then
    echo "brew command not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    # Install Homebrew's dependencies
    echo "Install build-essential"
    sudo apt install build-essential

    # Check if the installation was successful
    if command -v "brew" &> /dev/null; then
        # It is recommended to install GCC
        echo "Install gcc with brew"
        brew install gcc
        echo "brew installed successfully."
    else
        echo "Failed to install brew."
    fi
else
    echo "Homebrew already installed. Updating homebrew..."
    brew update
fi

# Install ripgrep
if ! command -v "rg" &> /dev/null; then
    echo "ripgrep command not found. Installing..."
    sudo apt update
    sudo apt install ripgrep
    # Check if the installation was successful
    if command -v "rg" &> /dev/null; then
        echo "ripgrep installed successfully."
    else
        echo "Failed to install ripgrep."
    fi
else
    echo "ripgrep already installed."
fi

# Install fd
if ! command -v "fd" &> /dev/null; then
    echo "fd command not found. Installing..."
    sudo apt update
    sudo apt install fd
    # Check if the installation was successful
    if command -v "fd" &> /dev/null; then
        echo "fd installed successfully."
    else
        echo "Failed to install fd."
    fi
else
    echo "fd already installed."
fi

# Install fzf
if ! command -v "fzf" &> /dev/null; then
    echo "fzf command not found. Installing..."
    sudo apt update
    brew install fzf
    # Check if the installation was successful
    if command -v "fzf" &> /dev/null; then
        echo "fzf installed successfully."
    else
        echo "Failed to install fzf."
    fi
else
    echo "fzf already installed."
fi

# Install zoxide
if ! command -v "zoxide" &> /dev/null; then
    echo "zoxide command not found. Installing..."
    sudo apt update
    sudo apt install zoxide
    # Check if the installation was successful
    if command -v "zoxide" &> /dev/null; then
        echo "zoxide installed successfully."
    else
        echo "Failed to install zoxide."
    fi
else
    echo "zoxide already installed."
fi

# Install Tmux plugin manager
if [ -d "$HOME/.tmux/plugins/tpm" ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Everything is installed for Ubuntu. Run 'stow .' inside the dotfiles/ directory to create links for the config files."
