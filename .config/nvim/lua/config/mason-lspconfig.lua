require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls', -- Go
        'sumneko_lua', -- Lua
    },
})
