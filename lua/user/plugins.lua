local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- UTILS FUNCS
	"nvim-lua/plenary.nvim",

	-- AUTO PAIR BRACKETS
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- BETTER COMMENTS
	"numToStr/Comment.nvim",

	-- PROJECT ROOT SELECTION
	"ahmedkhalf/project.nvim",

	-- TELESCOPE (FUZZY FINDER)
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	-- INDENT GUIDES
	"lukas-reineke/indent-blankline.nvim",

	"kyazdani42/nvim-web-devicons",

	-- DELETE BUFFERS NOT SPLITS
	"moll/vim-bbye",

	-- BUFFERLINE + TABS LINE
	"akinsho/bufferline.nvim",
	"nvim-lualine/lualine.nvim",

	-- FILE EXPLORER
	"nvim-tree/nvim-tree.lua",

	-- Home Page
	"goolord/alpha-nvim",

	-- TERMINAL
	"akinsho/toggleterm.nvim",

	-- TREESITTER
	"nvim-treesitter/nvim-treesitter",

	-- GIT
	"lewis6991/gitsigns.nvim",

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"RRethy/vim-illuminate",

	-- CMP
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- SNIPPETS
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- Shortcut handler
	"folke/which-key.nvim",

	-- COLORSCHEMES
	"Shatur/neovim-ayu",
	"folke/tokyonight.nvim",
	"ellisonleao/gruvbox.nvim",
	"catppuccin/nvim",
	"EdenEast/nightfox.nvim",
	"loctvl842/monokai-pro.nvim",
})
