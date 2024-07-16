return {
	-- Soothing pastel theme for (Neo)vim.
	"catppuccin/nvim",
	name = "catppuccin",
	version = "^1.7.0",

	-- Load this before all the other start plugins.
	lazy = false,
	priority = 1000,

	config = function()
		-- Load the colorscheme after the plugin is loaded.
		vim.cmd([[colorscheme catppuccin]])
	end,
}
