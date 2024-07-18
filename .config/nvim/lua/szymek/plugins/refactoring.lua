return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local refactoring = require("refactoring")
		refactoring.setup()

		vim.keymap.set("x", "<leader>ev", function()
			refactoring.refactor("Extract Variable")
		end)
		-- Extract variable supports only visual mode
		vim.keymap.set({ "n", "x" }, "<leader>iv", function()
			refactoring.refactor("Inline Variable")
		end)
		-- Inline var supports both normal and visual mode
		vim.keymap.set("x", "<leader>ef", function()
			refactoring.refactor("Extract Function")
		end)
		-- Extract function supports only visual mode
		vim.keymap.set("n", "<leader>if", function()
			refactoring.refactor("Inline Function")
		end)
		-- Inline func supports only normal
	end,
}
