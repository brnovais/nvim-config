-- Plugins are only available after sync.
local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if ok then
	treesitter_configs.setup({
		ensure_installed = {
			"c",
			"cpp",
			"css",
			"go",
			"html",
			"javascript",
			"lua",
			"python",
			"rust",
			"scss",
			"toml",
		},
		sync_install = false,
		auto_install = false,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end
