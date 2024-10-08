return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-jest"),
			},
		})

		local keymap = vim.keymap
		local run = neotest.run
		local summary = neotest.summary

		keymap.set("n", "<leader>tn", function()
			run.run()
			summary.open()
		end, { desc = "run nearest test" })

		keymap.set("n", "<leader>tf", function()
			run.run(vim.fn.expand("%"))
			summary.open()
		end, { desc = "run the current test file" })

		keymap.set("n", "<leader>tl", function()
			run.run_last()
		end, { desc = "run last test" })

		keymap.set("n", "<leader>tw", function()
			neotest.watch.toggle()
		end, { desc = "toggle test watch mode" })

		keymap.set("n", "<leader>twf", function()
			neotest.watch.toggle(vim.fn.expand("%"))
		end, { desc = "toggle test watch mode for current file" })

		keymap.set("n", "<leader>ts", function()
			summary.toggle()
		end, { desc = "toggle test summary" })
	end,
}
