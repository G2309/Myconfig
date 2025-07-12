local highlight = {
    "Rainbow1",
    "Rainbow2",
    "Rainbow3",
    "Rainbow4",
    "Rainbow5",
    "Rainbow6",
    "Rainbow7",
}

local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Rainbow1", { fg = "#ed8796" })
    vim.api.nvim_set_hl(0, "Rainbow2", { fg = "#eed49f" })
    vim.api.nvim_set_hl(0, "Rainbow3", { fg = "#a6da95" })
    vim.api.nvim_set_hl(0, "Rainbow4", { fg = "#8bd5ca" })
    vim.api.nvim_set_hl(0, "Rainbow5", { fg = "#8aadf4" })
    vim.api.nvim_set_hl(0, "Rainbow6", { fg = "#c6a0f6" })
    vim.api.nvim_set_hl(0, "Rainbow7", { fg = "#b8c0e0" })
end)

require("ibl").setup({
    indent = {
        highlight = highlight,
        char = '|',
    },
    exclude = {
        filetypes = { "help", "dashboard", "markdown", "txt", "lua" },
    },
    scope = {
        enabled = true,
    }
})

