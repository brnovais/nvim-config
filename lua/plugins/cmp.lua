return {
	-- A completion engine plugin for neovim written in Lua.
	"hrsh7th/nvim-cmp",

	-- Make sure we don't load this during startup.
	lazy = true,
	event = "InsertEnter",

	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local vscode_snip = require("luasnip.loaders.from_vscode")
		local lspkind = require("lspkind")

		vscode_snip.lazy_load()

		local opts = {
			completion = { completeopt = "menu,menuone,noinsert" },

			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext / [p]revious item.
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward.
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Manually trigger a completion from nvim-cmp.
				["<C-Space>"] = cmp.mapping.complete(),

				-- Accept ([y]es) the completion.
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				-- [E]xit current completion.
				["<C-e>"] = cmp.mapping.abort(),
			}),

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					before = function(entry, vim_item)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							buffer = "[Buffer]",
							luasnip = "[Snip]",
						})[entry.source.name]

						return vim_item
					end,
				}),
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
			}),

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		}

		return opts
	end,

	dependencies = {
		-- Tiny plugin adds vscode-like pictograms to neovim built-in lsp.
		"onsails/lspkind-nvim",

		{
			-- Snippet Engine for Neovim written in Lua.
			"L3MON4D3/LuaSnip",

			dependencies = {
				-- Snippets collection for a set of different programming
				-- languages for faster development.
				"rafamadriz/friendly-snippets",
			},
		},

		-- Source for neovim's built-in language server client.
		"hrsh7th/cmp-nvim-lsp",
		-- Source for buffer.
		"hrsh7th/cmp-buffer",
		-- Source for snippets.
		"saadparwaiz1/cmp_luasnip",
	},
}
