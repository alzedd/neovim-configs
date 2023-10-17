local function nvim_map(mode, from, to, opts)
	vim.api.nvim_set_keymap(mode, from, to, opts)
end

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}


-- Splits Management
map("n", "<Tab>", ":bn<CR>", opt)
map("n", "<S-Tab>", ":bp<CR>", opt)
map("n", "q", ":Bdelete<CR>", opt)

return {}

