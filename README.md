# My dotfiles

This directory contains the dotfiles for my system.

## Requirements

A package manager is required. For Linux distros these should be installed already, but if on MacOS, download homebrew and use `brew install`.

You will need the following installed on your system

### Git

```bash
pacman -S git # Arch

brew install git # MacOS
```

### Stow

```bash
pacman -S stow # Arch

brew install stow # MacOS
```

### Lazygit

Git GUI for the terminal. I have an Nvim plugin using this.

```bash
pacman -S lazygit # Arch

brew install jesseduffield/lazygit/lazygit # MacOS
```
### ripgrep

A requirement for some Nvim plugins.

```bash
pacman -S ripgrep # Arch

brew install ripgrep # MacOS
```

### prettier

Support for projects using Prettier linting/formatting.

```bash
pacman -S prettierd # Arch

brew install fsouza/prettierd/prettierd # MacOS
```

### iTerm2

On MacOS, the native terminal cannot use true colors. Instead, download iTerm2.

## Installation

First, clone this repository to your home (`$HOME`) directory using git

```bash
git clone git@github.com/frederikbanke/dotfiles.git # Or use HTTPS link
cd dotfiles
```

the use GNU stow to create symlinks

```bash
stow .
```

## Preferences

These are just some small changes/quality of life improvements that I like to have on my system.

### Map CAPS lock to CTRL and ESCAPE
Will map the Caps lock key to CTRL when held and ESCAPE when pressed.

```bash
pacman -S keyd # Arch

sudo systemctl enable keyd # Enable the daemon
```

Change (or add) the config file at `/etc/keyd/default.conf`:

```conf
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

# Remaps the escape key to capslock
# esc = capslock
```

Monitor keys with `sudo keyd monitor` to get the names.

Reload the config with `sudo keyd reload`.

Stop den daemon with by pressing `backspace+escape+enter`.

On **MacOS** this can be done with Karabiner.

