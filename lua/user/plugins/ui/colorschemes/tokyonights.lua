return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
		local theme = require('tokyonight').setup({
			 style = "night",
		})
  	
		vim.cmd[[colorscheme tokyonight]]
  end,
}
