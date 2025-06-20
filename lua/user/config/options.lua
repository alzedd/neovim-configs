local o = vim.o
local g = vim.g

vim.loader.enable()

-- global options
g.mapleader = ","
o.swapfile = false
o.dir = "/tmp"
o.smartcase = false
o.laststatus = 2
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.mouse = "a"
o.hidden = true
o.history = 5000
o.tabstop = 4
o.shiftwidth = o.tabstop
o.signcolumn = "yes"
o.foldmethod = "indent"
o.foldlevel = 10
o.cmdheight = 0
o.conceallevel = 0

o.splitbelow = true
o.splitright = true

o.termguicolors = true
-- Line Numbers
o.number = true
o.relativenumber = true

-- Don't show any numbers inside terminals
vim.cmd([[ au TermOpen term://* setlocal nonumber norelativenumber ]])

-- Don't show status line on certain windows
vim.cmd([[ au TermOpen term://* setfiletype terminal ]])

-- Don't show ~ ever again
vim.cmd([[ let &fcs='eob: ']])

-- isKeyword
vim.cmd([[ set isk-=_]])
vim.cmd([[ set cursorline]])

function Hide_statusline()
	local hidden = { "NvimTree", "terminal" }
	local shown = {}
	local api = vim.api
	local buftype = api.nvim_buf_get_option("%", "ft")

	-- shown table from config has the highest priority
	if vim.tbl_contains(shown, buftype) then
		api.nvim_set_option("laststatus", 2)
		return
	end

	if vim.tbl_contains(hidden, buftype) then
		api.nvim_set_option("laststatus", 0)
		return
	else
		api.nvim_set_option("laststatus", 2)
	end
end

g.tpipeline_autoembed = 0
