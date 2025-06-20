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


-- Buffer management
map("n", "<Tab>", ":bn<CR>", opt)
map("n", "<S-Tab>", ":bp<CR>", opt)
map("n", "q", ":Bdelete<CR>", opt)

-- Splits Management
map("n", "<leader>v", ":vsplit<CR>", opt)
map("n", "<leader>s", ":split<CR>", opt)
map("n", "<leader>wq", ":bd<CR>", opt)

-- Quick Shortcuts
map("n", "<leader>b", ":Telescope buffers<CR>", opt)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)
map("n", "<leader>o", ":Telescope lsp_document_symbols<CR>", opt)


return {}

