-- Treesitter configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "rust", "javascript" },
  highlight = { enable = true },
  indent = {enable = true},
})

