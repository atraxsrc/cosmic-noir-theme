# Noir

> Charcoal, grey-sage and one loud orange. The dark half of Noir / Dossier.

Pop!_OS 24.04 on the COSMIC desktop, one palette carried through the whole
machine: desktop, terminal, shell, editor, browser. This note is the rice
describing itself, written in Markdown and rendered by **Postilla**.

## Palette

Every text colour is checked against the window background ![#171717](https://placehold.co/12x12/171717/171717.png) `#171717`.

| Role | Hex | Contrast on background |
|------|-----|------------------------|
| Text | ![#CCD0CF](https://placehold.co/12x12/ccd0cf/ccd0cf.png) `#CCD0CF` | 11.5:1 |
| Orange, accent | ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` | 5.2:1 |
| Ember, warning | ![#F56E0F](https://placehold.co/12x12/f56e0f/f56e0f.png) `#F56E0F` | 6.1:1 |
| Sage, success | ![#88A57D](https://placehold.co/12x12/88a57d/88a57d.png) `#88A57D` | 6.6:1 |
| Khaki, symlinks | ![#AEAB94](https://placehold.co/12x12/aeab94/aeab94.png) `#AEAB94` | 7.7:1 |
| Grey-sage, directories | ![#959C95](https://placehold.co/12x12/959c95/959c95.png) `#959C95` | 6.4:1 |
| Muted | ![#7D837D](https://placehold.co/12x12/7d837d/7d837d.png) `#7D837D` | 4.6:1 |

Containers sit one step away from the background at ![#222222](https://placehold.co/12x12/222222/222222.png) `#222222`, which is
what frosted glass blurs into.

## Where the colours go

```mermaid
flowchart LR
    P[Noir palette] --> D[COSMIC desktop<br/>Noir.ron, Dark slot]
    P --> T[COSMIC Terminal<br/>Noir]
    P --> S[zsh layer<br/>LS_COLORS, highlighting, starship]
    P --> E[Postilla<br/>syntax theme from the terminal scheme]
    T --> B[btop, bat, lsd, fastfetch]
    D --> F[Firefox<br/>built-in Dark + userChrome]
```

## Setup, in order

- [x] Import `cosmic/Noir.ron` into Appearance, **Dark** slot
- [x] Import `cosmic-term/Noir-term.ron`, pick **Noir** for the profile
- [x] `./icons/install.sh` for the **Cosmic-Noir** icons, `./cosmic/install.sh` for fonts and the terminal look
- [x] `./zsh/install.sh`, `./lsd/install.sh`, `./fastfetch/install.sh`
- [x] Cursor: Oxygen-Noir-Orange
- [x] Wallpaper: `backgrounds/noir-anime.png`
- [x] Screenshot for the README

## The baseline every rice shares

```ron
corner_radii: (
    radius_xs: (2.0, 2.0, 2.0, 2.0),   // squared corners
    radius_xl: (2.0, 2.0, 2.0, 2.0),
),
frosted: VeryLow,
frosted_windows: true,
frosted_panel: true,
frosted_applets: true,
frosted_maximized_apps: false,
gaps: (0, 7),
active_hint: 1,
```

Contrast is the WCAG ratio[^1], where $L$ is relative luminance:

```typst
$ (L_1 + 0.05) / (L_2 + 0.05) >= 4.5 $
```

---

*Rendered in Postilla, a Markdown notes app for COSMIC. The window is painted
with this rice's terminal scheme, imported as a syntax theme.*

[^1]: Web Content Accessibility Guidelines, success criterion 1.4.3. Normal text wants 4.5:1, large text 3:1.
