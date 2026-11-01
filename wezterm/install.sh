#!/usr/bin/env bash
# Installs the Noir WezTerm colour module into ~/.config/wezterm/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/wezterm
mkdir -p "$dest"
[ -f "$dest/noir.lua" ] && cp "$dest/noir.lua" "$dest/noir.lua.bak"
cp "$dir/noir.lua" "$dest/"
echo 'Done. Add to ~/.config/wezterm/wezterm.lua:  config.colors = require("noir")'
