require("lazy").setup({
	{ "neovim/nvim-lspconfig" },	-- LSP
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end
	},	--Treesitter
	{ "nvim-lua/plenary.nvim"},	-- Plenary
	{ "nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"} },	-- Telescope
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },	-- Theme
	
	{ "nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.nvimtree")
		end
	},
	
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, 
		config = function()
			require("plugins.indent")
		end
	},

	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons',}, 
		config = function()
			require("plugins.lualine")
		end
	},

	{'nvimdev/dashboard-nvim', event = 'VimEnter', dependencies = { {'nvim-tree/nvim-web-devicons'}},
		config = function()
    		require('plugins.dashboard')
  		end	
	},
	{  'IogaMaster/neocord', event = "VeryLazy",
		config = function()
			require("plugins.discord")
		end
	}
})
