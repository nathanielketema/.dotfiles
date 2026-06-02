local set = vim.opt_local

set.makeprg = "zig build run -fincremental --watch"

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.cmd("wincmd L")
	end,
})
