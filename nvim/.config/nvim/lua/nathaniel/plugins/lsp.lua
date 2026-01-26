return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"clang-format",
				"jq",
				"prettier",
				"ruff",
				"shfmt",
				"sqruff",
				"stylua",
				"superhtml",
				"tex-fmt",
				"textlint",
				"yq",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		opts = {
			servers = {
				ruff = {},
				clangd = {},
				cssls = {},
				jsonls = {},
				marksman = {},
				yamlls = {},
				superhtml = {},
                pyrefly = {},
				texlab = {},
				zls = {
					settings = {
						filetypes = { "zig", "zir", "zon" },
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				},
			},
		},
		config = function(_, opts)
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for server_name, server_opts in pairs(opts.servers) do
				server_opts.capabilities = vim.tbl_deep_extend("force", capabilities, server_opts.capabilities or {})

				vim.lsp.config(server_name, server_opts)
				vim.lsp.enable(server_name)
			end

			vim.diagnostic.config({
				virtual_text = { spacing = 2 },
				signs = false,
				underline = false,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local map_opts = { buffer = ev.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, map_opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, map_opts)
					vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, map_opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, map_opts)
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, map_opts)
				end,
			})

			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)

			vim.keymap.set("n", "<leader>vc", function()
				vim.diagnostic.enable(false)
			end, { desc = "Hide Diagnostics" })
			vim.keymap.set("n", "<leader>vs", function()
				vim.diagnostic.enable(true)
			end, { desc = "Show Diagnostics" })
		end,
	},
}
