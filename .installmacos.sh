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
brew install borders
brew install btop
brew install bun
brew install cloudfoundry/tap/cf-cli@8
brew install fastfetch
brew install fsouza/prettierd/prettierd
brew install fzf
brew install gh
brew install git-delta
brew install grep
brew install jesseduffield/lazydocker/lazydocker
brew install jesseduffield/lazygit/lazygit
brew install jq
brew install lua-language-server
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
brew install switchaudio-osx
brew install tailscale
brew install zoxide

# Brew install casks. Casks are apps with a GUI
echo "Installing brew casks..."
brew install --cask --no-quarantine zen-browser
brew install --cask font-hack-nerd-font
brew install --cask ghostty
brew install --cask mos
brew install --cask nikitabobko/tap/aerospace
brew install --cask sf-symbols
brew install --cask wireshark

# MacOS settings
echo "Changing MacOS default settings..."
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock expose-group-apps -bool true && killall Dock
defaults write -g NSWindowShouldDragOnGesture -bool true # Allows dragging windows with ctrl + cmd in Aerospace

# Install Sketchybar app font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc

# Start services
brew services start sketchybar
