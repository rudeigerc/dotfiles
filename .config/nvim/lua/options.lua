local g = vim.g
local o = vim.o

g.mapleader = ' '
-- https://www.reddit.com/r/neovim/comments/rvwsl3/introducing_filetypelua_and_a_call_for_help/
g.do_filetype_lua = 1
g.did_load_filetypes = 0

o.encoding = 'utf-8'
o.fileencoding = 'utf-8'
o.tabstop = 4
o.softtabstop = 4
o.number = true
o.relativenumber = true
o.smartindent = true
o.cursorline = true
o.mouse = 'a'
o.ignorecase = true
o.smartcase = true
o.showmatch = true
o.termguicolors = true
o.hidden = true
o.clipboard = 'unnamedplus'
o.wildignorecase = true
o.wildignore = '.git/**,*.DS_Store,**/node_modules/**'
