-- Noir for WezTerm, part of cosmic-noir-theme (MIT).
-- Colours follow the COSMIC Terminal scheme (cosmic-term/Noir-term.ron).
--
-- Install: ./wezterm/install.sh puts this in ~/.config/wezterm/, then in
-- ~/.config/wezterm/wezterm.lua:
--   config.colors = require("noir")
-- To follow COSMIC's Dark / Light toggle with the Dossier half installed too:
--   local dark = (wezterm.gui and wezterm.gui.get_appearance() or "Dark"):find("Dark")
--   config.colors = require(dark and "noir" or "dossier")

return {
  foreground = "#CCD0CF",
  background = "#171717",

  cursor_bg = "#F25623",
  cursor_fg = "#171717",
  cursor_border = "#F25623",
  compose_cursor = "#F56E0F",

  selection_bg = "#3A3B3A",
  selection_fg = "none",

  scrollbar_thumb = "#525252",
  split = "#525252",

  -- black, red (orange), green (sage), yellow (khaki), blue (ember),
  -- magenta (ember), cyan (grey-sage), white (pale)
  ansi = { "#101010", "#F25623", "#88A57D", "#AEAB94", "#F56E0F", "#F56E0F", "#7B837B", "#BCBFBC" },
  brights = { "#525252", "#F56E0F", "#A3BC98", "#C9C6B2", "#F56E0F", "#F0913A", "#959C95", "#DADEDD" },

  copy_mode_active_highlight_bg = { Color = "#F25623" },
  copy_mode_active_highlight_fg = { Color = "#171717" },
  copy_mode_inactive_highlight_bg = { Color = "#AEAB94" },
  copy_mode_inactive_highlight_fg = { Color = "#171717" },

  quick_select_label_bg = { Color = "#F56E0F" },
  quick_select_label_fg = { Color = "#171717" },
  quick_select_match_bg = { Color = "#AEAB94" },
  quick_select_match_fg = { Color = "#171717" },

  tab_bar = {
    background = "#171717",
    active_tab = { bg_color = "#F25623", fg_color = "#171717", intensity = "Bold" },
    inactive_tab = { bg_color = "#222222", fg_color = "#959C95" },
    inactive_tab_hover = { bg_color = "#2A2A2A", fg_color = "#CCD0CF" },
    new_tab = { bg_color = "#171717", fg_color = "#959C95" },
    new_tab_hover = { bg_color = "#2A2A2A", fg_color = "#F25623" },
  },
}
