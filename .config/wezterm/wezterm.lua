local wezterm = require("wezterm")

return {
	color_scheme = "GitHub Dark Dimmed",
	font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	font_size = 13,
	default_cursor_style = "BlinkingBlock",
	use_ime = true,
	keys = {
		{ key = "LeftArrow", mods = "SUPER", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "RightArrow", mods = "SUPER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "d", mods = "SUPER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{
			key = "d",
			mods = "SUPER|SHIFT",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "c", mods = "SUPER|SHIFT", action = "ActivateCopyMode" },
		{ key = "LeftArrow", mods = "SUPER|ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "RightArrow", mods = "SUPER|ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "UpArrow", mods = "SUPER|ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "DownArrow", mods = "SUPER|ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	},
	hyperlink_rules = {
		-- Linkify things that look like URLs and the host has a TLD name.
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},

		-- linkify email addresses
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = "mailto:$0",
		},

		-- file:// URI
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = [[\bfile://\S*\b]],
			format = "$0",
		},

		-- Linkify things that look like URLs with numeric addresses as hosts.
		-- E.g. http://127.0.0.1:8000 for a local development server,
		-- or http://192.168.1.1 for the web interface of many routers.
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},

		-- Make username/project paths clickable. This implies paths like the following are for GitHub.
		-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
		-- As long as a full URL hyperlink regex exists above this it should not match a full URL to
		-- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
		{
			regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
			format = "https://www.github.com/$1/$3",
		},
	},
}
