# Cosmic Noir / Cosmic Dossier for Cursor

Colour themes for [Cursor](https://cursor.com) from the COSMIC
[Noir](https://github.com/atraxsrc/cosmic-noir-theme) rice and its light half
[Dossier](https://github.com/atraxsrc/cosmic-dossier-theme): **Cosmic Noir** and **Cosmic Dossier** in one
extension. It is a plain VS Code theme extension, so VS Code and VSCodium
take it too. The same folder ships in both repos.

## Install

```bash
./vscode/install.sh                # Cursor
./vscode/install.sh code codium    # VS Code / VSCodium instead
```

It packs this folder into `vscode/cosmic-noir-theme-<version>.vsix` and installs
that with the editor's CLI (`cursor --install-extension`), so the theme is
listed under Extensions and running the script again updates it. Then press
<kbd>Ctrl</kbd>+<kbd>K</kbd> <kbd>Ctrl</kbd>+<kbd>T</kbd> and pick **Cosmic Noir** or **Cosmic Dossier**.

No CLI on the PATH (an AppImage, say): the script still builds the `.vsix`;
install it from Extensions → `...` → **Install from VSIX**.

## Follow COSMIC's Dark / Light toggle

COSMIC tells apps which mode is on through its desktop portal. With these
lines in Cursor's `settings.json` (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> →
**Preferences: Open User Settings (JSON)**), Cursor switches between the two
themes along with the desktop:

```jsonc
"window.autoDetectColorScheme": true,
"workbench.preferredDarkColorTheme": "Cosmic Noir",
"workbench.preferredLightColorTheme": "Cosmic Dossier"
```

## What it colours

Code is coloured the way Neovim is in the rice (`nvim/colors/*.lua`):

| Role | Noir | Dossier |
|------|------|---------|
| Keywords, tags | ![#F25623](https://placehold.co/12x12/F25623/F25623.png) `#F25623` | ![#953B19](https://placehold.co/12x12/953B19/953B19.png) `#953B19` |
| Functions, tag attributes | ![#AEAB94](https://placehold.co/12x12/AEAB94/AEAB94.png) `#AEAB94` | ![#43432B](https://placehold.co/12x12/43432B/43432B.png) `#43432B` |
| Strings | ![#88A57D](https://placehold.co/12x12/88A57D/88A57D.png) `#88A57D` | ![#50563A](https://placehold.co/12x12/50563A/50563A.png) `#50563A` |
| Numbers, constants | ![#F56E0F](https://placehold.co/12x12/F56E0F/F56E0F.png) `#F56E0F` | ![#754E3E](https://placehold.co/12x12/754E3E/754E3E.png) `#754E3E` |
| Types, classes, modules | ![#959C95](https://placehold.co/12x12/959C95/959C95.png) `#959C95` | ![#6B1F2F](https://placehold.co/12x12/6B1F2F/6B1F2F.png) `#6B1F2F` |
| Imports, macros, decorators, escapes, `this` / `self` | ![#F0913A](https://placehold.co/12x12/F0913A/F0913A.png) `#F0913A` | ![#8C4329](https://placehold.co/12x12/8C4329/8C4329.png) `#8C4329` |
| Parameters (italic) | ![#A6ADA6](https://placehold.co/12x12/A6ADA6/A6ADA6.png) `#A6ADA6` | ![#59574D](https://placehold.co/12x12/59574D/59574D.png) `#59574D` |
| Operators, punctuation | ![#7D837D](https://placehold.co/12x12/7D837D/7D837D.png) `#7D837D` | ![#59574D](https://placehold.co/12x12/59574D/59574D.png) `#59574D` |
| Comments (italic) | ![#686C69](https://placehold.co/12x12/686C69/686C69.png) `#686C69` | ![#6B7360](https://placehold.co/12x12/6B7360/6B7360.png) `#6B7360` |
| Accent | ![#F25623](https://placehold.co/12x12/F25623/F25623.png) `#F25623` | ![#8E3818](https://placehold.co/12x12/8E3818/8E3818.png) `#8E3818` |

The workbench takes the window colour of the rice's `cosmic/*.ron` for the
editor, side bars, panel, title and status bar, the container colours for
menus, hovers, inputs and the command palette, and the accent for the active
tab line, buttons, badges and the menu highlight. The integrated terminal uses
the rice's COSMIC Terminal scheme (`cosmic-term/`), so command output looks the
same as in COSMIC Terminal.

Cursor's own panels (Agent, chat, inline diffs) have no colour keys of their
own. Cursor builds them from standard ones, and the theme sets those: the
button colour is the agent's accent, the side bar and panel colours are its
surfaces, the diff colours are its accept / reject highlights, and the
terminal's `blue` slot colours its links.

## Contrast

Text is at least 4.5:1 on the window background and on menus and hovers,
comments and line numbers at least 3:1, checked with a script over the text
and background pairs the theme sets.
Where a Neovim colour falls short, it is darkened (light theme) or lightened
(dark theme) just far enough here:

- **Dossier**: imports, macros, decorators and escapes ![#DE6A41](https://placehold.co/12x12/de6a41/de6a41.png) `#DE6A41` → ![#8C4329](https://placehold.co/12x12/8c4329/8c4329.png) `#8C4329`; secondary text (status bar, titles, descriptions) ![#59574D](https://placehold.co/12x12/59574d/59574d.png) `#59574D` → ![#555349](https://placehold.co/12x12/555349/555349.png) `#555349`; the accent ![#953B19](https://placehold.co/12x12/953b19/953b19.png) `#953B19` → ![#8E3818](https://placehold.co/12x12/8e3818/8e3818.png) `#8E3818`; strings ![#51573B](https://placehold.co/12x12/51573b/51573b.png) `#51573B` → ![#50563A](https://placehold.co/12x12/50563a/50563a.png) `#50563A`; warnings and modified files ![#754E3E](https://placehold.co/12x12/754e3e/754e3e.png) `#754E3E` → ![#654335](https://placehold.co/12x12/654335/654335.png) `#654335`; added files and success marks ![#51573B](https://placehold.co/12x12/51573b/51573b.png) `#51573B` → ![#484D35](https://placehold.co/12x12/484d35/484d35.png) `#484D35`.

On the highlighted current line, code can dip slightly under 4.5:1 and
comments under 3:1.
