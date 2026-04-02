return {
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	opts = {
		autoFold = {
			enabled = false,
			kinds = { "comment", "imports" },
		},
	},

    init = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end,

}
