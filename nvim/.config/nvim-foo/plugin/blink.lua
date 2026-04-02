require("blink.cmp").setup({
	keymap = { preset = "default" },

	appearance = {
		nerd_font_variant = "mono",
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	snippets = {
		preset = "default",
	},

	completion = {
		menu = { border = "rounded" },
		documentation = {
			window = { border = "rounded" },
			auto_show = true,
		},
		ghost_text = { enabled = true },
	},

	signature = {
		enabled = true,
		window = { border = "rounded" },
	},

	fuzzy = {
		implementation = "prefer_rust",
	},
})
