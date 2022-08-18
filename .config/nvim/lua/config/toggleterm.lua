require('toggleterm').setup({
    direction = 'float',
})

local map = require('utils').map
map('n', '<leader>`', [[<cmd>ToggleTerm<cr>]], { noremap = true, silent = true })
