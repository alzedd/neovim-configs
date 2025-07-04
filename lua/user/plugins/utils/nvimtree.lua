return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local nvt = require('nvim-tree')
		-- local tree_cb = nvim_tree_config.nvim_tree_callback

		nvt.setup {
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			hijack_directories = {
				enable = true
			},
			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 30,
				side = "left",
				-- mappings = {
				-- 	list = {
						-- { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
						-- { key = "h", cb = tree_cb "close_node" },
						-- { key = "v", cb = tree_cb "vsplit" },
					-- },
				-- },
			},
		}
	end
}
