local set = vim.opt_local

local build_zig = vim.fn.findfile("build.zig", ".;", 1)

if build_zig == "" then
	set.makeprg = "zig run %"

	vim.keymap.set("n", ",v", function()
		vim.cmd("Brun zig run " .. vim.fn.expand("%"))
		vim.cmd("wincmd L")
		vim.api.nvim_win_resize(0, 90, -1)
	end)
	vim.keymap.set("n", ",s", function()
		vim.cmd("Brun zig run " .. vim.fn.expand("%"))
		vim.api.nvim_win_resize(0, -1, 25)
	end)
else
	set.makeprg = "zig build"

	vim.keymap.set("n", ",v", function()
		vim.cmd("Brun zig build run --watch -fincremental --error-style verbose_clear")
		vim.cmd("wincmd L")
		vim.api.nvim_win_resize(0, 90, -1)
	end)
	vim.keymap.set("n", ",s", function()
		vim.cmd("Brun zig build run")
		vim.api.nvim_win_resize(0, -1, 25)
	end)
end
