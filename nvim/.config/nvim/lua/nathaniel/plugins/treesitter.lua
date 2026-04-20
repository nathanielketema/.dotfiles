return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"bash",
			"bibtex",
			"cpp",
			"css",
			"html",
			"javascript",
			"json",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
			"zig",
		}

		require("nvim-treesitter")
			.install(parsers)
			:wait(300000)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"sh",
				"bib",
				"cpp",
				"css",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"jsonc",
				"lua",
				"markdown",
				"plaintex",
				"python",
				"tex",
				"typescript",
				"typescriptreact",
				"vim",
				"yaml",
				"zig",
			},
			callback = function(args)
				local parser_by_filetype = {
					bib = "bibtex",
					plaintex = "latex",
					tex = "latex",
				}

				vim.schedule(function()
					if not vim.api.nvim_buf_is_valid(args.buf) then
						return
					end

					vim.treesitter.start(args.buf, parser_by_filetype[vim.bo[args.buf].filetype])
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					vim.api.nvim_set_option_value("foldexpr", "v:lua.vim.treesitter.foldexpr()", { win = 0 })
					vim.api.nvim_set_option_value("foldmethod", "expr", { win = 0 })
				end)
			end,
		})
	end,
}
