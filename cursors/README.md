# Cursor

**Oxygen** cursors (the original KDE Oxygen designs, as collected by
[wo2ni/Oxygen-Cursors](https://github.com/wo2ni/Oxygen-Cursors)) recoloured to this
rice's icon colours: one per folder colour of the
[Cosmic-Noir](https://github.com/atraxsrc/cosmic-icon-themes) icon pack, **Orange**, **Sage**, **Dark**.
All patched so they work in COSMIC's own apps.

| Variant | Preview | Body | Contrast on ![#171717](https://placehold.co/12x12/171717/171717.png) `#171717` | Goes with |
| ------- | ------- | ---- | ------------------- | --------- |
| **Orange** (default) | ![](../assets/cursors/Oxygen-Noir-Orange.png) | ![#FF5F1F](https://placehold.co/12x12/ff5f1f/ff5f1f.png) `#FF5F1F` neon | 5.9:1 | Orange folders |
| **Sage** | ![](../assets/cursors/Oxygen-Noir-Sage.png) | ![#88A57D](https://placehold.co/12x12/88a57d/88a57d.png) `#88A57D` | 6.6:1 | Sage folders |
| **Dark** | ![](../assets/cursors/Oxygen-Noir-Dark.png) | ![#2A2A2A](https://placehold.co/12x12/2a2a2a/2a2a2a.png) `#2A2A2A` | 1.2:1 | Dark folders |

Each variant is a normal folder here (`Oxygen-Noir-<Variant>/index.theme` + `cursors/`),
already fixed for COSMIC. Nothing is downloaded at install time.

The colours are made with [`recolour.py`](recolour.py) (the script from
cosmic-darkgold-theme, plus `--spread` and `--glow`): every body pixel keeps
its shading and takes the hue and saturation of the target colour, the white border,
black outline and shadow stay as they are, and the COSMIC symlinks are carried over.
Any coloured variant works as the base. To add a colour:

```bash
./cursors/recolour.py --base cursors/Oxygen-Noir-Orange \
  --out cursors/Oxygen-Noir-Teal --name "Oxygen Noir Teal" --colour '#2F8F8F' \
  --preview assets/cursors/Oxygen-Noir-Teal.png --bg '#171717'
```

then add `Teal` to `VARIANTS` in `install.sh` and `uninstall.sh`.

Orange is the fluorescent one. The Oxygen shading runs 0.18 above and below the
target lightness, which turns the Pop!_OS orange ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` rust at the rim and salmon
on top. Orange uses neon ![#FF5F1F](https://placehold.co/12x12/ff5f1f/ff5f1f.png) `#FF5F1F` with the shading held to 0.11 and the highlight
turned 6 degrees towards yellow, so the rim is ![#E64200](https://placehold.co/12x12/e64200/e64200.png) `#E64200`, the body ![#FF6316](https://placehold.co/12x12/ff6316/ff6316.png) `#FF6316` and the
gloss ![#FF9857](https://placehold.co/12x12/ff9857/ff9857.png) `#FF9857`, all fully saturated:

```bash
./cursors/recolour.py --base cursors/Oxygen-Noir-Sage \
  --out cursors/Oxygen-Noir-Orange --name "Oxygen Noir Orange" \
  --colour '#FF5F1F' --spread 0.11 --glow 6 \
  --preview assets/cursors/Oxygen-Noir-Orange.png --bg '#171717'
```

For the plain ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` instead, pass that colour with `--spread 0.11` and no `--glow`.

## Install

COSMIC has no cursor picker yet, so the script sets it.

```bash
./cursors/install.sh                      # Orange
./cursors/install.sh --variant Sage      # another colour, see --list
reboot
```

Options:

| Option | Effect |
| ------ | ------ |
| `--variant NAME` | Which colour, default `Orange`; `--list` prints them |
| `--user` | Theme goes to `~/.local/share/icons` instead of `/usr/share/icons` (no sudo for the files; `/etc/environment` still needs it) |
| `--size N` | Cursor size, default 24 (`XCURSOR_SIZE_OVERRIDE=N` works too) |

What it does, with `<Theme>` the chosen `Oxygen-Noir-<Variant>`:

| Step | Where | Why |
| ---- | ----- | --- |
| Copy the theme | `/usr/share/icons/<Theme>` | An older, different copy is moved to `.<Theme>.bak-<timestamp>` |
| `XCURSOR_THEME` / `XCURSOR_SIZE` | `/etc/environment` | `cosmic-comp` reads these at login |
| `Inherits=<Theme>` | `~/.icons/default/index.theme` | X11 / XWayland apps |
| `cursor-theme` / `cursor-size` | gsettings | GTK apps |
| `flatpak override --user --env=…` | Flatpak | Sandboxed apps don't see `/etc/environment` |

Every config file it changes gets a `.bak-<timestamp>` copy first. Running it again
changes nothing. Switching variants is just running it again with another
`--variant`. The compositor only reads the cursor at startup, so a reboot (or
log out and back in) is required.

## Uninstall

```bash
./cursors/uninstall.sh
reboot
```

It removes every `Oxygen-Noir-*` variant from both `/usr/share/icons` and
`~/.local/share/icons`. Settings are only reset when one of them is the active
cursor; `/etc/environment` and `~/.icons/default/index.theme` get a
`.bak-<timestamp>` copy first.

## Why the symlinks

Without them the cursor is right in Firefox but **black in COSMIC's own apps**
(Terminal, Files, Settings, panel).

Oxygen only ships old X11 cursor names (`left_ptr`, `size_hor`, `openhand`, …),
which Firefox and XWayland apps ask for. COSMIC apps use the Wayland cursor-shape
protocol instead: they ask the compositor for CSS names like `default` or
`ew-resize`. When the theme has no file by that name, `cosmic-comp` falls back to
its built-in black cursor.

So the theme here has these extra relative symlinks in its `cursors/` folder:

```text
default, context-menu              -> left_ptr
crosshair                          -> cross
cell, zoom-in, zoom-out            -> plus
vertical-text                      -> xterm
grab / grabbing                    -> openhand / closedhand
no-drop                            -> dnd-no-drop
ew-resize / ns-resize              -> size_hor / size_ver
ne-resize, sw-resize, nesw-resize  -> size_bdiag
nw-resize, se-resize, nwse-resize  -> size_fdiag
```

The same trick fixes any older cursor theme with the black-cursor problem.

## Check it

```bash
echo $XCURSOR_THEME
ls -l /usr/share/icons/$XCURSOR_THEME/cursors/default   # -> left_ptr
cat /proc/$(pgrep -x cosmic-comp)/environ | tr '\0' '\n' | grep XCURSOR
```

If the arrow is still black after a reboot, the last command shows whether the
compositor got the variable. With `--user`, look in `~/.local/share/icons` instead.

## Credits

- Cursor artwork: the original **Oxygen** cursor designs from the
  [KDE Oxygen project](https://invent.kde.org/plasma/oxygen), in the colour
  variants collected by [**wo2ni/Oxygen-Cursors**](https://github.com/wo2ni/Oxygen-Cursors).
- This repo recolours them to the Noir palette with [`recolour.py`](recolour.py)
  (from [cosmic-darkgold-theme](https://github.com/atraxsrc/cosmic-darkgold-theme/blob/master/cursors/recolour.py),
  with `--spread` and `--glow` added here) and adds the COSMIC symlinks and the scripts.
- The upstream repo has **no LICENSE file**, so the licence of the artwork is
  not stated there. The MIT licence of this repo does not cover the cursor files;
  they keep whatever terms KDE's Oxygen artwork carries.
