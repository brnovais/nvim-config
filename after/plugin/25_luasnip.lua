-- Plugins are only available after sync.
local ok, luasnip = pcall(require, "luasnip")

if ok then
	luasnip.config.set_config({
		history = false,
		updateevents = "TextChanged,TextChangedI",
	})

	require("luasnip.loaders.from_vscode").lazy_load()
end
