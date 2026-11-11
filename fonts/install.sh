#!/usr/bin/env bash
# Installs the two fonts the COSMIC theme names: Maple Normal UI (interface) and
# Maple Mono Normal (monospace), into ~/.local/share/fonts/maple-cosmic-rice.
# Every rice ships the same files, so switching rices never piles up copies.
# Files already in place are left alone; the font cache is only refreshed on a change.
set -euo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dest="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/maple-cosmic-rice"

mkdir -p "$dest"
changed=0
for f in "$src"/maple-normal-ui/*.ttf "$src"/maple-mono-normal/*.ttf "$src/OFL.txt"; do
    if ! cmp -s "$f" "$dest/$(basename "$f")"; then
        cp "$f" "$dest/"
        changed=1
    fi
done

if [ "$changed" = 1 ]; then
    command -v fc-cache >/dev/null && fc-cache -f "$dest" >/dev/null 2>&1 || true
    echo "  Maple Normal UI and Maple Mono Normal installed to $dest"
else
    echo "  Maple Normal UI and Maple Mono Normal already installed"
fi
