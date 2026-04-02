require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format", "ruff_organize_imports" },
		javascript = { "biome" },
		typescript = { "biome" },
		tex = { "tex-fmt" },
		json = { "jq" },
		html = { "superhtml" },
		markdown = { "prettier" },
		sh = { "shfmt" },
		sql = { "sqruff" },
		yml = { "yq" },
		zig = { "zigfmt" },
	},
})

vim.keymap.set("n", "<leader>bf", function()
	require("conform").format({
		lsp_fallback = true,
		timeout_ms = 1000,
	})
end, {})
