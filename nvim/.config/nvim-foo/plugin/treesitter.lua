require("nvim-treesitter")
	.install({
		"cpp",
		"css",
		"html",
		"javascript",
		"json",
        "lua",
		"python",
		"typescript",
		"zig",
	})
	:wait(300000)

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
