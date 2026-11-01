#!/usr/bin/env bash
# Installs the Noir starship prompt config
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.config
[ -f ~/.config/starship.toml ] && cp ~/.config/starship.toml ~/.config/starship.toml.bak
cp "$dir/starship.toml" ~/.config/starship.toml
echo "Done. Open a new terminal."
