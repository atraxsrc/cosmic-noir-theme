#!/usr/bin/env bash
# Installs the Noir Alacritty colour scheme into ~/.config/alacritty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/alacritty/themes
mkdir -p "$dest"
[ -f "$dest/noir.toml" ] && cp "$dest/noir.toml" "$dest/noir.toml.bak"
cp "$dir/noir.toml" "$dest/"
echo "Done. Add to ~/.config/alacritty/alacritty.toml:"
echo '  [general]'
echo '  import = ["~/.config/alacritty/themes/noir.toml"]'
