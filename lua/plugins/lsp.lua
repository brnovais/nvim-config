-- Global mappings.
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

return {
	-- Quickstart configs for Nvim LSP.
	"neovim/nvim-lspconfig",
	version = "^0.1.8",

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
			callback = function(attach_event)
				local builtin = require("telescope.builtin")

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = attach_event.buf, desc = "LSP: " .. desc })
				end

				map("gd", builtin.lsp_definitions, "[G]oto [d]efinition")
				map("gD", vim.lsp.buf.declaration, "[G]oto [d]eclaration")
				map("gr", builtin.lsp_references, "[G]oto [r]eferences")
				map("gI", builtin.lsp_implementations, "[G]oto [i]mplementation")

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [a]ction")

				map("<leader>D", builtin.lsp_type_definitions, "Type [d]efinition")
				map("K", vim.lsp.buf.hover, "Hover documentation")
				map("<C-k>", vim.lsp.buf.signature_help, "Signature help")

				map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [s]ymbols")
				map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [s]ymbols")
			end,
		})
	end,

	dependencies = {
		-- Extension to mason.nvim that makes it easier
		-- to use lspconfig with mason.nvim.
		"williamboman/mason-lspconfig.nvim",

		opts = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local lsp_base_cap = vim.tbl_deep_extend(
				"force",
				lspconfig.util.default_config.capabilities,
				cmp_nvim_lsp.default_capabilities()
			)

			local ensure_installed = {}
			for _, env in pairs(vim.g.envs) do
				if env.install and env.lsp then
					for _, v in pairs(env.lsp) do
						table.insert(ensure_installed, v)
					end
				end
			end

			local opts = {
				automatic_installation = false,
				ensure_installed = ensure_installed,
				handlers = {
					function(server_name)
						lspconfig[server_name].setup(vim.tbl_deep_extend("force", lsp_base_cap, {}))
					end,
				},
			}

			return opts
		end,

		dependencies = {
			-- Portable package manager for Neovim that runs everywhere Neovim runs.
			"williamboman/mason.nvim",
		},
	},
}
