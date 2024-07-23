return {
	-- Find, Filter, Preview, Pick. All lua, all the time.
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",

	-- Lazy-loaded plugin.
	lazy = true,
	event = "VeryLazy",
	cmd = "Telescope",
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>sh", builtin.help_tags, desc = "[S]earch [h]elp" },
			{ "<leader>sk", builtin.keymaps, desc = "[S]earch [k]eymaps" },
			{ "<leader>sf", builtin.find_files, desc = "[S]earch [f]iles" },
			{ "<leader>ss", builtin.builtin, desc = "[S]earch [s]elect" },
			{ "<leader>sw", builtin.grep_string, desc = "[S]earch [w]ord" },
			{ "<leader>sg", builtin.live_grep, desc = "[S]earch by [g]rep" },
			{ "<leader>sd", builtin.diagnostics, desc = "[S]earch [d]iagnostics" },
			{ "<leader>sr", builtin.resume, desc = "[S]earch [r]esume" },
			{ "<leader>s.", builtin.oldfiles, desc = "[S]earch recent files ('.' for repeat)" },
			{ "<leader><leader>", builtin.buffers, desc = "[ ] Find existing buffers" },
		}
	end,

	dependencies = {
		--  All the lua functions I don't want to write twice.
		"nvim-lua/plenary.nvim",

		-- A lua fork of vim-devicons. This plugin provides
		-- the same icons as well as colors for each icon.
		"nvim-tree/nvim-web-devicons",
	},
}
