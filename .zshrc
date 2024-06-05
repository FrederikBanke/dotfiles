# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history 
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/banke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Setup ENVIRONMENT VARIABLES
export XDG_CONFIG_HOME=~/.config

# Init starship prompt. Configure look in ~/.config/starship.toml
eval "$(starship init zsh)"
# Add history search using the arrow keys.
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Aliases
alias set-screen-60hz="xrandr --output DP-0 --mode 2560x1440 --rate 60"
alias set-screen-144hz="xrandr --output DP-0 --mode 2560x1440 --rate 144"
