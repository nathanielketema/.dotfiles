return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = false,
			handlers = {},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"ts_ls",
				"ruff",
				"html",
				"lua_ls",
				"clangd",
				"csharp_ls",
				"cssls",
				"jsonls",
				"marksman",
				"ty",
				"yamlls",
				"zls",
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
			end

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end

			vim.diagnostic.config({
				virtual_text = {
					spacing = 2,
				},
				signs = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("CustomLspAttach", { clear = true }),
				callback = function(args)
					local buf = args.buf

					local opts = { buffer = buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
				end,
			})

			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})

			vim.keymap.set("n", "<leader>vc", function()
				vim.diagnostic.config({
					virtual_text = false,
					signs = false,
					underline = false,
				})
			end, {})
			vim.keymap.set("n", "<leader>vs", function()
				vim.diagnostic.config({
					virtual_text = { spacing = 2 },
					signs = false,
					underline = true,
					update_in_insert = false,
					severity_sort = true,
					float = {
						border = "rounded",
						max_width = 80,
						max_height = 20,
					},
				})
			end, {})
		end,
	},
}
