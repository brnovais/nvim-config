-- Plugins are only available after sync.
local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

lualine.setup({
	options = {
		globalstatus = true,
		theme = "catppuccin",
	},
})
