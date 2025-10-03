#!/bin/bash

# Dotfiles installation script
# This script creates symlinks for dotfiles stored in the nvim config directory

DOTFILES_DIR="$HOME/.config/nvim/dotfiles"

echo "Setting up dotfiles..."

# Create symlinks
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "✓ Symlinks created successfully!"
echo "  ~/.tmux.conf -> $DOTFILES_DIR/.tmux.conf"
echo "  ~/.zshrc -> $DOTFILES_DIR/.zshrc"
echo ""
echo "Reload your shell with: source ~/.zshrc"
