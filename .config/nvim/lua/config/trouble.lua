require('trouble').setup({})

local map = require('utils').map
map('n', '<leader>xx', [[<cmd>Trouble<cr>]], { noremap = true, silent = true })
