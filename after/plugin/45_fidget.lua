-- Plugins are only available after sync.
local ok, fidget = pcall(require, "fidget")
if not ok then
	return
end

fidget.setup()
