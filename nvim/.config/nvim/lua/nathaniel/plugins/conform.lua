return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_organize_imports" },
            javascript = { "prettier" },
            tex = { "tex-fmt" },
            json = { "jq" },
            html = { "superhtml" },
            markdown = { "markdownfmt" },
            sh = { "shellcheck" },
            sql = { "sqruff" },
            typescript = { "prettier" },
            yml = { "yq" },
            zig = { "zigfmt" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },

        vim.keymap.set("n", "<leader>bf", function()
            require("conform").format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, {}),
    },
}
