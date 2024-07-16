return {
	-- A blazing fast and easy to configure Neovim statusline written in Lua.
	"nvim-lualine/lualine.nvim",
	version = "*",

	-- Load this during startup.
	lazy = false,
	priority = 500,

	opts = {
		options = {
			globalstatus = true,
			theme = "catppuccin",
		},
	},

	dependencies = {
		-- A lua fork of vim-devicons. This plugin provides
		-- the same icons as well as colors for each icon.
		"nvim-tree/nvim-web-devicons",
	},
}
