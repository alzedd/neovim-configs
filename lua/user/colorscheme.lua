-- require("ayu").setup({
-- 	mirage = false,
-- 	overrides = {
-- 		Comment = { fg = "Gray40" },
-- 		LineNr = { fg = "Gray40" },
-- 	},
-- })

local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
