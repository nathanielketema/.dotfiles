return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            "theHamsta/nvim-dap-virtual-text",
        },
        ft = { "python", "zig" },
        opts = {
            python_path = "python3",
            codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")

            require("nvim-dap-virtual-text").setup({})
            dapui.setup()

            --- 1. Python Setup ---
            require("dap-python").setup(opts.python_path)

            --- 2. Zig / LLDB Setup ---
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = opts.codelldb_path,
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.zig = {
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
                {
                    name = "Launch (with args)",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = function()
                        local args_string = vim.fn.input("Arguments: ")
                        return vim.split(args_string, " +")
                    end,
                },
            }

            --- 3. UI Listeners ---
            -- Automatically open UI when debugging starts
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            --- 4. Keymaps ---
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
            vim.keymap.set("n", "<leader>ds", dap.step_into, { desc = "DAP Step Into" })
            vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "DAP Step Over" })
            vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "DAP Step Out" })
            vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "DAP Restart" })
            vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP Terminate" })
            vim.keymap.set("n", "<leader>dq", dap.close, { desc = "DAP Close Session" })
        end,
    },
}
