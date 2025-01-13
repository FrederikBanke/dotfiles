# Install brew if it is not installed.
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

# Brew taps
brew tap cloudfoundry/tap
brew tap felixkratz/formulae
brew tap fsouza/prettierd
brew tap homebrew/services
brew tap jesseduffield/lazygit
brew tap oven-sh/bun
brew tap sidneys/homebrew
brew tap stripe/stripe-cli
brew tap supabase/tap
brew tap teamookla/speedtest
brew tap zen-browser/desktop

# Brew install formulae
echo "Installing brew formulae..."
brew install bat
brew install btop
brew install bun
brew install cloudfoundry/tap/cf-cli@8
brew install fastfetch
brew install fsouza/prettierd/prettierd
brew install fzf
brew install gh
brew install grep
brew install jesseduffield/lazygit/lazygit
brew install nvim
brew install nvm
brew install oven-sh/bun/bun
brew install python
brew install ranger
brew install ripgrep
brew install sketchybar
brew install speedtest
brew install starship
brew install stow
brew install tailscale
brew install zoxide
brew install jq
brew install switchaudio-osx

# Brew install casks. Casks are apps with a GUI
echo "Installing brew casks..."
brew install --cask font-hack-nerd-font
brew install --cask ghostty
brew install --cask --no-quarantine zen-browser
brew install --cask wireshark
brew install --cask sf-symbols

# MacOS settings
echo "Changing MacOS default settings..."
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true

# Install Sketchybar app font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc

# Start services
brew services start sketchybar
