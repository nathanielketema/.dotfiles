require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"biome",
		"clang-format",
		"jq",
		"ruff",
		"stylua",
		"superhtml",
		"tex-fmt",
		"textlint",
		"ts_ls",
		"yq",
		"zls",
	},
})
