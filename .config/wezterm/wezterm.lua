local wezterm = require 'wezterm';

return {
  color_scheme = "GitHub Dark Dimmed",
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  font_size = 13,
  default_cursor_style = 'BlinkingBlock',
  use_ime = true,
  keys = {
    {key="LeftArrow", mods="SUPER", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="SUPER", action=wezterm.action{ActivateTabRelative=1}},
  },
}
