return {
	{
		-- Portable package manager for Neovim that runs everywhere Neovim runs.
		"williamboman/mason.nvim",
		name = "mason",
		version = "^1.10.0",

		config = true,
	},

	{
		-- Install and upgrade third party tools automatically.
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		name = "mason-tool-installer",
		version = "*",

		opts = {
			ensure_installed = {
				"stylua",
			},
		},
	},
}
