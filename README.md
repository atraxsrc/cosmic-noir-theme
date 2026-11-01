<div align="center">

# COSMIC · Noir

![Noir palette](assets/palette.png)

Pop!_OS 24.04 on COSMIC in charcoal, sage and orange: desktop, terminals,
shell, editors, Firefox, Brave, GTK and Qt apps, Obsidian, Discord, cursor,
wallpapers. The dark half of a pair; the light half is
[cosmic-dossier-theme](https://github.com/atraxsrc/cosmic-dossier-theme).

![Pop!_OS](https://img.shields.io/badge/Pop!_OS-24.04_LTS-f25623?style=for-the-badge&logo=popos&logoColor=white)
![COSMIC](https://img.shields.io/badge/COSMIC-1.0.0-88a57d?style=for-the-badge)
![Noir](https://img.shields.io/badge/Theme-Noir-171717?style=for-the-badge&labelColor=f25623)
![Firefox](https://img.shields.io/badge/Firefox-Noir-f25623?style=for-the-badge&logo=firefox-browser&logoColor=white)
[![Gallery](https://img.shields.io/badge/Gallery-All_rices-f25623?style=for-the-badge)](https://atraxsrc.github.io/cosmic-rices/)
![License](https://img.shields.io/badge/License-MIT-7d837d?style=for-the-badge)

</div>

---
![Pop!_OS COSMIC desktop with the Noir theme](assets/screenshot.png)

## Palette

From the Greek Noir palette: a near-black base, grey-sage neutrals, one loud orange. The accent is
kept as is. Every text colour is at least 4.5:1 on the window background.

| Role | Color | Hex |
|------|-------|-----|
| Background | ![#171717](https://placehold.co/12x12/171717/171717.png) Charcoal | ![#171717](https://placehold.co/12x12/171717/171717.png) `#171717` |
| Containers | ![#222222](https://placehold.co/12x12/222222/222222.png) Soot / Slate | ![#222222](https://placehold.co/12x12/222222/222222.png) `#222222` / ![#2A2A2A](https://placehold.co/12x12/2a2a2a/2a2a2a.png) `#2A2A2A` |
| Text | ![#ccd0cf](https://placehold.co/12x12/ccd0cf/ccd0cf.png) Fog | ![#CCD0CF](https://placehold.co/12x12/ccd0cf/ccd0cf.png) `#CCD0CF` |
| Accent | ![#f25623](https://placehold.co/12x12/f25623/f25623.png) Orange | ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` |
| Warning | ![#f56e0f](https://placehold.co/12x12/f56e0f/f56e0f.png) Ember | ![#F56E0F](https://placehold.co/12x12/f56e0f/f56e0f.png) `#F56E0F` |
| Success | ![#88a57d](https://placehold.co/12x12/88a57d/88a57d.png) Sage | ![#88A57D](https://placehold.co/12x12/88a57d/88a57d.png) `#88A57D` |
| Khaki | ![#aeab94](https://placehold.co/12x12/aeab94/aeab94.png) Symlinks, yellow slot | ![#AEAB94](https://placehold.co/12x12/aeab94/aeab94.png) `#AEAB94` |
| Grey-sage | ![#959c95](https://placehold.co/12x12/959c95/959c95.png) Directories | ![#959C95](https://placehold.co/12x12/959c95/959c95.png) `#959C95` |
| Muted | ![#7d837d](https://placehold.co/12x12/7d837d/7d837d.png) Secondary text | ![#7D837D](https://placehold.co/12x12/7d837d/7d837d.png) `#7D837D` |
| Dim | ![#686c69](https://placehold.co/12x12/686c69/686c69.png) Comments | ![#686C69](https://placehold.co/12x12/686c69/686c69.png) `#686C69` |
| Lines | ![#525252](https://placehold.co/12x12/525252/525252.png) Box lines, inactive | ![#525252](https://placehold.co/12x12/525252/525252.png) `#525252` |

Error shares the orange: the upstream palette has no red, and its "red" slot
is khaki. Errors are told apart by bold and underline.

| Role | Noir | Dossier |
|------|------|---------|
| Background | ![#171717](https://placehold.co/12x12/171717/171717.png) `#171717` | ![#D0D0C8](https://placehold.co/12x12/d0d0c8/d0d0c8.png) `#D0D0C8` |
| Text | ![#CCD0CF](https://placehold.co/12x12/ccd0cf/ccd0cf.png) `#CCD0CF` | ![#242424](https://placehold.co/12x12/242424/242424.png) `#242424` |
| Accent | ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` | ![#953B19](https://placehold.co/12x12/953b19/953b19.png) `#953B19` |
| Success | ![#88A57D](https://placehold.co/12x12/88a57d/88a57d.png) `#88A57D` | ![#51573B](https://placehold.co/12x12/51573b/51573b.png) `#51573B` |

---

## Repo Structure

```
.
├── alacritty
│   ├── noir.toml                # Alacritty colour scheme
│   └── install.sh
├── bat
│   ├── Noir.tmTheme             # bat syntax theme (delta uses it too)
│   ├── config                   # --theme="Noir"
│   └── install.sh
├── brave
│   ├── theme                    # Chromium theme (manifest + icons), Load unpacked
│   └── README.md
├── btop
│   └── Noir.theme               # btop colour theme
├── claude-desktop
│   ├── cosmic-noir.jsonc        # Claude Desktop theme (claude-desktop-extra), dark + light
│   └── install.sh
├── cosmic
│   ├── Noir.ron                 # COSMIC Appearance import (Dark)
│   ├── config/                  # baseline settings: fonts, icons, terminal look
│   └── install.sh
├── cosmic-term
│   ├── Noir-term.ron            # COSMIC Terminal colour scheme
│   ├── Noir-term-*.ron          # dimmer plain-text variants, same ANSI colours
│   └── README.md                # previews and which one to pick
├── cursors
│   ├── Oxygen-Noir-*/            # cursor themes, one per icon colour, patched for COSMIC apps
│   ├── recolour.py              # makes a variant from any other, see cursors/README.md
│   ├── install.sh
│   ├── uninstall.sh
│   └── README.md
├── delta
│   ├── noir.gitconfig           # delta (git pager) colours, [include] it from ~/.gitconfig
│   └── install.sh
├── discord
│   ├── cosmic-noir.theme.css    # Vencord / Vesktop theme, Noir (dark) + Dossier (light)
│   └── install.sh
├── ghostty
│   ├── Noir                     # Ghostty theme
│   └── install.sh
├── gtk
│   ├── noir.css                 # GTK 3 / 4 named colours for non-COSMIC apps
│   └── install.sh
├── helix
│   ├── noir.toml                # Helix theme
│   └── install.sh
├── icons
│   └── install.sh               # Cosmic-Noir icon pack from cosmic-icon-themes
├── fastfetch
│   ├── config.jsonc             # orange / grey-sage fastfetch config
│   ├── cosmic.txt               # COSMIC logo
│   └── install.sh
├── firefox
│   ├── theme                    # Cosmic Noir theme add-on (manifest + icons)
│   ├── chrome
│   │   ├── userChrome.css       # rounded chrome, soot menus
│   │   └── userContent.css      # new tab accent
│   ├── install.sh
│   └── README.md
├── kitty
│   ├── Noir.conf                # kitty colour scheme
│   └── install.sh
├── lazygit
│   ├── noir.yml                 # lazygit colours only, stacked on your config.yml
│   └── install.sh
├── lsd
│   ├── config.yaml              # theme: custom
│   ├── colors.yaml              # permission / size / date / git columns
│   └── install.sh
├── nvim                         # Neovim colorscheme, LazyVim spec, RON syntax, install.sh
├── obsidian
│   ├── cosmic-noir.css          # CSS snippet, Noir (dark) + Dossier (light)
│   └── install.sh
├── qt
│   ├── Noir.conf                # qt5ct / qt6ct colour scheme
│   └── install.sh
├── starship
│   ├── starship.toml            # prompt, palette colours
│   └── install.sh
├── telegram
│   ├── colors.tdesktop-theme    # Telegram Desktop colour scheme (source)
│   ├── cosmic-noir.tdesktop-theme  # built theme, open this in Telegram
│   └── build.sh                 # rebuilds it, optionally with a wallpaper
├── vscode
│   ├── themes/                  # Cursor / VS Code colour themes, Noir (dark) + Dossier (light)
│   ├── package.json             # extension manifest
│   ├── install.sh               # packs a .vsix, installs it with cursor --install-extension
│   └── README.md
├── scripts
│   ├── update_system.sh         # nala + flatpak, orange / sage ANSI
│   └── switch.sh                # make this the active rice (see Switching rice)
├── wezterm
│   ├── noir.lua                 # WezTerm colours, config.colors = require("noir")
│   └── install.sh
├── zsh
│   ├── noir.zsh                 # LS_COLORS, highlighting colours, aliases, starship, lazygit
│   └── install.sh
├── assets
│   ├── cursors/                 # cursor preview
│   ├── cosmic-term/             # scheme previews for cosmic-term/README.md
│   ├── palette.png              # the 16 terminal colours, under the title
│   ├── screenshot.png           # README screenshot
│   └── wallpaper.png            # the anime portrait on the bare desktop
├── backgrounds/                 # wallpapers, noir-<subject>.png (see Icons and wallpaper)
├── docs
│   └── showcase.md              # the rice describing itself, for the Postilla pane of the screenshot
├── LICENSE
└── README.md
```

---

## COSMIC Desktop

Settings → Desktop → Appearance → **Dark** → **Import** → `cosmic/Noir.ron`

Accent is orange ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623`. Use the `+` control if you want a custom swatch.

Frosted glass is on in the `.ron` at `frosted: Low` with an opacity table of
0.66 to 0.96, tinted with the palette's middle neutral, for windows, panel,
applets and system UI (maximized apps stay solid), and corners are squared
(`radius_*: 2.0`), the same as the DarkGold baseline. Adjust frosted glass on
Appearance → Style → Frosted glass after import; those sliders survive a theme switch.

Export from Appearance if you tweak backgrounds / tints so you do not lose them.

Pairing tip: import `Dossier.ron` from
[cosmic-dossier-theme](https://github.com/atraxsrc/cosmic-dossier-theme) into
the Light slot and COSMIC's Dark / Light toggle flips between the two.
Wallpaper, Firefox and the shell layer do not follow the toggle; those are
per-rice files.

### Baseline settings

`cosmic/config/` holds the settings that make up the look and rarely change
(panel, dock, applets and shortcuts are left out on purpose):

| Where | Setting |
|-------|---------|
| Fonts | Interface `Maple Mono Normal` Light, monospace `Maple Mono Normal NFM` |
| Icons | Cosmic-Noir-Orange |
| Windows | Minimize / maximize buttons hidden, theme applied to GNOME apps |
| Terminal | Maple Mono 15 (weights 500 / bold 800 / dim 300), 77% opacity, no header bar, Noir |

Install the [Maple fonts](https://github.com/subframe7536/maple-font/releases)
(Maple Mono Normal and Maple Mono Normal NFM) and the Cosmic-Noir icons (see
Icons below) and import the terminal scheme first, then:

```bash
./cosmic/install.sh
```

It backs up each file it replaces to `*.bak` and COSMIC applies it live.

The interface font is the Light weight on purpose. COSMIC sets interface text
brightness itself (the text tint only picks the hue), so on these dark panels
labels land near ![#DFE7DF](https://placehold.co/12x12/dfe7df/dfe7df.png) `#DFE7DF` whatever tint you choose; the thinner strokes are
what calms them at night. Settings → Fonts lists only families, so the weight
lives in `cosmic/config/com.system76.CosmicTk/v1/interface_font`.

---

## COSMIC Terminal

The desktop `.ron` does not colour ANSI text.

1. COSMIC Terminal → **View → Color schemes…** (not Settings → Appearance)
2. Dark tab → **Import** → `cosmic-term/Noir-term.ron`
3. View → Settings → Appearance → Color scheme (dark) → **Noir**

If a profile is set as default, set the scheme on that profile too or the
dropdown will look like it did nothing.

Fog text on charcoal; orange for errors and the cursor, sage for strings and
success, khaki in the yellow slot, grey-sage for directories.

If fog glares at night, there are five dimmer variants with the same ANSI
colours, from Smoke ![#7D837D](https://placehold.co/12x12/7d837d/7d837d.png) `#7D837D` up to Pale ![#BCBFBC](https://placehold.co/12x12/bcbfbc/bcbfbc.png) `#BCBFBC`. Previews and which to
pick: [`cosmic-term/README.md`](cosmic-term/README.md).

---

## Firefox

Two layers:

1. **Theme (colours):** install
   **[cosmic-noir-theme on addons.mozilla.org](https://addons.mozilla.org/en-US/firefox/addon/cosmic-noir-theme/)**.
   This is the main look.
2. **Stylesheets (optional):** `firefox/chrome/` adds rounded corners, orange
   menu hover, orange accents and blank new-tab tiles on top of the add-on
   (they also work with Firefox's built-in Dark theme):

```bash
./firefox/install.sh
```

Fully quit Firefox afterward. Details and CSS rules: [`firefox/README.md`](firefox/README.md).

---

## Brave

`brave/theme` is a Chromium theme with the Firefox theme's colours: charcoal
frame, soot toolbar, sage icons and inactive tabs, orange on the active tab.
Brave, Chrome, Chromium and Edge take it, and it loads straight from the
clone, so no Chrome Web Store or Google account is needed:

`brave://extensions` → **Developer mode** → **Load unpacked** → `brave/theme`

Leave the clone in place, Brave keeps reading the folder. Colours, limits and
packing a `.crx`: [`brave/README.md`](brave/README.md).

---

## Claude Desktop

For the unofficial [claude-desktop-extra](https://github.com/patrickjaja/claude-desktop-extra)
Linux build. `claude-desktop/cosmic-noir.jsonc` is one theme with both halves:
Noir in dark mode and Dossier in light mode, so Claude's own
Settings → Appearance toggle switches between the two rices.
Colours come from `cosmic/*.ron`, contrast-checked (text and button text
4.5:1, accents 3:1).

```bash
./claude-desktop/install.sh
```

It copies the file into `~/.config/Claude/themes.d/`. Then press
<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>T</kbd> in Claude Desktop and pick **cosmic-noir**.

The same file ships in [`cosmic-dossier-theme`](https://github.com/atraxsrc/cosmic-dossier-theme),
so installing from either repo gives the same theme.

---

## Cursor editor

`vscode/` is a colour theme extension for [Cursor](https://cursor.com) with
both halves of the pair: **Cosmic Noir** and **Cosmic Dossier**. It is a plain
VS Code theme extension, so VS Code and VSCodium take it too, and the same
folder ships in cosmic-dossier-theme. Code is coloured the way Neovim is in
each rice; the workbench is charcoal with soot menus, hovers and inputs,
orange on the active tab, buttons and menu highlight, and the integrated
terminal uses the COSMIC Terminal scheme. Cursor builds its Agent and chat
panels from the same theme colours, so they follow along.

```bash
./vscode/install.sh
```

It packs `vscode/` into a `.vsix` and installs it with
`cursor --install-extension`; run it again after editing the theme. Then press
<kbd>Ctrl</kbd>+<kbd>K</kbd> <kbd>Ctrl</kbd>+<kbd>T</kbd> in Cursor and pick
**Cosmic Noir**. Three lines in Cursor's `settings.json` make it follow
COSMIC's Dark / Light toggle between Noir and Dossier; they, the colours and
the contrast notes are in [`vscode/README.md`](vscode/README.md).

---

## Telegram

`telegram/cosmic-noir.tdesktop-theme` is a Telegram Desktop theme: charcoal
chat list and background, soot incoming and dark-sage outgoing bubbles, orange
for the accent, links, unread badges and buttons (with charcoal text on them),
sage for online status and read ticks. Group member names cycle through eight
of the rice's colours: orange, sage, khaki, grey-sage, pale khaki, amber, light
sage and ember. Text and badge colours are contrast-checked at 4.5:1 or better,
except disabled menu items.

Settings → Chat Settings → Chat wallpaper → **Choose from file** →
`telegram/cosmic-noir.tdesktop-theme` → **Apply this theme**.

The colours live in `telegram/colors.tdesktop-theme`, which is plain text;
`build.sh` zips it with the chat background into the `.tdesktop-theme`. The
background is plain charcoal; to put a wallpaper behind the chat instead
(ImageMagick re-encodes it to a 2560px JPEG, Telegram caps theme files at 5 MB):

```bash
./telegram/build.sh --wallpaper backgrounds/noir-anime.png
```

Built against Telegram Desktop 7.3.1. Calls, group calls, statistics charts and
premium badges keep Telegram's own colours.

Telegram has no dark / light pairing, so Dossier, the light half, ships its own
theme.

---

## GTK and Qt apps

COSMIC colours GTK apps itself when Appearance → **Apply theme to GNOME apps**
is on (the baseline config turns it on). `gtk/noir.css` is the same palette
pinned by hand for GTK 3 and GTK 4 / libadwaita apps: charcoal windows and
lists, soot cards, popovers and dialogs, fog text, orange selection and
accent with charcoal text on it, sage success and ember warning. It only sets
the named colours, so widgets keep their stock shapes, and it also works
where COSMIC's toggle does not reach (another desktop, Flatpak apps given
access to `~/.config/gtk-4.0`).

```bash
./gtk/install.sh
```

It copies the file to `~/.config/gtk-3.0/` and `~/.config/gtk-4.0/` and adds
`@import url("noir.css");` to `gtk.css` there, after COSMIC's own import so
these colours win (backup in `gtk.css.bak`); another rice's import is
commented out. Restart GTK apps.

`qt/Noir.conf` is a colour scheme for [qt5ct](https://github.com/desktop-app/qt5ct)
/ [qt6ct](https://github.com/trialuser02/qt6ct): charcoal windows, near-black
text fields and lists, soot buttons and tooltips, fog text, orange highlight
and links, muted placeholders, dim disabled text.

```bash
./qt/install.sh
# qt6ct → Appearance → Color scheme → Noir, Palette: Custom → Apply
```

Qt apps read it with `QT_QPA_PLATFORMTHEME=qt6ct` (or `qt5ct`) in the
environment; `~/.config/environment.d/` or your `~/.zshrc` is the place.

Both files use text colours at 4.5:1 or better on every surface they sit on;
disabled and placeholder text, like comments elsewhere in the rice, at 3:1.

---

## Obsidian

`obsidian/cosmic-noir.css` is a CSS snippet with both halves of the pair: Noir
in dark mode, Dossier in light mode, so with Settings → Appearance → Base
color scheme → **Adapt to system** Obsidian follows COSMIC's Dark / Light
toggle. Charcoal editor, soot sidebars, fog text, orange links and accent,
headings in orange / khaki / grey-sage like Neovim's, sage code and
checkboxes, khaki tags. The same file ships in cosmic-dossier-theme.

```bash
./obsidian/install.sh ~/path/to/vault
# Settings → Appearance → CSS snippets → cosmic-noir
```

It copies the file into the vault's `.obsidian/snippets/`. Snippets are per
vault, so run it once per vault.

---

## Discord

`discord/cosmic-noir.theme.css` is a theme for [Vencord](https://vencord.dev/)
and [Vesktop](https://github.com/Vencord/Vesktop), colours only: charcoal chat,
soot sidebars and inputs, near-black server list, fog text, grey-sage channel
names, orange accent, mentions and links, sage online and positive, ember
warning. The light half is Dossier, so with Appearance → Theme → **Sync with
computer** it follows COSMIC's toggle. The same file ships in
cosmic-dossier-theme.

```bash
./discord/install.sh
# Settings → Vencord → Themes → Load missing themes → Cosmic Noir
```

It copies the file into every Vencord and Vesktop config folder it finds:
`~/.config/Vencord/themes/`, `~/.config/vesktop/themes/`, and for the Flatpak
builds `~/.var/app/com.discordapp.Discord/config/Vencord/themes/` and
`~/.var/app/dev.vencord.Vesktop/config/vesktop/themes/`. Discord renames its CSS
variables now and then; the file sets both the long-standing names and the
2025 visual-refresh names. Text on the surfaces is 4.5:1 or better; the text on
Discord's own orange buttons stays its white, at 3.4:1.

---

## Cursor

**Oxygen** cursors recoloured to the icon colours, one per folder colour of the
Cosmic-Noir icon pack: **Orange** (default), **Sage**, **Dark**. Patched with the cursor
names COSMIC apps ask for. COSMIC has no cursor picker yet, so the script sets it:

```bash
./cursors/install.sh                      # Orange
./cursors/install.sh --variant Sage      # or another, see --list
reboot
```

Previews, what the script touches, how to undo it and how the colours are made:
[`cursors/README.md`](cursors/README.md).

---

## Scripts

### `update_system.sh`

nala + flatpak updater. Headers in orange, info in grey-sage, success in sage,
errors in orange; the banner ramps from sage to fog, orange only in the rule below it.

```bash
chmod +x scripts/update_system.sh
./scripts/update_system.sh
```

### `switch.sh`

Makes this the active rice, coming from any other `cosmic-*-theme` rice. See
[Switching rice](#switching-rice).

```bash
./scripts/switch.sh
```

---

## Terminal extras

Need a [Nerd Font](https://www.nerdfonts.com/) in the terminal for the icons
(Maple Mono NFM in the baseline above).

### kitty, Alacritty, WezTerm, Ghostty

The COSMIC Terminal scheme for other terminals, one file each with the same
sixteen ANSI colours, fog text, orange cursor and the selection on a slate
grey ![#3A3B3A](https://placehold.co/12x12/3a3b3a/3a3b3a.png) `#3A3B3A`. Each installer copies the file next to that
terminal's config and backs up what it replaces; the one include line you add
is printed, and is in the comment at the top of each file:

```bash
./kitty/install.sh        # ~/.config/kitty/themes/Noir.conf       kitty.conf:     include themes/Noir.conf
./alacritty/install.sh    # ~/.config/alacritty/themes/noir.toml   alacritty.toml: [general] import = ["~/.config/alacritty/themes/noir.toml"]
./wezterm/install.sh      # ~/.config/wezterm/noir.lua             wezterm.lua:    config.colors = require("noir")
./ghostty/install.sh      # ~/.config/ghostty/themes/Noir          config:         theme = Noir
```

Ghostty and WezTerm can follow COSMIC's Dark / Light toggle once the Dossier
half is installed from its repo as well: `theme = dark:Noir,light:Dossier` in
Ghostty, and in WezTerm

```lua
local dark = (wezterm.gui and wezterm.gui.get_appearance() or "Dark"):find("Dark")
config.colors = require(dark and "noir" or "dossier")
```

kitty and Alacritty have no such switch; include the other file instead.

### starship

`starship/starship.toml` is close to the defaults with the palette declared
once as `[palettes.noir]` and used by name: grey-sage directory, khaki branch,
ember for a dirty tree, sage prompt character that turns orange after a
failed command. Modules it does not style
keep their defaults, which use the ANSI slots the COSMIC Terminal scheme
colours. `zsh/noir.zsh` already runs `starship init`. `install.sh` backs up
any existing `~/.config/starship.toml` to `starship.toml.bak`.

```bash
./starship/install.sh
```

### bat

`bat/Noir.tmTheme` is a syntax theme coloured the way Neovim is: orange
keywords, sage strings, khaki functions, ember numbers, grey-sage types,
amber imports and escapes, italic dim comments, on the charcoal background.
`zsh/noir.zsh` aliases `cat` to bat. `install.sh` copies the theme to
`~/.config/bat/themes/`, rebuilds bat's cache so bat and delta can find it, and
sets `--theme="Noir"` in `~/.config/bat/config` (backup in `config.bak`).

```bash
./bat/install.sh
batcat README.md
```

### delta

`delta/noir.gitconfig` colours [delta](https://github.com/dandavison/delta),
the git diff pager: removed lines in orange and added lines in sage on the
soot container, changed words on a solid orange or sage block with charcoal
text, the same as Neovim's diff highlights; orange file names, khaki commit
hashes, grey-sage hunk headers in dim boxes, line numbers. Code inside the
diff uses the bat theme above, so install that first. `install.sh` copies the
file to `~/.config/delta/` and prints the `[include]` to add to `~/.gitconfig`;
it never edits that file.

```bash
./delta/install.sh
```

```ini
# ~/.gitconfig
[include]
    path = ~/.config/delta/noir.gitconfig
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
```

### lazygit

`lazygit/noir.yml` holds only the `gui.theme` block: orange active border,
dim grey inactive borders, slate selected line, khaki and sage marks for
cherry-picked and base commits, orange unstaged changes, khaki author names.
lazygit reads one config file, so instead of replacing your
`~/.config/lazygit/config.yml` the installer drops the theme beside it and
`zsh/noir.zsh` sets `LG_CONFIG_FILE` to both, your file first, so the colours
win and your keybindings stay.

```bash
./lazygit/install.sh
exec zsh
```

Without the zsh layer, export it yourself:
`LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.config/lazygit/noir.yml"`.

### Helix

`helix/noir.toml` is the Neovim colorscheme for [Helix](https://helix-editor.com/):
same syntax roles, charcoal editor, soot status line and popups, orange
cursor and current line number, mode shown as a solid orange / sage / khaki
block with charcoal text. `install.sh` copies it to `~/.config/helix/themes/`.

```bash
./helix/install.sh
# ~/.config/helix/config.toml:  theme = "noir"
```

### zsh

`zsh/noir.zsh` is the rice part of the shell only: `LS_COLORS` (also used by
lsd for file names and by the completion menu), orange / sage / khaki colours
for zsh-autosuggestions and zsh-syntax-highlighting, lsd / bat / nvim aliases,
the lazygit theme file and the starship prompt. Your own `~/.zshrc` stays private and sources it.

Needs zsh + [oh-my-zsh](https://ohmyz.sh/). `install.sh` clones the two
plugins if missing and appends one `source` line to `~/.zshrc` (backup in
`~/.zshrc.bak`):

```bash
./zsh/install.sh
exec zsh
```

In `~/.zshrc` keep `ZSH_THEME=""` and
`plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)`.

### lsd

File names are coloured by `LS_COLORS` from `zsh/noir.zsh`;
`lsd/colors.yaml` colours the other columns with the 256-colour codes nearest
the palette (202 orange, 208 ember, 108 sage, 144 khaki, 246 grey-sage,
243 muted, 240 dim). lsd 1.0.0 does not accept `#hex` there.

```bash
./lsd/install.sh
lsd -l
```

### fastfetch

COSMIC logo in orange, Hardware / Software / Age boxes in dim grey with
grey-sage keys. `install.sh` backs up any existing
`~/.config/fastfetch/config.jsonc` to `config.jsonc.bak`.

```bash
./fastfetch/install.sh
fastfetch
```

### Neovim

`nvim/` carries the rice into Neovim: a dependency-free colorscheme built from
the palette (`nvim/colors/noir.lua`), a LazyVim spec that selects it and makes
sure the treesitter parsers for the files in this repo are installed
(`nvim/lua/plugins/noir.lua`), and a small RON syntax file so `cosmic/*.ron`
is coloured even before the parser exists. `:terminal` inside Neovim uses the
Noir scheme.

```bash
./nvim/install.sh
# restart nvim; LazyVim switches to the noir colorscheme
```

Without LazyVim, copy `nvim/colors/noir.lua` to `~/.config/nvim/colors/` and
run `:colorscheme noir`.

### btop

`btop/Noir.theme`: charcoal background, dim grey boxes, orange titles, meters
ramp from sage through khaki to orange.

```bash
mkdir -p ~/.config/btop/themes
cp btop/Noir.theme ~/.config/btop/themes/
# btop → Esc → Options → Color theme → Noir
```

---

## Icons and wallpaper

Icons: **Cosmic-Noir**, the [Kanagawa icons](https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme/tree/main/icons/Kanagawa)
by Fausto Korpsvart recolored to this palette in
[cosmic-icon-themes](https://github.com/atraxsrc/cosmic-icon-themes). Folders come in
three colors: **Orange** ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` (default), **Sage** ![#88A57D](https://placehold.co/12x12/88a57d/88a57d.png) `#88A57D` and **Dark** ![#2A2A2A](https://placehold.co/12x12/2a2a2a/2a2a2a.png) `#2A2A2A` with orange symbols.

![Cosmic-Noir folder colors](https://raw.githubusercontent.com/atraxsrc/cosmic-icon-themes/main/previews/Cosmic-Noir.png)

```bash
./icons/install.sh                 # Orange folders
./icons/install.sh --variant Sage  # or Dark
```

It downloads the pack from the latest cosmic-icon-themes release, checks its SHA256,
installs it to `~/.local/share/icons/` and sets it as the COSMIC icon theme.
Restart open apps afterwards (Files caches icons per window).
Add `--system` to install to `/usr/share/icons` instead, for every user and the
login screen (asks for sudo); `--user` is the default.

Wallpapers ship in [`backgrounds/`](backgrounds/), named `noir-<subject>.png`:
the thirteen subjects every dark rice has, rendered in sage and orange on charcoal:
the Harbor Dark reaper and Hyundai blueprint, the COSMIC astronaut, the samurai,
sushi switch, geisha, JS mug and neon street from the Tokyo Night set, The Greek
eagle and ink portrait, and three new scenes: city, panel and tower.
The anime portrait (`noir-anime.png`) is the one in the screenshot.
The subjects come from [cool-wallpapers](https://github.com/atraxsrc/cool-wallpapers) (MIT); each was rendered again in this palette, then upscaled.

Settings → Wallpaper → Add image → a file from `backgrounds/`, or one you downloaded.

![The anime portrait wallpaper on the Noir desktop, panel only](assets/wallpaper.png)

---

## Setup

```bash
git clone https://github.com/atraxsrc/cosmic-noir-theme.git
cd cosmic-noir-theme

# desktop
# Settings → Appearance → Dark → Import cosmic/Noir.ron

# terminal
# View → Color schemes → Import cosmic-term/Noir-term.ron

# firefox add-on
# https://addons.mozilla.org/en-US/firefox/addon/cosmic-noir-theme/

# optional extra chrome
./firefox/install.sh

# brave: brave://extensions → Developer mode → Load unpacked → brave/theme

# claude desktop (claude-desktop-extra), then Ctrl+Shift+T
./claude-desktop/install.sh

# cursor editor, then Ctrl+K Ctrl+T → Cosmic Noir
./vscode/install.sh

# telegram desktop
# Settings → Chat Settings → Chat wallpaper → Choose from file → telegram/cosmic-noir.tdesktop-theme

# cursor (then reboot), see cursors/README.md
./cursors/install.sh                      # Orange
./cursors/install.sh --variant Sage      # or another, see --list
reboot

# shell + terminal tools (see Terminal extras above)
./zsh/install.sh
./lsd/install.sh
./fastfetch/install.sh
./starship/install.sh
./bat/install.sh
./delta/install.sh          # then the [include] it prints, in ~/.gitconfig
./lazygit/install.sh
./nvim/install.sh
./helix/install.sh          # then theme = "noir" in helix/config.toml
mkdir -p ~/.config/btop/themes && cp btop/Noir.theme ~/.config/btop/themes/

# other terminals, one include line each (see Terminal extras above)
./kitty/install.sh
./alacritty/install.sh
./wezterm/install.sh
./ghostty/install.sh

# gtk + qt apps (see GTK and Qt apps above)
./gtk/install.sh
./qt/install.sh             # then qt6ct → Color scheme → Noir

# obsidian + discord, both halves in one file (see above)
./obsidian/install.sh ~/path/to/vault
./discord/install.sh

# wallpaper
# Settings → Wallpaper → Add image → a file from backgrounds/ (see Icons and wallpaper above)

./icons/install.sh                  # icons (see Icons above)
# Maple fonts (https://github.com/subframe7536/maple-font), then
# fonts, icons, terminal look from cosmic/config/
./cosmic/install.sh
```

---

## Switching rice

The installers replace what they own (with a `*.bak` copy), but some things
pile up instead: shell layers in `~/.zshrc`, LazyVim specs, the updater link and
btop's theme setting. `scripts/switch.sh` makes Noir the active rice, coming
from any other `cosmic-*-theme` rice, and tidies those up. Every rice repo ships
the same script.

```bash
./scripts/switch.sh               # switch, icons included
./scripts/switch.sh --keep-icons  # leave the current icon theme alone
```

It backs up every file it replaces, then:

- copies `cosmic/config/` (fonts, terminal look, icons) and turns dark mode on.
  The terminal scheme and icon theme are only replaced when the current one is
  not already a Noir variant, so a dimmer text variant or another icon colour
  survives. Icons stay as they are until `./icons/install.sh` has run.
- runs the fastfetch, lsd, bat, starship, delta, lazygit, kitty, Alacritty,
  WezTerm, Ghostty, Helix, GTK, Qt, Discord, Neovim and Claude Desktop
  installers and sets btop's `color_theme`. The terminal, editor and Qt
  installers only copy theme files; the include line you added once stays,
  switch it by hand when the file name differs between rices
- moves every other rice's LazyVim spec from `~/.config/nvim/lua/plugins/` to
  `~/.config/nvim/rice-off/` (LazyVim loads every spec there and the last
  colorscheme wins); your own specs stay
- comments out every other rice's `source` line in `~/.zshrc`, and
  cosmic-ricing's `ricing/zsh/colors.zsh`, then uncomments Noir's or adds it
- points `~/update_system.sh` at this repo's updater
- installs the Firefox userChrome / userContent

The GUI steps it cannot do are printed at the end:

1. Settings → Desktop → Appearance → Dark → Import `cosmic/Noir.ron`
2. COSMIC Terminal → View → Color schemes → Dark tab → Import `cosmic-term/Noir-term.ron`
3. Firefox: disable the old rice's add-on, enable [this one](https://addons.mozilla.org/en-US/firefox/addon/cosmic-noir-theme/), restart Firefox
4. Settings → Wallpaper → a file from `backgrounds/`
5. Claude Desktop: Ctrl+Shift+T → `cosmic-noir`, Appearance → Dark
6. `exec zsh`, restart Neovim (`:Lazy clean` drops plugins only the old specs used)
7. Obsidian: `./obsidian/install.sh <vault>`; delta: the `[include]` path in `~/.gitconfig`

Skip 1 and 2 when that slot already holds Noir. The first time on this rice,
run [Setup](#setup) once for the fonts, icons and cursor.

**Within the pair** (Noir ↔ [Dossier](https://github.com/atraxsrc/cosmic-dossier-theme)): the two halves
sit side by side in COSMIC's Dark and Light slots and share one Claude Desktop
theme, so after the first time only the Firefox add-on and the wallpaper are
left by hand. Add `--keep-icons` to keep one icon colour across the pair.

Leaving Noir is the next rice's `./scripts/switch.sh`. `./cursors/uninstall.sh`
puts the Pop cursor back.

---

## Stack

| Tool | What it does |
|------|-------------|
| [Pop!_OS 24.04](https://pop.system76.com/) | Base OS by System76 |
| [COSMIC DE](https://system76.com/cosmic) | Desktop environment |
| [oh-my-zsh](https://ohmyz.sh/) | zsh framework + plugins |
| [lsd](https://github.com/lsd-rs/lsd) | `ls` with icons and colours |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info |
| [btop](https://github.com/aristocratos/btop) | Resource monitor |
| [starship](https://starship.rs/) | Prompt |
| [bat](https://github.com/sharkdp/bat) | `cat` with syntax highlighting |
| [delta](https://github.com/dandavison/delta) | git diff pager |
| [lazygit](https://github.com/jesseduffield/lazygit) | git TUI |
| [Helix](https://helix-editor.com/) | Editor |
| [kitty](https://sw.kovidgoyal.net/kitty/), [Alacritty](https://alacritty.org/), [WezTerm](https://wezterm.org/), [Ghostty](https://ghostty.org/) | Other terminals |
| [qt6ct](https://github.com/trialuser02/qt6ct) | Qt colour scheme |
| [Vencord](https://vencord.dev/) / [Vesktop](https://github.com/Vencord/Vesktop) | Discord theme host |
| [cosmic-icon-themes](https://github.com/atraxsrc/cosmic-icon-themes) | Icon pack (Cosmic-Noir), recolored from [Kanagawa icons](https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme/tree/main/icons/Kanagawa) |
| [Oxygen-Cursors](https://github.com/wo2ni/Oxygen-Cursors) | Cursor, recoloured to the icon colours |

## Credits

- Palette and wallpapers: Greek Noir (MIT). This repo is a COSMIC port; the
  renders for this palette are in `backgrounds/`.
- Light half: [cosmic-dossier-theme](https://github.com/atraxsrc/cosmic-dossier-theme).
  Shared baseline (frosted glass, squared corners, fonts) from
  [cosmic-darkgold-theme](https://github.com/atraxsrc/cosmic-darkgold-theme).

## License

MIT. The cursor artwork keeps the terms of KDE's Oxygen project, see
[`cursors/README.md`](cursors/README.md).
