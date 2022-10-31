-- If you want to automatically install and set up packer.nvim on any machine you
-- clone your configuration to, add the following snippet (which is due to @Iron-E
-- and @khuedoan) somewhere in your config before your first usage of packer.
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})

		vim.cmd([[packadd packer.nvim]])

		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Improve startup time for Neovim.
	use({ "lewis6991/impatient.nvim" })

	-- A use-package inspired plugin manager for Neovim.
	use({ "wbthomason/packer.nvim" })

	use({
		-- A completion engine plugin for neovim written in Lua.
		"hrsh7th/nvim-cmp",
		requires = {
			{
				-- Snippet Engine for Neovim written in Lua.
				"L3MON4D3/LuaSnip",
				requires = {
					-- Snippets collection for a set of different programming
					-- languages for faster development.
					"rafamadriz/friendly-snippets",
				},
			},
			-- Source for snippets.
			"saadparwaiz1/cmp_luasnip",
			-- Source for neovim's built-in language server client.
			"hrsh7th/cmp-nvim-lsp",
			-- Source for buffer words.
			"hrsh7th/cmp-buffer",
			-- Source for path.
			"hrsh7th/cmp-path",
			-- Tiny plugin adds vscode-like pictograms to neovim built-in lsp.
			"onsails/lspkind-nvim",
		},
	})

	use({
		-- Quickstart configs for Nvim LSP.
		"neovim/nvim-lspconfig",
		requires = {
			-- Portable package manager for Neovim that runs everywhere Neovim runs.
			"williamboman/mason.nvim",
			-- Extension to mason.nvim that makes it easier to use lspconfig
			-- with mason.nvim.
			"williamboman/mason-lspconfig.nvim",
			{
				-- Use Neovim as a language server to inject LSP diagnostics,
				-- code actions, and more via Lua.
				"jose-elias-alvarez/null-ls.nvim",
				requires = {
					-- Plenary: full; complete; entire; absolute; unqualified.
					-- All the lua functions I don't want to write twice.
					"nvim-lua/plenary.nvim",
					-- Bridges mason.nvim with the null-ls plugin - making it
					-- easier to use both plugins together.
					"jayp0521/mason-null-ls.nvim",
				},
			},
			-- Tools for better development in rust using neovim's builtin lsp.
			"simrat39/rust-tools.nvim",
			-- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
			"j-hui/fidget.nvim",
		},
	})

	use({
		-- Nvim Treesitter configurations and abstraction layer.
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use({
		-- A blazing fast and easy to configure Neovim statusline written in Lua.
		"nvim-lualine/lualine.nvim",
		-- A lua fork of vim-devicons. This plugin provides
		-- the same icons as well as colors for each icon.
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- This is a community fork of gruvbox, created to merge
	-- recent pull requests and fix recent issues.
	use({ "gruvbox-community/gruvbox", opt = true })
	-- A dark and light Neovim theme written in Lua ported
	-- from the Visual Studio Code TokyoNight theme.
	use({ "folke/tokyonight.nvim", opt = true })

	if packer_bootstrap then
		-- Automatically sync all plugins
		require("packer").sync()

		-- Let the user know that the first run is just to sync plugins.
		print("Restart after plugin sync.")
	end
end)
