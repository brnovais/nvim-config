return {
	{
		-- Neovim plugin to manage the file system and other tree like structures.
		"nvim-neo-tree/neo-tree.nvim",
		name = "neo-tree",
		version = "^3.26",

		-- Lazy-loaded plugin.
		lazy = true,
		cmd = "Neotree",
		keys = {
			{ "<leader>t", "<cmd>Neotree toggle<cr>", desc = "Neo[T]ree toggle" },
		},

		dependencies = {
			--  All the lua functions I don't want to write twice.
			"nvim-lua/plenary.nvim",

			-- UI Component Library for Neovim.
			"MunifTanjim/nui.nvim",

			-- A lua fork of vim-devicons. This plugin provides
			-- the same icons as well as colors for each icon.
			"nvim-tree/nvim-web-devicons",
		},
	},
}
