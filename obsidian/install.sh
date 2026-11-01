#!/usr/bin/env bash
# Installs the cosmic-noir CSS snippet (Noir dark / Dossier light) into an
# Obsidian vault's .obsidian/snippets/. Pass the vault folder.
#   ./obsidian/install.sh ~/Notes
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
vault="${1:-}"
if [ -z "$vault" ] || [ ! -d "$vault/.obsidian" ]; then
    echo "Usage: $0 <vault>    (a folder with .obsidian/ inside)"
    exit 1
fi
dest="$vault/.obsidian/snippets"
mkdir -p "$dest"
[ -f "$dest/cosmic-noir.css" ] && cp "$dest/cosmic-noir.css" "$dest/cosmic-noir.css.bak"
cp "$dir/cosmic-noir.css" "$dest/"
echo "Done. Obsidian: Settings -> Appearance -> CSS snippets -> turn on cosmic-noir,"
echo "and Base color scheme -> Adapt to system to follow COSMIC's Dark / Light toggle."
