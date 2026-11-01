#!/usr/bin/env bash
# Installs the Noir GTK stylesheet for GTK 3 and GTK 4 apps: copies noir.css
# into ~/.config/gtk-3.0/ and ~/.config/gtk-4.0/ and imports it from gtk.css
# there, after COSMIC's own import so the palette here wins (backup in
# gtk.css.bak). Another rice's import is commented out, never deleted.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
line='@import url("noir.css");'
for v in gtk-3.0 gtk-4.0; do
    dest=~/.config/$v
    mkdir -p "$dest"
    [ -f "$dest/noir.css" ] && cp "$dest/noir.css" "$dest/noir.css.bak"
    cp "$dir/noir.css" "$dest/noir.css"
    if [ ! -f "$dest/gtk.css" ]; then
        echo "$line" > "$dest/gtk.css"
        echo "  $v: created gtk.css"
        continue
    fi
    cp "$dest/gtk.css" "$dest/gtk.css.bak"
    # other rices' <slug>.css imports off, ours back on if a rice commented it out
    awk -v line="$line" '
        $0 == "/* " line " */" { print line; next }
        /^@import url\("[a-z]+\.css"\);/ && $0 !~ /"(cosmic|noir)\.css"/ { print "/* " $0 " */"; next }
        { print }
    ' "$dest/gtk.css.bak" > "$dest/gtk.css"
    if ! grep -qxF "$line" "$dest/gtk.css"; then
        # after the last @import (COSMIC puts its own first), or at the top
        n="$(grep -n '^@import' "$dest/gtk.css" | tail -n1 | cut -d: -f1)"
        if [ -n "$n" ]; then
            sed -i "${n}a\\$line" "$dest/gtk.css"
        else
            printf '%s\n' "$line" | cat - "$dest/gtk.css" > "$dest/gtk.css.tmp"
            mv "$dest/gtk.css.tmp" "$dest/gtk.css"
        fi
    fi
    echo "  $v: gtk.css imports noir.css (backup: gtk.css.bak)"
done
echo "Done. Restart GTK apps."
