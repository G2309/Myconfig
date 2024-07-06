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
require('config.nvimtree')
--  Telescope setup 
require('config.telescope')
-- Colorizer
require('colorizer').setup()
--   Keybindings 
require('config.keybindings')
--  Lualine 
require('config.lualine')
-- 󰄛 Dashboard 󰄛
require('config.dashboard-config')

-- 󰄛 Nvim Theme 󰄛
vim.g.catppuccin_flavour = 'macchiato' 
require('catppuccin').setup()
vim.cmd('colorscheme catppuccin')
