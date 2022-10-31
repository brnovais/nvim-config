-- Plugins are only available after sync.
local ok, nullls = pcall(require, "null-ls")
if not ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
nullls.setup({
	sources = {
		require("null-ls").builtins.formatting.prettierd,
		require("null-ls").builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

require("mason-null-ls").setup({
	ensure_installed = {
		"prettierd",
		"stylua",
	},
	automatic_installation = false,
})
