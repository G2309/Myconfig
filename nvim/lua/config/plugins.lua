-- plugins.lua

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- LSP (Language Server Protocol)
    use 'neovim/nvim-lspconfig' -- Basic LSP configurations
    use 'williamboman/mason.nvim' -- Manager for LSP servers, DAP servers, linters, and formatters
    use 'williamboman/mason-lspconfig.nvim' -- Bridges mason.nvim and nvim-lspconfig

    -- Autocomplete
    use 'hrsh7th/nvim-cmp' -- Completion engine plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer source for nvim-cmp
    use 'hrsh7th/cmp-path' -- Path source for nvim-cmp
    use 'hrsh7th/cmp-cmdline' -- Command-line source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'saadparwaiz1/cmp_luasnip' -- LuaSnip source for nvim-cmp

    -- File Explorer
    use 'kyazdani42/nvim-tree.lua' -- File explorer
    use 'kyazdani42/nvim-web-devicons' -- File icons for nvim-tree

    -- Fuzzy Finder/Search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} } -- Utility functions needed by telescope.nvim
    }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Colorscheme
    use {
        'catppuccin/nvim',
        as = 'catppuccin' -- Catppuccin color scheme for Neovim
    }

	-- Colorizer
	 use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({
            RGB = true,  
            RRGGBBAA = true,  
            names = true,  
            css = true, 
            mode = 'foreground',
        })
        end
    }

end)

