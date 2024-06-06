return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					separator = true,
				},
			},
			diagnostics = "nvim_lsp",
		},
	},
}
