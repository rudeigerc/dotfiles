require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'lua',
        'json',
        'go',
        'python',
        'markdown',
        'beancount',
        'comment',
        'gitignore',
        'toml',
        'yaml',
        'vim',
    },
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
