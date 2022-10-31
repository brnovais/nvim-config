-- Plugins are only available after sync.
local ok, mason = pcall(require, "mason")

if ok then
	mason.setup()

	require("mason-lspconfig").setup({
		ensure_installed = {
			"clangd",
			"gopls",
			"pyright",
			"sumneko_lua",
			"rust_analyzer",
			"tsserver",
		},
		automatic_installation = false,
	})
end
