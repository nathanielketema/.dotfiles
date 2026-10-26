return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mason-org/mason.nvim",
		{
			"igorlfs/nvim-dap-view",
			version = "1.*",
			opts = {
				auto_toggle = true,
				winbar = {
					default_section = "scopes",
					controls = { enabled = true },
				},
				windows = {
					size = 0.5,
					position = "right",
					terminal = {
						size = 0.25,
						position = "below",
						hide = {},
					},
				},
			},
		},
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	opts = {
		python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
		codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		js_debug_path = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
		zig_pretty_printers = "~/misc/random/lldb_pretty_printers.py",
	},
	config = function(_, opts)
		local dap = require("dap")
		local view = require("dap-view")
		local utils = require("dap.utils")

		require("nvim-dap-virtual-text").setup({})
		require("dap-python").setup(opts.python_path, { console = "integratedTerminal" })

		-- Zig, C, and C++
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = opts.codelldb_path,
				args = { "--port", "${port}" },
			},
		}

		local zig_lldb_init = {}
		local printers = vim.fn.expand(opts.zig_pretty_printers)
		if vim.fn.filereadable(printers) == 1 then
			zig_lldb_init = {
				"command script import " .. vim.fn.shellescape(printers),
				"type category enable zig.lang",
				"type category enable zig.std",
				"type category enable zig.stage2",
				"type category enable zig",
			}
		end

		for _, filetype in ipairs({ "zig", "c", "cpp" }) do
			local function program()
				local dir = vim.fn.getcwd() .. (filetype == "zig" and "/zig-out/bin/" or "/")
				local path = vim.fn.input("Path to executable: ", dir, "file")
				return path ~= "" and vim.fn.expand(path) or dap.ABORT
			end
			local init_commands = filetype == "zig" and zig_lldb_init or {}
			dap.configurations[filetype] = {
				{
					name = "Launch executable",
					type = "codelldb",
					request = "launch",
					program = program,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					initCommands = init_commands,
				},
				{
					name = "Launch executable (with args)",
					type = "codelldb",
					request = "launch",
					program = program,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = function()
						return utils.splitstr(vim.fn.input("Arguments: "))
					end,
					initCommands = init_commands,
				},
				{
					name = "Attach to process",
					type = "codelldb",
					request = "attach",
					pid = utils.pick_process,
					cwd = "${workspaceFolder}",
					initCommands = init_commands,
				},
			}
		end

		-- JavaScript and TypeScript
		for _, adapter in ipairs({ "pwa-node", "pwa-chrome" }) do
			dap.adapters[adapter] = {
				type = "server",
				host = "127.0.0.1",
				port = "${port}",
				executable = {
					command = opts.js_debug_path,
					args = { "${port}", "127.0.0.1" },
				},
			}
		end
		-- Accept the common VS Code adapter names in project launch.json files.
		dap.adapters.node = dap.adapters["pwa-node"]
		dap.adapters.chrome = dap.adapters["pwa-chrome"]

		local browser = {
			{
				name = "Chrome: launch app URL",
				type = "pwa-chrome",
				request = "launch",
				url = function()
					return vim.fn.input("App URL: ", "http://localhost:3000")
				end,
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
			},
			{
				name = "Chrome: attach (port 9222)",
				type = "pwa-chrome",
				request = "attach",
				port = 9222,
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
			},
		}
		for _, filetype in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
			dap.configurations[filetype] = {
				{
					name = "Node: launch current file",
					type = "pwa-node",
					request = "launch",
					program = "${file}",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					sourceMaps = true,
					skipFiles = { "<node_internals>/**" },
				},
				{
					name = "Node: attach (port 9229)",
					type = "pwa-node",
					request = "attach",
					address = "127.0.0.1",
					port = 9229,
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					skipFiles = { "<node_internals>/**" },
				},
			}
			vim.list_extend(dap.configurations[filetype], vim.deepcopy(browser))
		end
		-- Elm has no standard source maps: use generated JS for DAP breakpoints.
		dap.configurations.elm = vim.deepcopy(browser)

		-- Keymaps
		local set = vim.keymap.set

		set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		set("n", "<leader>dB", function()
			vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
				if condition and vim.trim(condition) ~= "" then
					dap.set_breakpoint(condition)
				end
			end)
		end, { desc = "Conditional Breakpoint" })
		set("n", "<leader>dh", function()
			vim.ui.input({ prompt = "Hit condition: " }, function(condition)
				if condition and vim.trim(condition) ~= "" then
					dap.set_breakpoint(nil, condition)
				end
			end)
		end, { desc = "Hit-count Breakpoint" })
		set("n", "<leader>dl", function()
			vim.ui.input({ prompt = "Log message ({expression}): " }, function(message)
				if message and vim.trim(message) ~= "" then
					dap.set_breakpoint(nil, nil, message)
				end
			end)
		end, { desc = "Logpoint" })

		set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
		set("n", "<leader>ds", dap.step_into, { desc = "DAP Step Into" })
		set("n", "<leader>dn", dap.step_over, { desc = "DAP Step Over" })
		set("n", "<leader>do", dap.step_out, { desc = "DAP Step Out" })
		set("n", "<leader>dr", dap.restart, { desc = "DAP Restart" })
		set("n", "<leader>dt", dap.terminate, { desc = "DAP Terminate" })
		set("n", "<leader>dq", dap.disconnect, { desc = "DAP Disconnect" })
		set("n", "<leader>dL", dap.run_last, { desc = "DAP Run Last" })
		set("n", "<leader>du", view.toggle, { desc = "Toggle Debug View" })
		set({ "n", "x" }, "<leader>de", function()
			view.hover()
		end, { desc = "Evaluate Expression" })
		set({ "n", "x" }, "<leader>dw", function()
			view.add_expr()
		end, { desc = "Watch Expression" })
	end,
}
