-- Recognize #!/usr/bin/env bun
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*",
	callback = function(args)
		local first_line = vim.fn.getline(1, args.buf)
		if first_line[1]:match("^#!.*bin/env bun") then
			vim.bo[args.buf].filetype = "typescript"
		end
	end,
})

-- Recognize Brewfile
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "Brewfile",
	callback = function(args)
		vim.bo[args.buf].filetype = "ruby"
	end,
})

-- Easy testing for neetcode zig files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.zig",
	callback = function()
		local file_path = vim.api.nvim_buf_get_name(0)
		if string.find(file_path, "neetcode") then
			vim.keymap.set("n", ",r", ":vertical terminal zig test %<CR>", { buffer = true })
		end
	end,
})

-- Remove [Process exit] after using tmux_sessionizer
vim.api.nvim_create_autocmd("TermClose", {
	pattern = { "*tmux_sessionizer", "*tmux_jump" },
	command = "bdelete!",
})
