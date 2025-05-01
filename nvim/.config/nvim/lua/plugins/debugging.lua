return {
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",

        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local path = "/opt/homebrew/bin/python3"

            require("dap-python").setup(path)
            require("dapui").setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<leader>dc", dap.continue, {})
            vim.keymap.set("n", "<leader>ds", dap.step_into, {})
            vim.keymap.set("n", "<leader>dn", dap.step_over, {})
            vim.keymap.set("n", "<leader>do", dap.step_out, {})
        end,
    },
}
