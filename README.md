# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

Ubuntu/Mint/Debian
```
sudo apt install git
```

Fedora/CentOS/RHEL
```
sudo dnf install git
```

Arch/Manjaro
```
sudo pacman -S git
```

### Stow

Ubuntu/Mint/Debian
```
sudo apt install stow
```

Fedora/CentOS/RHEL
```
sudo dnf install stow
```

Arch/Manjaro
```
sudo pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/dreamsofautonomy/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
