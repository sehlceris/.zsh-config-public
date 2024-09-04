#!/bin/zsh

# Ensure ~/.zsh-config exists
CONFIG_DIR="$HOME/.zsh-config"
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Error: ~/.zsh-config directory does not exist. Please clone the repository into this directory first."
    exit 1
fi

# Check if ~/.zshrc exists, if not create it
ZSHRC="$HOME/.zshrc"
if [ ! -f "$ZSHRC" ]; then
    echo "~/.zshrc not found, creating a new one..."
    touch "$ZSHRC"
fi

# Add the source line to ~/.zshrc if it isn't already there
SOURCE_LINE="for config_file in ~/.zsh-config/*.zsh; do source \$config_file; done"
if ! grep -Fxq "$SOURCE_LINE" "$ZSHRC"; then
    echo "Adding source line to ~/.zshrc..."
    echo "" >> "$ZSHRC"
    echo "# Source all zsh config files in ~/.zsh-config" >> "$ZSHRC"
    echo "$SOURCE_LINE" >> "$ZSHRC"
else
    echo "Source line already present in ~/.zshrc."
fi

# Reload the zsh configuration
echo "Reloading zsh configuration..."
source "$ZSHRC"

echo "Installation complete. Your modular zsh setup is ready!"