local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/plugin/packer_compiled.lua'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
end

return require('packer').startup({
    config = {
        compile_path = compile_path,
        display = {
            open_fn = require('packer.util').float,
        },
    },
    function(use)
        use('wbthomason/packer.nvim')

        -- performance
        use('lewis6991/impatient.nvim')

        -- theme
        use({
            'projekt0n/github-nvim-theme',
            config = function()
                require('config.theme')
            end,
        })

        -- start screen
        use({
            'goolord/alpha-nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function()
                require('config.alpha')
            end,
        })

        -- buffer
        use({
            'akinsho/bufferline.nvim',
            tag = 'v2.*',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require('config.bufferline')
            end,
        })

        -- statusline
        use({
            'nvim-lualine/lualine.nvim',
            after = 'github-nvim-theme',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require('config.lualine')
            end,
        })

        -- file tree
        use({
            'nvim-neo-tree/neo-tree.nvim',
            branch = 'v2.x',
            requires = {
                'nvim-lua/plenary.nvim',
                'kyazdani42/nvim-web-devicons',
                'MunifTanjim/nui.nvim',
            },
            config = function()
                require('config.tree')
            end,
        })

        -- outline
        use({
            'stevearc/aerial.nvim',
            config = function()
                require('config.aerial')
            end,
        })

        -- editor
        use({
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('config.indent-blankline')
            end,
        })

        -- fuzzy finder
        use({
            {
                'nvim-telescope/telescope.nvim',
                tag = '0.1.0',
                requires = {
                    'nvim-lua/plenary.nvim',
                    'nvim-telescope/telescope-github.nvim',
                    'nvim-telescope/telescope-ui-select.nvim',
                    'nvim-telescope/telescope-fzf-native.nvim',
                },
                config = function()
                    require('config.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make',
            },
        })

        -- highlighting
        use({
            'nvim-treesitter/nvim-treesitter',
            requires = {
                'nvim-treesitter/nvim-treesitter-refactor',
                'nvim-treesitter/nvim-treesitter-textobjects',
                'RRethy/nvim-treesitter-endwise',
            },
            -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
            run = function()
                require('nvim-treesitter.install').update({ with_sync = true })
            end,
            config = function()
                require('config.treesitter')
            end,
        })

        -- auto completion
        use({
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-vsnip',
                'hrsh7th/vim-vsnip',
                'hrsh7th/vim-vsnip-integ',
                { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-nvim-lsp-signature-help',
                { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
                { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
                { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
            },
            config = function()
                require('config.cmp')
            end,
        })

        -- lsp
        use({
            {
                'williamboman/mason.nvim',
                config = function()
                    require('config.mason')
                end,
            },
            {
                'williamboman/mason-lspconfig.nvim',
                config = function()
                    require('config.mason-lspconfig')
                end,
            },
            {
                'neovim/nvim-lspconfig',
                after = 'cmp-nvim-lsp',
                config = function()
                    require('config.lsp')
                end,
            },
            {
                'folke/trouble.nvim',
                config = function()
                    require('config.trouble')
                end,
            },
            'ray-x/lsp_signature.nvim',
        })

        -- linter
        use({
            'jose-elias-alvarez/null-ls.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
        })

        -- copilot
        use({
            'github/copilot.vim',
            setup = function()
                vim.g.copilot_no_tab_map = 1
                vim.g.copilot_no_maps = 1
                vim.g.copilot_assume_mapped = 1
            end,
        })

        -- git
        use({
            {
                'lewis6991/gitsigns.nvim',
                requires = { 'nvim-lua/plenary.nvim' },
                config = function()
                    require('config.gitsigns')
                end,
            },
            {
                'TimUntersberger/neogit',
                config = function()
                    require('config.gitsigns')
                end,
            },
        })

        -- key bindings
        use({
            'folke/which-key.nvim',
            config = function()
                require('config.which-key')
            end,
        })

        use({
            'folke/noice.nvim',
            config = function()
                require('config.noice')
            end,
            requires = {
                'MunifTanjim/nui.nvim',
                'rcarriga/nvim-notify',
            },
        })

        -- notification
        use({
            'rcarriga/nvim-notify',
            config = function()
                require('config.notify')
            end,
        })

        -- terminal
        use({
            'akinsho/toggleterm.nvim',
            tag = 'v2.*',
            config = function()
                require('config.toggleterm')
            end,
        })

        -- comment
        use({
            'numToStr/Comment.nvim',
            config = function()
                require('config.comment')
            end,
        })
    end,
})
