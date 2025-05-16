return {
    {
        "williamboman/mason.nvim",
        lazy = false,

        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.ruff.setup({
                capabilities = capabilities,
            })
            lspconfig.basedpyright.setup({
                capabilities = capabilities,
                settings = {
                    basedpyright = {
                        disableOrganizeImports = true,
                        analysis = {
                            typeCheckingMode = "off",
                            diagnosticSeverityOverrides = {
                                reportUnusedImport = "none",
                                reportUnusedVariable = "none",
                                reportUndefinedVariable = "none",
                                reportGeneralTypeIssues = "none",
                                reportOptionalSubscript = "none",
                            },
                        },
                    },
                },
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.texlab.setup({
                capabilities = capabilities,
            })
            lspconfig.marksman.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

            vim.diagnostic.config({
                virtual_text = {
                    spacing = 2,
                },
                signs = false,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {})
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {})
            vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, {})
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {})
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {})
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {})
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, {})
            vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, {})
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, {})
            vim.keymap.set("n", "<leader>vc", function()
                vim.diagnostic.config({
                    virtual_text = false,
                    signs = false,
                    underline = false,
                })
            end, {})
            vim.keymap.set("n", "<leader>vs", function()
                vim.diagnostic.config({
                    virtual_text = {
                        spacing = 2,
                    },
                    signs = false,
                    underline = true,
                    update_in_insert = false,
                    severity_sort = true,
                })
            end, {})

            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {})
        end,
    },
}
