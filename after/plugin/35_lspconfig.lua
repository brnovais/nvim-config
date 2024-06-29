-- Plugins are only available after sync.
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
	end,
})

local lsp_base_opts = lspconfig.util.default_config.capabilities

require("mason-lspconfig").setup_handlers({
	function(server_name)
		local opts = vim.tbl_deep_extend("force", lsp_base_opts, servers[server_name] or {})
		lspconfig[server_name].setup(opts)
	end,
})
