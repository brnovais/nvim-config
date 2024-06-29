-- Plugins are only available after sync.
local ok, mason = pcall(require, "mason")
if not ok then
	return
end

mason.setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
	},
	automatic_installation = false,
})
