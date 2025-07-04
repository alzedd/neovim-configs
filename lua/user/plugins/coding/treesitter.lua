return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local treesitter = require("nvim-treesitter")
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			sync_install = true, 
			highlight = { enable = true },
			autopairs = { enable = true },

			indent = {
				enable = true,
				disable = { "python" },
			},

			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},

			ensure_installed = {
				"lua",
				"php",
				"markdown",
				"markdown_inline",
				"bash",
				"php",
				"javascript",
				"typescript"
			},
		})
	end
}

