return {
	-- Nvim Treesitter configurations and abstraction layer.
	"nvim-treesitter/nvim-treesitter",
	version = "*",

	-- Lazy-loaded plugin.
	lazy = true,
	event = "VeryLazy",

	build = ":TSUpdate",

	config = function()
		local configs = require("nvim-treesitter.configs")

		local ensure_installed = { "bash", "diff", "markdown", "vim", "vimdoc" }

		if vim.g.install_lua_env then
			table.insert(ensure_installed, "lua")
			table.insert(ensure_installed, "luadoc")
		end

		configs.setup({
			ensure_installed = ensure_installed,
			auto_install = true,
			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = { enable = true },
		})
	end,
}
