return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
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
	config = function(_, opts)
		require("conform").setup(opts)
		vim.keymap.set("n", "<leader>bf", function()
			require("conform").format({
				lsp_fallback = true,
				timeout_ms = 1000,
			})
		end, {})
	end,
}
