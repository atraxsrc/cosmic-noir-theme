#!/usr/bin/env bash
# Make Noir the active rice, coming from any other cosmic-*-theme rice:
# COSMIC settings, terminal tools, Neovim, zsh, the updater link, Firefox and
# Claude Desktop. Prints the GUI steps left at the end. Same script in every
# repo; only the block below differs.
set -euo pipefail

NAME="Noir"                         # shown in messages
SLUG="noir"                         # zsh/<slug>.zsh, nvim/lua/plugins/<slug>.lua
MODE="dark"                         # the COSMIC half this rice fills: dark or light
RON="Noir.ron"                      # desktop theme in cosmic/
TERM_RON="Noir-term.ron"            # terminal scheme in cosmic-term/
BTOP="Noir"                         # btop/<name>.theme

usage() {
    cat <<EOF
Usage: ./scripts/switch.sh [--keep-icons]

Makes $NAME the active rice, coming from any other cosmic-*-theme rice.
Backs up every file it replaces (*.bak). See "Switching rice" in the README.

  --keep-icons   leave the current icon theme alone
EOF
}

keep_icons=0
for arg in "$@"; do
    case "$arg" in
        --keep-icons) keep_icons=1 ;;
        -h|--help) usage; exit 0 ;;
        *) usage >&2; exit 2 ;;
    esac
done

R="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
C="${XDG_CONFIG_HOME:-$HOME/.config}"
# every rice's LazyVim spec, plus the old hand-installed Harbor Dark one
RICES="darkgold whitegold tokyonight tokyoday ember emberday monochrome noir dossier harbordark"
if [ "$MODE" = dark ]; then other=light; Mode=Dark; else other=dark; Mode=Light; fi
icons_missing=""
cd "$R"

# strips the quotes COSMIC stores strings with
value() { tr -d '"\n' 2>/dev/null < "$1" || true; }

# COSMIC: fonts, terminal look, icons. The terminal scheme and icon theme are
# only replaced when the current one is not already a variant of this rice's.
cd cosmic/config
find . -type f | sort | while read -r f; do
    f="${f#./}"
    dest="$C/cosmic/$f"
    case "$f" in
        */syntax_theme_$other)
            continue ;;
        */syntax_theme_$MODE)
            want="$(value "$f")"; have="$(value "$dest")"
            if [ "$have" = "$want" ] || [ "${have#"$want "}" != "$have" ]; then
                echo "  cosmic: terminal scheme stays $have"; continue
            fi ;;
        */icon_theme)
            want="$(value "$f")"; have="$(value "$dest")"
            if [ "$keep_icons" = 1 ]; then
                echo "  cosmic: icons stay ${have:-default} (--keep-icons)"; continue
            elif [ "${have#"${want%-*}-"}" != "$have" ]; then
                echo "  cosmic: icons stay $have"; continue
            elif [ ! -d "$HOME/.local/share/icons/$want" ] && [ ! -d "/usr/share/icons/$want" ]; then
                echo "  cosmic: icons stay ${have:-default}, $want is not installed (./icons/install.sh)"; continue
            fi ;;
    esac
    mkdir -p "$(dirname "$dest")"
    [ -f "$dest" ] && cp "$dest" "$dest.bak"
    cp "$f" "$dest"
    echo "  cosmic: $f"
done
cd "$R"

mkdir -p "$C/cosmic/com.system76.CosmicTheme.Mode/v1"
if [ "$MODE" = dark ]; then is_dark=true; else is_dark=false; fi
echo "$is_dark" > "$C/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark"
echo "  cosmic: $MODE mode"

# Terminal tools, editors, GTK / Qt, Discord; each only where the repo has it
for tool in fonts fastfetch lsd bat starship kitty alacritty wezterm ghostty delta lazygit helix gtk qt discord; do
    if [ -x "$tool/install.sh" ]; then "./$tool/install.sh" | sed "/^$/d; s/^/  $tool: /"; fi
done
mkdir -p "$C/btop/themes" && cp "btop/$BTOP.theme" "$C/btop/themes/"
if [ -f "$C/btop/btop.conf" ]; then
    cp "$C/btop/btop.conf" "$C/btop/btop.conf.bak"
    sed -i "s|^color_theme = .*|color_theme = \"$BTOP\"|" "$C/btop/btop.conf"
    echo "  btop: $BTOP"
