return {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	version = "1.*",
	opts = {
		keymap = {
			preset = 'enter',
			['<Tab>'] = { 'select_next', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'fallback' },
		},
		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = true
				}
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
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
				"lsp",
				"path",
				"snippets"
			},
		},
		signature = {
			enabled = true,
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
