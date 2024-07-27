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
			for _, env in pairs(vim.g.envs) do
				if env.install and env.mason then
					for _, v in pairs(env.mason) do
						table.insert(ensure_installed, v)
					end
				end
			end

			return {
				ensure_installed = ensure_installed,
			}
		end,
	},
}
