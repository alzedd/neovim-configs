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

-- LSP
map("n", "gd", ":lua vim.lsp.buf.implementation()<CR>", opt)
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opt)

-- whichkey shortcuts
return {
	{ "<leader>L",  group = "LSP",                                      nowait = true,                  remap = false },
	{ "<leader>LI", "<cmd>LspInstallInfo<cr>",                          desc = "Installer Info",        nowait = true, remap = false },
	{ "<leader>LS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols",     nowait = true, remap = false },
	{ "<leader>La", "<cmd>lua vim.lsp.buf.code_action()<cr>",           desc = "Code Action",           nowait = true, remap = false },
	{ "<leader>Ld", "<cmd>Telescope diagnostics bufnr=0<cr>",           desc = "Document Diagnostics",  nowait = true, remap = false },
	{ "<leader>Lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>",      desc = "Format",                nowait = true, remap = false },
	{ "<leader>Li", "<cmd>LspInfo<cr>",                                 desc = "Info",                  nowait = true, remap = false },
	{ "<leader>Lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",      desc = "Next Diagnostic",       nowait = true, remap = false },
	{ "<leader>Lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",      desc = "Prev Diagnostic",       nowait = true, remap = false },
	{ "<leader>Ll", "<cmd>lua vim.lsp.codelens.run()<cr>",              desc = "CodeLens Action",       nowait = true, remap = false },
	{ "<leader>Lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",         desc = "Quickfix",              nowait = true, remap = false },
	{ "<leader>Lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                desc = "Rename",                nowait = true, remap = false },
	{ "<leader>Ls", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Document Symbols",      nowait = true, remap = false },
	{ "<leader>Lw", "<cmd>Telescope diagnostics<cr>",                   desc = "Workspace Diagnostics", nowait = true, remap = false },
}
