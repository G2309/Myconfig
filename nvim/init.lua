-- init.lua

--  Vim setup 
require('setup')
--  Vim settings 
require('config.vim')
--  Plugin setup 
require('config.plugins')
--  LSP config 
require('config.lsp')
--  Nvim-cmp 
require('config.cmp')
-- 󱘎 Nvim-tree 󱘎
require('nvim-tree').setup()
--  Telescope setup 
require('config.telescope')
-- Colorizer
require('colorizer').setup()
-- 󰄛 Nvim Theme 󰄛

vim.g.catppuccin_flavour = 'macchiato' 
require('catppuccin').setup()
vim.cmd('colorscheme catppuccin')
