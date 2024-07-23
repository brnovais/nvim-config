return {
	-- A lua powered greeter like vim-startify / dashboard-nvim.
	"goolord/alpha-nvim",
	version = "*",

	-- Load this during startup.
	lazy = false,
	priority = 900,

	opts = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			" ▄▄▄▄· ▄▄▄   ▐ ▄        ▌ ▐· ▄▄▄·    ▪  .▄▄ ·  ",
			" ▐█ ▀█▪▀▄ █·•█▌▐█▪     ▪█·█▌▐█ ▀█    ██ ▐█ ▀.  ",
			" ▐█▀▀█▄▐▀▀▄ ▐█▐▐▌ ▄█▀▄ ▐█▐█•▄█▀▀█    ▐█·▄▀▀▀█▄ ",
			" ██▄▪▐█▐█•█▌██▐█▌▐█▌.▐▌ ███ ▐█ ▪▐▌   ▐█▌▐█▄▪▐█ ",
			" ·▀▀▀▀ .▀  ▀▀▀ █▪ ▀█▄▀▪. ▀   ▀  ▀  ▀ ▀▀▀ ▀▀▀▀  ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "󰻭  New file", "<cmd>enew<cr>"),
			dashboard.button("f", "󰱽  Find file", "<cmd>Telescope find_files<cr>"),
			dashboard.button("r", "  Recent", "<cmd>Telescope oldfiles<cr>"),
			dashboard.button("q", "󰿅  Quit", "<cmd>qa<cr>"),
		}

		return dashboard.opts
	end,

	dependencies = {
		-- A lua fork of vim-devicons. This plugin provides
		-- the same icons as well as colors for each icon.
		"nvim-tree/nvim-web-devicons",
	},
}
