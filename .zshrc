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

# Init starship prompt. Configure look in ~/.config/starship.toml
eval "$(starship init zsh)"
