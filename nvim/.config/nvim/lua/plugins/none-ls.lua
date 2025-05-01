return {
    "nvimtools/none-ls.nvim",

    config = function()
        local null_ls = require("null-ls")
        local helpers = require("null-ls.helpers")

        -- Define tex-fmt as a custom formatter
        local tex_fmt = {
            name = "tex-fmt",
            method = null_ls.methods.FORMATTING,
            filetypes = { "tex", "plaintex"},
            generator = helpers.formatter_factory({
                command = "tex-fmt",
                args = { "--stdin" },
                to_stdin = true,
            }),
        }

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.csharpier,
                tex_fmt, -- Add tex-fmt manually
            },
        })

        vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})
    end,
}
