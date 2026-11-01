#!/usr/bin/env bash
# Installs the cosmic-noir Discord theme (Noir dark / Dossier light) for
# Vencord and Vesktop, into every config folder it finds: the usual ones under
# ~/.config and the Flatpak ones under ~/.var/app. Backs up what it replaces.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
file=cosmic-noir.theme.css
# label | config folder that holds themes/ | folder whose presence means the app is installed
candidates=(
    "Vencord|$HOME/.config/Vencord|$HOME/.config/Vencord"
    "Vesktop|$HOME/.config/vesktop|$HOME/.config/vesktop"
    "Vencord in Flatpak Discord|$HOME/.var/app/com.discordapp.Discord/config/Vencord|$HOME/.var/app/com.discordapp.Discord"
    "Vencord in Flatpak Discord Canary|$HOME/.var/app/com.discordapp.DiscordCanary/config/Vencord|$HOME/.var/app/com.discordapp.DiscordCanary"
    "Flatpak Vesktop|$HOME/.var/app/dev.vencord.Vesktop/config/vesktop|$HOME/.var/app/dev.vencord.Vesktop"
)
installed=0
for c in "${candidates[@]}"; do
    IFS='|' read -r label conf marker <<<"$c"
    [ -d "$marker" ] || continue
    dest="$conf/themes"
    mkdir -p "$dest"
    [ -f "$dest/$file" ] && cp "$dest/$file" "$dest/$file.bak"
    cp "$dir/$file" "$dest/$file"
    echo "  $label: $dest/$file"
    installed=1
done
if [ "$installed" = 0 ]; then
    echo "No Vencord or Vesktop found: none of ~/.config/Vencord, ~/.config/vesktop or the"
    echo "Flatpak folders under ~/.var/app exist. Start the app once, or copy by hand:"
    echo "  $dir/$file -> <app config>/themes/"
    exit 0
fi
echo "Done. Discord: Settings -> Vencord -> Themes -> tick Cosmic Noir; if it is not listed,"
echo "click Load missing themes there first (or restart Discord)."
echo "Appearance -> Theme -> Sync with computer follows COSMIC's Dark / Light toggle."
