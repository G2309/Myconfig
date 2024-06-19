
-- Vim config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.hidden = true

-- Plugin setup

require('plugins')

-- LSP config
--local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {}
    end
}

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
    }
})

-- nvim-tree setup
require('nvim-tree').setup()

-- Telescope setup
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = require('telescope.actions').move_selection_next,
                ["<C-p>"] = require('telescope.actions').move_selection_previous,
            },
        },
    }
}

-- Catppuccin colorscheme setup
vim.g.catppuccin_flavour = 'mocha' 
require('catppuccin').setup()
vim.cmd('colorscheme catppuccin')
