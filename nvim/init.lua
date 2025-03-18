vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Core settings
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Plugin manager
require("plugins")

-- Theme
vim.cmd.colorscheme("catppuccin")
