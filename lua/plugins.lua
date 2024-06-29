-- A modern plugin manager for Neovim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
		-- A blazing fast and easy to configure Neovim statusline written in Lua.
		"nvim-lualine/lualine.nvim",
		-- A lua fork of vim-devicons. This plugin provides
		-- the same icons as well as colors for each icon.
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Soothing pastel theme for (Neo)vim.
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})
