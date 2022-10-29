-- If you want to automatically install and set up packer.nvim
-- on any machine you clone your configuration to, add the
-- following snippet (which is due to @Iron-E and @khuedoan)
-- somewhere in your config before your first usage of packer.
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
	-- Speed up loading Lua modules in Neovim to improve startup time.
	-- It's recommended to put impatient.nvim before any other plugins.
	use({ "lewis6991/impatient.nvim" })

	-- Inspired plugin/package management for Neovim that can manage itself.
	use({ "wbthomason/packer.nvim" })

	-- Configs for the Nvim LSP client.
	use({ "neovim/nvim-lspconfig" })

	-- A completion engine plugin for neovim written in Lua.
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("config.cmp")
		end,
		requires = {
			{
				-- Snippet Engine for Neovim written in Lua.
				"L3MON4D3/LuaSnip",
				config = function()
					require("config.luasnip")
				end,
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

	-- A blazing fast and easy to configure Neovim statusline written in Lua.
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine")
		end,
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
		print("All plugins synchronized, ignore (probably) all messages bellow and restart.")
	end
end)
