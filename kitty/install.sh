#!/usr/bin/env bash
# Installs the Noir kitty colour scheme into ~/.config/kitty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/kitty/themes
mkdir -p "$dest"
[ -f "$dest/Noir.conf" ] && cp "$dest/Noir.conf" "$dest/Noir.conf.bak"
cp "$dir/Noir.conf" "$dest/"
echo "Done. Add to ~/.config/kitty/kitty.conf:  include themes/Noir.conf"
echo "then reload kitty (Ctrl+Shift+F5)."
