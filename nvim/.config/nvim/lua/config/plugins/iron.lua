return {
	"https://github.com/Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")
		local common = require("iron.fts.common")

		iron.setup({
			config = {
				repl_definition = {
					elm = {
						command = { "elm", "repl" },
					},
					python = {
						command = { "uv", "run", "python3" },
						format = common.bracketed_paste_python,
						block_dividers = { "# %%", "#%%" },
						env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
					},
				},
				repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
			},
			keymaps = {
				send_motion = "<leader>sc",
				visual_send = "<leader>sc",
				send_line = "<leader>sl",
			},
		})

		vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<cr>", { desc = "Start REPL" })
	end,
}
