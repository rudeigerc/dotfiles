require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'json', 'go', 'python', 'markdown', 'beancount' },
    highlight = {
        enable = true,
    },
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
        },
    },
    -- RRethy/nvim-treesitter-endwise
    endwise = {
        enable = true,
    },
})

local ft_to_parser = require('nvim-treesitter.parsers').filetype_to_parsername
ft_to_parser.envd = 'python'
