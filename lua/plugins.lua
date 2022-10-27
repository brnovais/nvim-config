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
	use({ "lewis6991/impatient.nvim", config = [[require('impatient')]] })

	-- Inspired plugin/package management for Neovim that can manage itself.
	use({ "wbthomason/packer.nvim" })

	-- Configs for the Nvim LSP client.
	use({ "neovim/nvim-lspconfig" })

	-- nvim-cmp source for neovim's built-in language server client.
	use({ "hrsh7th/cmp-nvim-lsp" })
	-- nvim-cmp source for buffer words.
	use({ "hrsh7th/cmp-buffer" })
	-- A completion engine plugin for neovim written in Lua.
	use({ "hrsh7th/nvim-cmp" })

	-- A blazing fast and easy to configure Neovim statusline written in Lua.
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- A (Neo)vim plugin for formatting code.
	-- use { 'sbdchd/neoformat' }

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
		print("All plugins synchronized, open Neovim again and ignore (probably) all messages bellow.")
	end
end)
