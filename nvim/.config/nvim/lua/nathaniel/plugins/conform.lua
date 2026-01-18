return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({
					lsp_fallback = true,
					timeout_ms = 1000,
				})
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			tex = { "tex-fmt" },
			json = { "jq" },
			html = { "superhtml" },
			markdown = { "prettier" },
			sh = { "shfmt" },
			sql = { "sqruff" },
			yml = { "yq" },
			zig = { "zigfmt" },
		},
	},
}
