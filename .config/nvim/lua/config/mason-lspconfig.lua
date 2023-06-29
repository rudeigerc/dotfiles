require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls', -- Go
        'lua_ls', -- Lua
        'pyright', -- Python
        'taplo', -- TOML
        'dockerls', -- Docker
    },
})
