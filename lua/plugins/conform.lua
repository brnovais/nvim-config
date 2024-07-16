return {
	-- Lightweight yet powerful formatter plugin for Neovim.
	"stevearc/conform.nvim",
	version = "^6.0.0",

	-- Lazy-loaded plugin.
	lazy = true,
	event = "InsertEnter",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "[F]ormat buffer",
		},
	},

	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			javascript = { { "prettierd", "prettier" } },
			lua = { "stylua" },
			python = { "isort", "black" },
		},
	},

	dependencies = {
		-- Portable package manager for Neovim that runs everywhere Neovim runs.
		"williamboman/mason.nvim",
		-- Install and upgrade third party tools automatically.
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}
