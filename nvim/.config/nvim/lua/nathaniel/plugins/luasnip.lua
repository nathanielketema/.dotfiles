return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip").setup({})
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_snipmate").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/snippets" },
			override_priority = 2000,
		})
	end,
}
