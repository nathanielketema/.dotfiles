return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '1.*',

    opts = {
        keymap = { preset = 'default' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        snippets = {
            preset = 'default',
        },

        completion = {
            menu = { border = 'rounded' },
            documentation = {
                window = { border = 'rounded' },
                auto_show = true
            },
            ghost_text = { enabled = true }
        },

        signature = {
            enabled = true,
            window = { border = 'rounded' }
        },

        fuzzy = {
            implementation = "prefer_rust",
        }
    },
}
