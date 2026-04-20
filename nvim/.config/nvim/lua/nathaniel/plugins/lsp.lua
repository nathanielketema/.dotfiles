return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"biome",
					"clang-format",
					"clangd",
					"codelldb",
					"jq",
					"lua_ls",
					"marksman",
					"prettier",
					"pyrefly",
					"ruff",
					"stylua",
					"superhtml",
					"svelte-language-server",
					"tex-fmt",
					"texlab",
					"textlint",
					"ts_ls",
					"ty",
					"unocss-language-server",
                    "yq",
                    "zigfmt",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = { spacing = 2 },
				signs = false,
				underline = false,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.lsp.enable("zls")

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim", "require" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			vim.lsp.config("unocss", {
				filetypes = {
					"markdown",
				},
				root_markers = { "slides.md" },
			})

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
			vim.keymap.set("n", ",.", function()
				vim.cmd.vsplit()
				vim.lsp.buf.definition()
			end, {})
		end,
	},
}
