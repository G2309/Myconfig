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
	},
	{
  		"MunifTanjim/nui.nvim"
	},
	{
   		"amitds1997/remote-nvim.nvim",
   		version = "*", 
   		dependencies = {
       		"nvim-lua/plenary.nvim", -- For standard functions
       		"MunifTanjim/nui.nvim", -- To build the plugin UI
       		"nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
   		},
   		config = true,
	},


})
