-- Plugins are only available after sync.
local ok, fidget = pcall(require, "fidget")

if ok then
	fidget.setup({})
end
