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

# The following lines were added by compinstall
zstyle :compinstall filename '/home/banke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Setup ENVIRONMENT VARIABLES
export XDG_CONFIG_HOME=~/.config
export VISUAL=nvim
export EDITOR=nvim

# Init starship prompt. Configure look in ~/.config/starship.toml
eval "$(starship init zsh)"

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
alias ls='ls --color' # Always use colors for files and dirs

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Set the directory we want to store zinit and plugins.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet.
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

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
