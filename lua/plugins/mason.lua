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

		opts = function()
			local ensure_installed = {}

			if vim.g.install_lua_env then
				table.insert(ensure_installed, "stylua")
			end

			return {
				ensure_installed = ensure_installed,
			}
		end,
	},
}
