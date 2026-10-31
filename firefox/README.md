# Firefox - Noir

Firefox chrome matching the COSMIC Noir rice. Ported from the DarkGold
baseline (theme recipe and stylesheets), recoloured for charcoal and orange.

## Palette

Stylesheets:

| Hex       | Role                      |
|-----------|---------------------------|
| ![#171717](https://placehold.co/12x12/171717/171717.png) `#171717` | Frame, page chrome, text on orange |
| ![#222222](https://placehold.co/12x12/222222/222222.png) `#222222` | Panels, menus             |
| ![#412A22](https://placehold.co/12x12/412a22/412a22.png) `#412A22` | Menu hover row (orange tinted into the panel) |
| ![#502D22](https://placehold.co/12x12/502d22/502d22.png) `#502D22` | Menu pressed row          |
| ![#3A3B3A](https://placehold.co/12x12/3a3b3a/3a3b3a.png) `#3A3B3A` | Separators, menu border   |
| ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` | Accent, URL bar border, hover rail |
| ![#88A57D](https://placehold.co/12x12/88a57d/88a57d.png) `#88A57D` | Menu text, new tab accent, active |
| ![#959C95](https://placehold.co/12x12/959c95/959c95.png) `#959C95` | Links                     |
| ![#DADEDD](https://placehold.co/12x12/dadedd/dadedd.png) `#DADEDD` | Hover text                |

## Structure

```
firefox/
├── theme/            WebExtension theme source (Cosmic Noir)
│   ├── manifest.json     DarkGold's 24 colour keys + URL bar ring and selection
│   └── icons/            32 / 48 / 64 / 96 / 128, cropped from noir-samurai
├── chrome/
│   ├── userChrome.css    browser UI: rounded corners, orange menu hover
│   └── userContent.css   new tab page: orange accents, blank shortcut tiles
└── install.sh            copies chrome/ into the default profile
```

Two layers, use one or both:

1. **Theme (colours):** [Cosmic Noir](https://addons.mozilla.org/en-US/firefox/addon/cosmic-noir-theme/) colours the toolbar, tabs, URL bar,
   menus, sidebar and new tab page. This is the main look.
2. **Stylesheets (optional):** `chrome/` adds rounded corners, orange menu
   hover, orange accents and a blank new-tab grid on top of the theme. They
   also work with Firefox's built-in Dark theme.

## Theme

Same colour keys and roles as DarkGold's Firefox theme: icons take the calm
accent (sage here, gold there), and everything "hot" (tab line, pressed
button, menu and sidebar selection, loading) takes the loud one (orange here,
coral there). One extra key, `toolbar_field_border_focus`, pins the focused
URL bar ring to orange so it does not fall back to the desktop accent when
`widget.non-native-theme.use-theme-accent` is on (the Firefox default on
Linux). Two more, `toolbar_field_highlight` and `toolbar_field_highlight_text`,
colour selected text in the URL bar the same way, as DarkGold does. Every
text colour clears WCAG AA (4.5:1) on its background; icons and the tab
line clear 3:1.

| Hex       | Where in the theme                          |
|-----------|---------------------------------------------|
| ![#171717](https://placehold.co/12x12/171717/171717.png) `#171717` | Frame, new tab, text on orange selections   |
| ![#222222](https://placehold.co/12x12/222222/222222.png) `#222222` | Toolbar, menus                              |
| ![#3A3B3A](https://placehold.co/12x12/3a3b3a/3a3b3a.png) `#3A3B3A` | URL bar field, button hover, sidebar border |
| ![#CCD0CF](https://placehold.co/12x12/ccd0cf/ccd0cf.png) `#CCD0CF` | Body text                                   |
| ![#959C95](https://placehold.co/12x12/959c95/959c95.png) `#959C95` | Menu border                                 |
| ![#88A57D](https://placehold.co/12x12/88a57d/88a57d.png) `#88A57D` | Icons, inactive tab text                    |
| ![#F25623](https://placehold.co/12x12/f25623/f25623.png) `#F25623` | Focused tab text, focused URL bar ring and text selection, tab line, pressed button, menu and sidebar selection, loading, attention |

Build the package:

```bash
cd theme && zip -r -X ../cosmic-noir.zip . -x '.*'
```

Try it without installing: `about:debugging#/runtime/this-firefox` → **Load
Temporary Add-on** → pick `theme/manifest.json`. It is gone on restart.

## Stylesheets

```bash
./install.sh
```

Copies `chrome/` into your `*.default-release` profile, backs up anything it
replaces, and adds two prefs to `user.js`: one so Firefox reads the
stylesheets, one so the accent (URL bar ring, buttons) comes from the theme
and not the desktop. Then **fully restart**
Firefox - `userChrome.css` is parsed only at startup.

To install into another profile (a test profile, say), pass its folder:

```bash
./install.sh ~/.mozilla/firefox/<profile>
```

Every rice's `install.sh` takes the same argument, so switching a test
profile between rices is one command plus a restart.

Manual equivalent:

1. `about:config` → `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
2. `about:support` → Profile Directory → Open Directory
3. Copy `chrome/` in
4. Restart

To undo: delete the two files from the profile's `chrome/` folder and restart.

## Notes

- **Never set `--panel-*` or `--arrowpanel-*` on `:root`.** Those variables leak
  into the toolbar and blank the URL bar. They stay on the popup elements.
- **Context menus do not get an extra element border.** A second stroke made
  the right-click panel look detached. Hover is an orange-tinted ![#412A22](https://placehold.co/12x12/412a22/412a22.png) `#412A22`
  row with a 3px orange rail on the left, not a full ring.
- **Native menu styling is switched off** (`appearance: none`) on menus and
  menu rows. Without it the COSMIC/GTK hover paints over the colours above.
- **`[_moz-menuactive="true"]` is required.** Firefox marks the active
  context-menu row with that attribute, not only `:hover`.
- **`userContent.css` is colours plus one hide rule.** It sets accent / focus /
  link colours and hides shortcut artwork (`opacity: 0`) so the new-tab tiles
  stay blank. No size or position rules on the tiles.
- Built against **Firefox 154**.

## License

MIT, same as the rest of the repo.
