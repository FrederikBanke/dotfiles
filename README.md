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



