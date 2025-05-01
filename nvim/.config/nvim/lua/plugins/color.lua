return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},

		config = function()
			vim.g.tokyonight_transparent_sidebar = true
			vim.g.tokyonight_transparent = true
			vim.opt.background = "dark"
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
