require('telescope').setup({
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    extensions = {
        -- nvim-telescope/telescope-fzf-native.nvim
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
        -- nvim-telescope/telescope-ui-select.nvim
        ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
        },
    },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('notify')
require('telescope').load_extension('gh')

local map = require('utils').map
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
map('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
map('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
map('n', '<leader>fn', builtin.help_tags, { noremap = true, silent = true })
