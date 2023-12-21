local wezterm = require('wezterm')

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = tab.tab_index + 1 .. ': ' .. pane.title
    return title
end)

return {
    color_scheme = 'GitHub Dark Dimmed',
    font = wezterm.font_with_fallback({ 'JetBrainsMono Nerd Font Mono', 'Source Han Sans SC' }),
    font_size = 14.0,
    default_cursor_style = 'BlinkingBlock',
    default_cwd = wezterm.home_dir,
    use_ime = true,
    window_close_confirmation = 'NeverPrompt',
    keys = {
        { key = 'LeftArrow', mods = 'SUPER', action = wezterm.action({ ActivateTabRelative = -1 }) },
        { key = 'RightArrow', mods = 'SUPER', action = wezterm.action({ ActivateTabRelative = 1 }) },
        { key = 'd', mods = 'SUPER', action = wezterm.action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
        {
            key = 'd',
            mods = 'SUPER|SHIFT',
            action = wezterm.action({ SplitVertical = { domain = 'CurrentPaneDomain' } }),
        },
        { key = 'c', mods = 'SUPER|SHIFT', action = 'ActivateCopyMode' },
        { key = 'LeftArrow', mods = 'SUPER|ALT', action = wezterm.action({ ActivatePaneDirection = 'Left' }) },
        { key = 'RightArrow', mods = 'SUPER|ALT', action = wezterm.action({ ActivatePaneDirection = 'Right' }) },
        { key = 'UpArrow', mods = 'SUPER|ALT', action = wezterm.action({ ActivatePaneDirection = 'Up' }) },
        { key = 'DownArrow', mods = 'SUPER|ALT', action = wezterm.action({ ActivatePaneDirection = 'Down' }) },
    },
    hyperlink_rules = {
        -- Linkify things that look like URLs and the host has a TLD name.
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
            format = '$0',
        },

        -- linkify email addresses
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
            format = 'mailto:$0',
        },

        -- file:// URI
        -- Compiled-in default. Used if you don't specify any hyperlink_rules.
        {
            regex = [[\bfile://\S*\b]],
            format = '$0',
        },

        -- Linkify things that look like URLs with numeric addresses as hosts.
        -- E.g. http://127.0.0.1:8000 for a local development server,
        -- or http://192.168.1.1 for the web interface of many routers.
        {
            regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
            format = '$0',
        },
    },
    window_frame = {
        font_size = 13.0,
    },
}
