-- config/telescope.lua

local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<esc>"] = actions.close,
            },
            n = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
            },
        },
		file_ignore_patterns = {".git","node_modules","yay"},
    },
    pickers = {
        find_files = {
            theme = "dropdown",
			hidden = true,
        },
		live_grep = {
			theme = "dropdown",
		}
    },
    extensions = {
		fzf = {
            fuzzy = true,                    -- Fuzzy matching
            override_generic_sorter = true,  -- Override the generic sorter
            override_file_sorter = true,     -- Override the file sorter
            case_mode = "smart_case",        -- Case mode: "smart_case", "ignore_case", "respect_case"
        }
    },
}


