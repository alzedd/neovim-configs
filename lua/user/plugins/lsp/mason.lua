local servers = {
	'lua_ls',
	"ts_ls",
	"bashls",
	"jsonls",
	"yamlls",
	"phpactor",
}

local masonSettings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

return {
	'saghen/blink.cmp',
	opts = {
		completion = {
			documentation = {
				auto_show = true,
				window = {
					border = "bold",
				},
			},
			menu = {
				border = "bold",
				scrollbar = false,
			},
			ghost_text = {
				enabled = true,
			},
		},
		sources = {
			default = {
				'lsp',
				'path',
				'snippets',
			},
		},
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},

	opts_extend = { 'sources.default' },

	dependencies = {
		{
			{
				"williamboman/mason.nvim",
				dependencies = {
					"neovim/nvim-lspconfig",
					"williamboman/mason-lspconfig.nvim",
				},
				config = function()
					require("mason").setup(masonSettings)
					require("mason-lspconfig").setup({
						ensure_installed = servers,
						automatic_installation = true,
					})
				end
			},
		},
	}
}
