-- Plugins are only available after sync.
local ok, luasnip = pcall(require, "luasnip")
if not ok then
	return
end

luasnip.config.set_config({
	history = false,
	updateevents = "TextChanged,TextChangedI",
})

require("luasnip.loaders.from_vscode").lazy_load()
