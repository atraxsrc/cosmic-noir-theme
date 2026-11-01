#!/usr/bin/env bash
# Installs the Noir lazygit colours beside your own config.yml
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/lazygit
mkdir -p "$dest"
[ -f "$dest/noir.yml" ] && cp "$dest/noir.yml" "$dest/noir.yml.bak"
cp "$dir/noir.yml" "$dest/"
echo "Done. zsh/noir.zsh points LG_CONFIG_FILE at config.yml plus noir.yml; without it:"
echo "  export LG_CONFIG_FILE=\"\$HOME/.config/lazygit/config.yml,\$HOME/.config/lazygit/noir.yml\""
