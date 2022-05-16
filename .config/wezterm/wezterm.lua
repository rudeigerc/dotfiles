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
    {key="d", mods="SUPER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="d", mods="SUPER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="c", mods="SUPER|SHIFT", action="ActivateCopyMode"},
    {key="LeftArrow", mods="SUPER|ALT", action=wezterm.action({ActivatePaneDirection="Left"})},
    {key="RightArrow", mods="SUPER|ALT", action=wezterm.action({ActivatePaneDirection="Right"})},
    {key="UpArrow", mods="SUPER|ALT", action=wezterm.action({ActivatePaneDirection="Up"})},
    {key="DownArrow", mods="SUPER|ALT", action=wezterm.action({ActivatePaneDirection="Down"})},
  },
  hyperlink_rules = {
    -- Linkify things that look like URLs
    -- This is actually the default if you don't specify any hyperlink_rules
    {
      regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },

    -- linkify email addresses
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },

    -- file:// URI
    {
      regex = "\\bfile://\\S*\\b",
      format = "$0",
    },
  },
}
