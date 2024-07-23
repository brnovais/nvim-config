-- Improve performance.
vim.loader.enable()

-- Set global options.
require("options")

-- A modern plugin manager for Neovim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  print("Cloning a modern plugin manager for Neovim...")

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

-- Load plugins.
require("lazy").setup("plugins")
