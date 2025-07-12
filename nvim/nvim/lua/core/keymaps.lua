local map = vim.api.nvim_set_keymap

-- Función para configurar los keybindings
local function setup_keybindings()
  -- Keybindings para Telescope
  map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
  map('n', '<leader>lg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
  map('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { noremap = true, silent = true })
  map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { noremap = true, silent = true })
  map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { noremap = true, silent = true })

  -- Keybindings para Nvim-Tree
  map('n', '<leader>nt', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
  map('n', '<leader>no', '<cmd>NvimTreeOpen<cr>', { noremap = true, silent = true })
  map('n', '<leader>nn', '<cmd>NvimTreeClose<cr>', { noremap = true, silent = true })
  map('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>', { noremap = true, silent = true })
end

setup_keybindings()

return {
  setup_keybindings = setup_keybindings
}

