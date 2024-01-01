local M = {}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = { "lua", "php", "markdown", "markdown_inline", "bash", "php", "javascript", "typescript" }, -- put the language you want in this array
		sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)

		highlight = {
			enable = true, -- false will disable the whole extension
		},

		autopairs = {
			enable = true,
		},

		indent = {
			enable = true,
			disable = { "python" },
		},

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M.config()
