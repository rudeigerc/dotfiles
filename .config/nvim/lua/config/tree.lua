require('nvim-tree').setup({
    view = {
        side = 'left',
    },
    filters = {
        custom = { '^.git$' },
    },
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        require('nvim-tree').toggle(false, true)
    end,
})
