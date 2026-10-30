-- Recognize Brewfile
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "Brewfile",
	callback = function(args)
		vim.bo[args.buf].filetype = "ruby"
	end,
})

-- Remove [Process exit] after using tmux_sessionizer
vim.api.nvim_create_autocmd("TermClose", {
	pattern = { "*tmux_sessionizer", "*tmux_jump" },
	command = "bdelete!",
})
