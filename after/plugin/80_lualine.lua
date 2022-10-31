-- Plugins are only available after sync.
local ok, lualine = pcall(require, "lualine")

if ok then
	lualine.setup({
		options = {
			globalstatus = true,
			theme = "gruvbox",
		},
	})
end
