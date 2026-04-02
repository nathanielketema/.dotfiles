vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local map_opts = { buffer = ev.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, map_opts)
		vim.keymap.set("n", ",.", function()
			vim.cmd.vsplit()
			vim.lsp.buf.definition()
		end, map_opts)
	end,
})

vim.diagnostic.config({
	virtual_text = { spacing = 2 },
	signs = false,
	underline = false,
	update_in_insert = false,
	severity_sort = true,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
