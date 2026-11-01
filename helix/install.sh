#!/usr/bin/env bash
# Installs the Noir Helix theme into ~/.config/helix/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/helix/themes
mkdir -p "$dest"
[ -f "$dest/noir.toml" ] && cp "$dest/noir.toml" "$dest/noir.toml.bak"
cp "$dir/noir.toml" "$dest/"
echo 'Done. Add to ~/.config/helix/config.toml:  theme = "noir"'
