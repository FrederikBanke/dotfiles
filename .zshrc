# Configure base zsh setup
HISTFILE=~/.zsh_history 
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase # Erases duplicates in history
unsetopt beep
bindkey -v
setopt appendhistory
setopt sharehistory # Shares command history across sessions
setopt hist_ignore_space # Add a space before a command, to not save it to the hist file
# Dont save duplicates to history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Load MacOS specific shell.
if [[ $(uname) == "Darwin" ]]; then
    [ -f .macrc ] && source .macrc
fi
# Load Ubuntu specific shell.
if [[ $(uname) == "Linux" ]]; then
    DIST=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
    if [[ $DIST == "ubuntu" ]]; then
        [ -f .ubunturc ] && source .ubunturc
    fi
fi

# The following lines were added by compinstall
zstyle :compinstall filename '/home/banke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Setup ENVIRONMENT VARIABLES
export XDG_CONFIG_HOME=~/.config
export VISUAL=nvim
export EDITOR=nvim

# Source files
# Load the 'init.sh'. Place stuff that must be loaded before other things in here.
source ~/zshrc/init.sh

# Find all .sh files in ~/zshrc, exclude 'init.sh'.
FILES_STR=$(fd --glob '*.sh' --exclude 'init.sh' ~/zshrc)

# 'tr' is a find-and-replace utility.
# Outer () will convert the output of $() to array.
FILES=($(echo $FILES_STR | tr '\n' ' '))

for FILE in $FILES; do
    source $FILE
done

# Add history search using the arrow keys.
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Ignore case when matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no # Disable default zsh completion menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # Add interactive menu to cd command

# Aliases
alias set-screen-60hz="xrandr --output DP-0 --mode 2560x1440 --rate 60"
alias set-screen-144hz="xrandr --output DP-0 --mode 2560x1440 --rate 144"
alias vim='nvim'
alias ls='ls --color' # Always use colors for files and dirs
alias lg='lazygit'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# Apply colors from pywal to new terminals
if [ -f ~/.cache/wal/sequences ]; then
    (cat ~/.cache/wal/sequences &)
fi

if [ -f ~/.cache/wal/colors-tty.sh ]; then
    source ~/.cache/wal/colors-tty.sh
fi

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# Add to PATH
# Add cargo to path
path+="$HOME/.cargo/bin"
export PATH

# Load NVM
export NVM_DIR=~/.nvm
# Check which OS. Darwin is MacOS.
if [[ $(uname) == "Darwin" ]]; then
    source $(brew --prefix nvm)/nvm.sh
else
    source ~/.nvm/nvm.sh
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
