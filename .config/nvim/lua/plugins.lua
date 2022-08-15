local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/plugin/packer_compiled.lua'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

return require('packer').startup({
    config = {
        compile_path = compile_path,
    },
    function(use)
        use({
            'wbthomason/packer.nvim',
        })

        -- theme
        use({
            'projekt0n/github-nvim-theme',
            config = function()
                require('config.theme')
            end,
        })

        use({
            'akinsho/bufferline.nvim',
            tag = 'v2.*',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require('config.bufferline')
            end,
        })

        use({
            'nvim-lualine/lualine.nvim',
            after = 'github-nvim-theme',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require('config.lualine')
            end,
        })

        use({
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons',
            },
            config = function()
                require('config.tree')
            end,
        })

        use({
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('config.indent-blankline')
            end,
        })

        -- fuzzy finder
        use({
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = function()
                require('config.telescope')
            end,
        })

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

        use({
            'neovim/nvim-lspconfig',
            'folke/trouble.nvim',
            'ray-x/lsp_signature.nvim',
        })

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
            'lewis6991/gitsigns.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('config.gitsigns')
            end,
        })

        use({
            'airblade/vim-gitgutter',
        })

        use({
            'folke/which-key.nvim',
            config = function()
                require('config.which-key')
            end,
        })

        use('stevearc/dressing.nvim')
        use('rcarriga/nvim-notify')
    end,
})
