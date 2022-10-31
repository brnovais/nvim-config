-- Plugins are only available after sync.
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local servers = {
	clangd = {},
	gopls = {},
	pyright = {},
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	rust_analyzer = {},
	tsserver = {},
}

local lsp_base_opts = vim.tbl_deep_extend(
	"force",
	lspconfig.util.default_config.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

require("mason-lspconfig").setup_handlers({
	function(server_name)
		local opts = vim.tbl_deep_extend("force", lsp_base_opts, servers[server_name] or {})
		lspconfig[server_name].setup(opts)
	end,

	["rust_analyzer"] = function()
		local opts = vim.tbl_deep_extend("force", lsp_base_opts, servers["rust_analyzer"] or {})
		require("rust-tools").setup({
			server = opts,
		})
	end,
})
