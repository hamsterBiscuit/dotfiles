# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository for macOS, inspired by [webpro/dotfiles](https://github.com/webpro/dotfiles). It uses GNU Stow for symlink management and Homebrew for package installation.

## Repository Structure

```
.
├── bin/              # Utility scripts (dotfiles, is-executable, is-macos, etc.)
├── config/           # XDG_CONFIG_HOME configs (stow'd to ~/.config)
│   ├── alacritty/    # Terminal emulator config
│   ├── kitty/        # Terminal emulator config
│   ├── zellij/       # Terminal multiplexer config
│   ├── lf/           # File manager config
│   ├── ranger/       # File manager config
│   ├── wezterm/      # Terminal emulator config
│   └── starship.toml # Shell prompt config
├── install/          # Package manifests
│   ├── Brewfile      # Homebrew packages
│   ├── Caskfile      # Homebrew cask apps
│   └── npmfile       # Global npm packages
├── runcom/           # Dotfiles stow'd to ~/
│   ├── .zshrc        # Zsh configuration with zinit plugins
│   ├── .zshenv       # Environment variables
│   ├── .tmux.conf    # Tmux configuration
│   └── .gitconfig    # Git configuration
├── Makefile          # Main installation orchestration
└── remote-install.sh # One-liner install script
```

## Common Commands

### Initial Setup

```bash
# Full installation (macOS only)
make

# Or step by step
make link        # Symlink configs using stow
make brew        # Install Homebrew
make packages    # Install brew packages, cask apps, and npm packages
```

### Configuration Management

```bash
# Link configs (idempotent, backs up existing files)
make link

# Unlink configs (restores backups)
make unlink

# Update all packages
bin/dotfiles update
```

### Package Management

```bash
# Install Homebrew packages from Brewfile
brew bundle --file=install/Brewfile

# Install cask applications from Caskfile
brew bundle --file=install/Caskfile

# Install global npm packages
npm install -g $(cat install/npmfile)
```

## Key Architecture Decisions

### Stow-based Symlinking

Configs are organized into two stow packages:
- `runcom/` → symlinked to `$HOME` (shell configs, dotfiles)
- `config/` → symlinked to `$XDG_CONFIG_HOME` (~/.config)

The `make link` target backs up existing files before stowing to prevent data loss.

### Zsh Plugin Management

Uses [zinit](https://github.com/zdharma-continuum/zinit) for fast, lazy-loaded plugins:
- Plugins are defined in `runcom/.zshrc`
- Uses Oh-My-Zsh library snippets and plugins
- Key plugins: fzf, git, zsh-autosuggestions, fast-syntax-highlighting

### Environment Setup

- `DOTFILES_DIR` is set to `$HOME/.dotfiles` in `.zshenv`
- Custom `bin/` directory is prepended to PATH
- Editor is set to `nvim`
- Uses `starship` for shell prompt
- Uses `zoxide` for smart directory jumping
- Uses `fnm` for Node version management

### Utility Scripts

- `bin/is-executable` — Check if a command exists
- `bin/is-macos` — Exit 0 if running on macOS
- `bin/is-supported` — Conditional output based on command success
- `bin/dotfiles` — Main CLI for dotfile operations (update, dock, help)
- `bin/update_nvim` — Update neovim config from git

## Important Notes

- This is **macOS only** — the Makefile has a Linux target but it's minimal/untested
- The repository expects to be cloned to `~/.dotfiles`
- Some applications listed in README.md require manual installation (Raycast, Things, etc.)
- Neovim config is managed separately (referenced in `update_nvim` as `~/.config/nvim`)
