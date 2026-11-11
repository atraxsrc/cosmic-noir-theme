#!/usr/bin/env bash
# Install the Cosmic-Noir icon pack and make it the COSMIC icon theme.
#
#   ./icons/install.sh                    # Orange folders: download, install, activate
#   ./icons/install.sh --variant Sage     # another folder color (see --list)
#   ./icons/install.sh --user             # to ~/.local/share/icons, just you (default)
#   ./icons/install.sh --system           # to /usr/share/icons, all users + login (sudo)
#   ./icons/install.sh --no-activate      # install only, keep the current icon theme
#   ./icons/install.sh --list             # show the folder colors
#
# Downloads Cosmic-Noir-<Variant>.tar.xz from the latest release of
# https://github.com/atraxsrc/cosmic-icon-themes, checks it against the
# release's SHA256SUMS, and installs it. Activating sets your own COSMIC icon
# theme in both modes and backs up the previous setting (.bak-<timestamp>).
# Safe to run again.
set -euo pipefail

THEME="Noir"
VARIANTS=(Orange Sage Dark)
VARIANT="Orange"
BASE="${COSMIC_ICONS_URL:-https://github.com/atraxsrc/cosmic-icon-themes/releases/latest/download}"
USER_DEST="$HOME/.local/share/icons"
SYSTEM_DEST="${COSMIC_ICONS_SYSTEM_DIR:-/usr/share/icons}"
DEST="$USER_DEST"
SYSTEM=false
SETTING="$HOME/.config/cosmic/com.system76.CosmicTk/v1/icon_theme"
STAMP="$(date +%Y%m%d-%H%M%S)"
ACTIVATE=true

usage() {
  sed -n '4,9s/^# \{0,1\}//p' "${BASH_SOURCE[0]}"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --variant)     VARIANT="${2:-}"; shift ;;
    --variant=*)   VARIANT="${1#--variant=}" ;;
    --user)        SYSTEM=false; DEST="$USER_DEST" ;;
    --system)      SYSTEM=true; DEST="$SYSTEM_DEST" ;;
    --no-activate) ACTIVATE=false ;;
    --list)        printf '%s\n' "${VARIANTS[@]}"; exit 0 ;;
    -h|--help)     usage; exit 0 ;;
    *)             echo "Unknown argument: $1"; usage; exit 1 ;;
  esac
  shift
done

if [[ " ${VARIANTS[*]} " != *" $VARIANT "* ]]; then
  echo "Unknown variant '$VARIANT'. Pick one of: ${VARIANTS[*]}"
  exit 1
fi
for cmd in curl tar xz sha256sum; do
  command -v "$cmd" >/dev/null || { echo "Needs $cmd"; exit 1; }
done

# write to DEST as root only when it is a system dir we can't write to
as_dest() {
  if $SYSTEM && [[ $EUID -ne 0 && ! -w "$DEST" ]]; then sudo "$@"; else "$@"; fi
}

PACK="Cosmic-$THEME-$VARIANT"
dl="$(mktemp -d)"
stage=""
cleanup() {
  rm -rf -- "$dl"
  if [[ -n "$stage" ]]; then as_dest rm -rf -- "$stage"; fi
}
trap cleanup EXIT

# 1. download and verify ---------------------------------------------------
echo "Downloading $PACK"
curl -fsSL -o "$dl/$PACK.tar.xz" "$BASE/$PACK.tar.xz"
curl -fsSL -o "$dl/SHA256SUMS" "$BASE/SHA256SUMS"
if ! (cd "$dl" && grep " $PACK.tar.xz\$" SHA256SUMS | sha256sum -c --quiet -); then
  echo "Checksum mismatch for $PACK.tar.xz, nothing installed"
  exit 1
fi

# 2. install ---------------------------------------------------------------
if $SYSTEM; then echo "Installing to $DEST (may ask for sudo)"; else echo "Installing to $DEST"; fi
as_dest mkdir -p "$DEST"
# stage inside DEST so the final move is a rename on the same filesystem
stage="$(as_dest mktemp -d "$DEST/.$PACK.new-XXXXXX")"
as_dest tar -C "$stage" --no-same-owner -xJf "$dl/$PACK.tar.xz"
as_dest chmod -R a+rX "$stage"
[[ -f "$stage/$PACK/index.theme" ]] || { echo "Archive has no $PACK/index.theme"; exit 1; }
if [[ -d "$DEST/$PACK" ]] && diff -r --no-dereference -q -x icon-theme.cache "$stage/$PACK" "$DEST/$PACK" >/dev/null 2>&1; then
  echo "  $PACK already up to date"
else
  as_dest rm -rf -- "${DEST:?}/$PACK"
  as_dest mv -- "$stage/$PACK" "$DEST/$PACK"
  echo "  installed $DEST/$PACK"
fi
if command -v gtk-update-icon-cache >/dev/null; then
  as_dest gtk-update-icon-cache -q -f "$DEST/$PACK" 2>/dev/null || true
fi
if $SYSTEM && [[ -d "$USER_DEST/$PACK" ]]; then
  echo "  note: $USER_DEST/$PACK also exists and wins over the system copy;"
  echo "        remove it to use the system one: rm -rf $USER_DEST/$PACK"
fi

# 3. activate (your own COSMIC setting, in both modes) ---------------------
if $ACTIVATE; then
  want="\"$PACK\""
  if [[ -f "$SETTING" && "$(cat "$SETTING")" == "$want" ]]; then
    echo "COSMIC icon theme already $PACK"
  else
    mkdir -p "$(dirname "$SETTING")"
    if [[ -f "$SETTING" ]]; then
      cp -p "$SETTING" "$SETTING.bak-$STAMP"
      echo "  backup: $SETTING.bak-$STAMP"
    fi
    printf '%s' "$want" > "$SETTING"
    echo "COSMIC icon theme set to $PACK"
  fi
  # COSMIC after 1.11.0 reads the icon theme from the theme itself, dark and light
  for dir in "$HOME"/.config/cosmic/com.system76.CosmicTheme.{Dark,Light}{,.Builder}; do
    latest="$(printf '%s\n' "$dir"/v[0-9]* | sort -V | tail -n 1)"
    if [[ -f "$latest/icon_theme" && "$(cat "$latest/icon_theme")" != "$want" ]]; then
      printf '%s' "$want" > "$latest/icon_theme"
      echo "  ${latest#"$HOME"/.config/cosmic/}/icon_theme set to $PACK"
    fi
  done
  # GTK apps outside COSMIC
  if command -v gsettings >/dev/null; then
    gsettings set org.gnome.desktop.interface icon-theme "$PACK" 2>/dev/null || true
  fi
  echo "Restart open apps (Files caches icons per window) to see the new folders."
fi
