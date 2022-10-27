-- Select the default color scheme.
local ok, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not ok then
	print("Could not load the default color scheme.")
end
