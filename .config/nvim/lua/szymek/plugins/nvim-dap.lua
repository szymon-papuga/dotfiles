return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = { "/Users/szymon_papuga/projects/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}

		for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		local keymap = vim.keymap
		local widgets = require("dap.ui.widgets")
		local my_sidebar = widgets.sidebar(widgets.scopes)

		keymap.set("n", "<F5>", function()
			dap.continue()
		end)
		keymap.set("n", "<leader>dt", function()
			dap.terminate()
		end)
		keymap.set("n", "<F9>", function()
			dap.step_over()
		end)
		keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		keymap.set("n", "<Leader>bc", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)
		keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)
		keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)
		keymap.set("n", "<Leader>ds", function()
			my_sidebar.toggle()
		end)
	end,
}
