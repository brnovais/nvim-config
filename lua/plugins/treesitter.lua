return {
	-- Nvim Treesitter configurations and abstraction layer.
	"nvim-treesitter/nvim-treesitter",
	version = "*",

	-- Lazy-loaded plugin.
	lazy = true,
	event = "VeryLazy",

	build = ":TSUpdate",

	opts = {
		ensure_installed = {
			"bash",
			"diff",
			"c",
			"cpp",
			"html",
			"css",
			"javascript",
			"typescript",
			"lua",
			"luadoc",
			"markdown",
			"python",
			"rust",
			"toml",
			"vim",
			"vimdoc",
		},
		auto_install = true,
		sync_install = false,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

		indent = { enable = true },
	},
}
