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

-- <TODO>
-- Easy testing for neetcode zig files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.zig",
	callback = function()
		local filepath = vim.fn.expand("%:p")
		local neetcode_dir = vim.fn.expand("$HOME") .. "/personal/neetcode"
		if vim.startswith(filepath, neetcode_dir) then
			vim.keymap.set("n", ",r", ":vertical terminal<CR>izig test %<CR>", { buffer = true, desc = "Run zig test" })
		end
	end,
})

-- Remove [Process exit] after using tmux_sessionizer
vim.api.nvim_create_autocmd("TermClose", {
	pattern = "*tmux_sessionizer",
	command = "bdelete!",
})
