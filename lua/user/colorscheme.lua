-- require("ayu").setup({
-- 	mirage = false,
-- 	overrides = {
-- 		Comment = { fg = "Gray40" },
-- 		LineNr = { fg = "Gray40" },
-- 	},
-- })

-- require("gruvbox").setup({
-- 	terminal_colors = true, -- add neovim terminal colors
-- 	undercurl = true,
-- 	underline = true,
-- 	bold = true,
-- 	italic = {
-- 		strings = true,
-- 		emphasis = true,
-- 		comments = true,
-- 		operators = false,
-- 		folds = true,
-- 	},
-- 	strikethrough = true,
-- 	invert_selection = false,
-- 	invert_signs = false,
-- 	invert_tabline = false,
-- 	invert_intend_guides = false,
-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
-- 	contrast = "", -- can be "hard", "soft" or empty string
-- 	palette_overrides = {},
-- 	overrides = {},
-- 	dim_inactive = false,
-- 	transparent_mode = false,
-- })

-- require("github-theme").setup({
-- 	options = {
-- 		darken = {
-- 			sidebars = {
-- 				enable = true,
-- 				list = { "nvim-tree" },
-- 			},
-- 		},
-- 	},
-- })
local colorscheme = "nordic"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
