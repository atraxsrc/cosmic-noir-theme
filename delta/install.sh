#!/usr/bin/env bash
# Installs the Noir delta config into ~/.config/delta/. It does not edit
# ~/.gitconfig: add the [include] it prints.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/delta
mkdir -p "$dest"
[ -f "$dest/noir.gitconfig" ] && cp "$dest/noir.gitconfig" "$dest/noir.gitconfig.bak"
cp "$dir/noir.gitconfig" "$dest/"
if [ -f ~/.gitconfig ] && grep -qF "delta/noir.gitconfig" ~/.gitconfig; then
    echo "Done. ~/.gitconfig already includes it."
else
    echo "Done. Add to ~/.gitconfig:"
    echo "  [include]"
    echo "      path = ~/.config/delta/noir.gitconfig"
fi
echo "Needs the bat Noir theme for the code colours: ./bat/install.sh"