else
    echo "  btop: theme copied, pick it in btop (Esc → Options → Color theme)"
fi

# Neovim: this rice's spec in, every other rice's spec parked in rice-off/
./nvim/install.sh | sed '/^$/d; s/^/  nvim: /'
for r in $RICES; do
    [ "$r" = "$SLUG" ] && continue
    if [ -f "$C/nvim/lua/plugins/$r.lua" ]; then
        mkdir -p "$C/nvim/rice-off"
        mv "$C/nvim/lua/plugins/$r.lua" "$C/nvim/rice-off/"
        echo "  nvim: $r.lua -> rice-off/"
    fi
done

# zsh: comment out every other rice's source line (and cosmic-ricing's),
# uncomment this one, or add it when ~/.zshrc has none
touch ~/.zshrc
cp ~/.zshrc ~/.zshrc.bak
src='^[[:space:]]*#?[[:space:]]*(source|\.)[[:space:]]'
sed -i -E \
    -e "/$src.*(cosmic-[a-z]+-theme\/zsh\/[a-z]+\.zsh|ricing\/zsh\/colors\.zsh)/{/cosmic-$SLUG-theme\/zsh\/$SLUG\.zsh/!s/^([[:space:]]*)([^#[:space:]])/\1# \2/}" \
    -e "/$src.*cosmic-$SLUG-theme\/zsh\/$SLUG\.zsh/s/^([[:space:]]*)#[[:space:]]*/\1/" \
    ~/.zshrc
grep -Eq "^[[:space:]]*(source|\.)[[:space:]].*cosmic-$SLUG-theme/zsh/$SLUG\.zsh" ~/.zshrc \
    || { ./zsh/install.sh | sed '/^$/d; s/^/  zsh: /' || echo "  zsh: install.sh failed, see above"; }
echo "  zsh: active rice lines:"
grep -En "^[[:space:]]*(source|\.)[[:space:]].*(cosmic-[a-z]+-theme/zsh/[a-z]+\.zsh|ricing/zsh/colors\.zsh)" ~/.zshrc | sed 's/^/    /' || echo "    none"

# Updater banner
ln -sfn "$R/scripts/update_system.sh" "$HOME/update_system.sh"
echo "  ~/update_system.sh -> $NAME"

# Firefox userChrome/userContent, Claude Desktop theme file
./firefox/install.sh | sed '/^$/d; s/^/  firefox: /' || echo "  firefox: skipped (see above)"
./claude-desktop/install.sh | sed '/^$/d; s/^/  claude-desktop: /'
claude_theme="$(basename "$(ls claude-desktop/*.jsonc | head -n1)" .jsonc)"

cat <<EOF

$NAME is active. Left to do by hand (skip what is already done):
  1. Settings → Desktop → Appearance → $Mode → Import cosmic/$RON
  2. COSMIC Terminal → View → Color schemes → $Mode tab → Import cosmic-term/$TERM_RON
  3. Firefox: enable this rice's add-on in about:addons (link in the README), restart Firefox
  4. Settings → Wallpaper → a file from backgrounds/
  5. Claude Desktop: Ctrl+Shift+T → $claude_theme, Appearance → $Mode
  6. exec zsh, restart Neovim
  Cursor (optional, sudo + reboot): ./cursors/install.sh
EOF
for tg in telegram/*.tdesktop-theme; do
  if [[ -f "$tg" ]]; then
    echo "  Telegram (optional): Settings → Chat Settings → Chat wallpaper → Choose from file → $tg"
  fi
done
if [[ -f brave/theme/manifest.json ]]; then
  echo "  Brave (optional): brave://extensions → Developer mode → Load unpacked → $R/brave/theme"
fi
if [[ -x obsidian/install.sh ]]; then
  echo "  Obsidian (optional): ./obsidian/install.sh <vault>, then Settings → Appearance → CSS snippets"
fi
if [[ -x helix/install.sh ]] || [[ -x kitty/install.sh ]]; then
  echo "  Terminals and editors: the installers above only copy theme files; see the README for"
  echo "  the one include line each of kitty, Alacritty, WezTerm, Ghostty, Helix, delta and qt6ct needs"
fi
