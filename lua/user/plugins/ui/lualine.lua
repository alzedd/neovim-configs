return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = {
					{
						"branch",
						icons_enabled = true,
						icon = "",
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn" },
						symbols = { error = " ", warn = " " },
						colored = false,
						update_in_insert = false,
						always_visible = true,
					}
				},
				lualine_b = {
					{
						"mode",
						fmt = function(str)
							return "-- " .. str .. " --"
						end,
					} 
				},
				lualine_c = {},
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				-- lualine_x = { diff, spaces, "encoding", filetype },
				lualine_y = {
					{
						"location",
						padding = 0
					}
				},
				 lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {
					{
						"location",
						padding = 0
					}
				},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})

	end
}
