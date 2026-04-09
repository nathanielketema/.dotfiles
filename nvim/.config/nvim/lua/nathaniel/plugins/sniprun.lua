return {
	"michaelb/sniprun",
	branch = "master",
	build = "sh install.sh",

	config = function()
		require("sniprun").setup()
		vim.keymap.set("v", "<leader>sr", ":SnipRun<CR>", {})
		vim.keymap.set("n", "<leader>sr", ":SnipRun<CR>", {})
	end,
}
