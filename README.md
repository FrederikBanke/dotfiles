# My dotfiles

This directory contains the dotfiles for my system.

## Requirements

You will need the following installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

First, clone this repository to your home (`$HOME`) directory using git

```
git clone git@github.com/frederikbanke/dotfiles.git
cd dotfiles
```

the use GNU stow to create symlinks

```
stow .
```



