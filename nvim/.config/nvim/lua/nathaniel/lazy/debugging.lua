return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
		},
		ft = { "python", "zig" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			local python_path = "/opt/homebrew/bin/python3"
			require("dap-python").setup(python_path)
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					args = { "--port", "${port}" },
				},
			}
			vim.g.dap_virtual_text = true
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
				{
					name = "Launch (stop on entry)",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = true,
					args = function()
						local args_string = vim.fn.input("Arguments: ")
						return vim.split(args_string, " +")
					end,
				},
			}

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

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
