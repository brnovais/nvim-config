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

		local ensure_installed = {}
		for _, env in pairs(vim.g.envs) do
			if env.install and env.treesitter then
				for _, v in pairs(env.treesitter) do
					table.insert(ensure_installed, v)
				end
			end
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
