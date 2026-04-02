require("neogit").setup({
	disable_hint = true,
	disable_context_highlighting = true,
	disable_line_numbers = false,
	disable_relative_line_numbers = false,
	signs = {
		-- { CLOSED, OPENED }
		hunk = { "", "" },
		item = { "▶︎", "▼" },
		section = { "▶︎", "▼" },
	},
})

vim.keymap.set("n", "<leader>gs", function()
	require("neogit").open({ kind = "auto" })
end, {})

vim.keymap.set("n", "<leader>gt", function()
	require("neogit").open({ kind = "tab" })
end, {})
