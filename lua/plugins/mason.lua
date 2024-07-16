return {
	{
		-- Portable package manager for Neovim that runs everywhere Neovim runs.
		"williamboman/mason.nvim",
		version = "^1.10.0",

		config = true,
	},

	{
		-- Install and upgrade third party tools automatically.
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		version = "*",

		opts = {
			ensure_installed = {
				"stylua",
			},
		},
	},
}
