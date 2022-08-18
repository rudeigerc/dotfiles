require('neo-tree').setup({
    close_if_last_window = true,
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
                '.git',
                'node_modules',
            },
        },
    },
})

local map = require('utils').map
map('n', '<C-b>', [[<cmd>NeoTreeShowToggle<cr>]], { noremap = true, silent = true })
