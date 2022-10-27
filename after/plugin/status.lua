-- Verify if the default status line is installed.
local ok, lualine = pcall(require, "lualine")
if ok then
	lualine.setup({
		options = {
			theme = "gruvbox",
		},
	})
else
	print("Could not load the default status line.")
end
