local alpha = require('alpha')
local startify = require('alpha.themes.startify')

local section = {
    header = {
        type = 'text',
        val = {
            [[                                  __                ]],
            [[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        },
        opts = {
            hl = 'Type',
            shrink_margin = false,
        },
    },
    top_buttons = {
        type = 'group',
        val = {
            startify.button('e', 'New file', '<cmd>ene <CR>'),
        },
    },
    mru = {
        type = 'group',
        val = {
            { type = 'padding', val = 1 },
            { type = 'text', val = 'Recent Files', opts = { hl = 'SpecialComment' } },
            { type = 'padding', val = 1 },
            {
                type = 'group',
                val = function()
                    return { startify.mru(0) }
                end,
            },
        },
    },
    packer_cmds = {
        type = 'group',
        val = {
            { type = 'padding', val = 1 },
            { type = 'text', val = 'Packer Commands', opts = { hl = 'SpecialComment', shrink_margin = false } },
            { type = 'padding', val = 1 },
            {
                type = 'group',
                val = function()
                    return {
                        startify.button('I', 'Install Plugins', '<cmd>PackerInstall<CR>'),
                        startify.button('S', 'Sync Plugins', '<cmd>PackerSync<CR>'),
                        startify.button('C', 'Compile Plugins', '<cmd>PackerCompile<CR>'),
                    }
                end,
                opts = { shrink_margin = false },
            },
        },
    },
    bottom_buttons = {
        type = 'group',
        val = {
            startify.button('q', 'Quit', '<cmd>q <CR>'),
        },
    },
    footer = {
        type = 'group',
        val = {},
    },
}

local config = {
    layout = {
        { type = 'padding', val = 1 },
        section.header,
        { type = 'padding', val = 2 },
        section.top_buttons,
        section.mru,
        section.packer_cmds,
        { type = 'padding', val = 1 },
        section.bottom_buttons,
        section.footer,
    },
    opts = {
        margin = 3,
        redraw_on_resize = false,
        setup = function()
            vim.cmd([[autocmd alpha_temp DirChanged * lua require('alpha').redraw()]])
        end,
    },
}

alpha.setup(config)
