return {
	-- Create key bindings that stick. WhichKey is a lua plugin for
	-- Neovim 0.5 that displays a popup with possible keybindings
	-- of the command you started typing.
	"folke/which-key.nvim",
	version = "^3.5.0",

	-- Lazy-loaded plugin.
	lazy = true,
	event = "VeryLazy",

	opts = {},

	init = function()
		-- Displays which-key popup sooner.
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
}
