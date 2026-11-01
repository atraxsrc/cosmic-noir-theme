#!/usr/bin/env bash
# Installs the Noir Ghostty theme into ~/.config/ghostty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/ghostty/themes
mkdir -p "$dest"
[ -f "$dest/Noir" ] && cp "$dest/Noir" "$dest/Noir.bak"
cp "$dir/Noir" "$dest/"
echo "Done. Add to ~/.config/ghostty/config:  theme = Noir"
echo "(or  theme = dark:Noir,light:Dossier  to follow COSMIC's toggle), then reload: Ctrl+Shift+,"
