require('nvim-tree').setup{
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = true,
	hijack_cursor = false,
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {}
	},
	view = {
		width = 30,
		side = 'right',
	}
}
