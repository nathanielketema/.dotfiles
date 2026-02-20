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
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			tex = { "tex-fmt" },
			json = { "jq" },
			html = { "superhtml" },
			markdown = { "prettier" },
			sh = { "shfmt" },
			sql = { "sqruff" },
			yml = { "yq" },
			zig = { "zigfmt" },
		},
		formatters = {
			prettier = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
					return {
						"prettier",
						prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
					}
				end
				return { "prettier" }
			end,
		},
	},
}
