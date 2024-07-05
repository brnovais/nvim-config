return { {
    -- A completion engine plugin for neovim written in Lua.
    "hrsh7th/nvim-cmp",

    -- Make sure we don't load this during startup.
    lazy = true,
    event = "InsertEnter",

    dependencies = {
        -- Source for neovim's built-in language server client.
        "hrsh7th/cmp-nvim-lsp",
        -- Source for path.
        "hrsh7th/cmp-path",

        -- Snippet Engine for Neovim written in Lua.
        "L3MON4D3/LuaSnip",
        -- Source for snippets.
        "saadparwaiz1/cmp_luasnip",

        -- Tiny plugin adds vscode-like pictograms to neovim built-in lsp.
        "onsails/lspkind-nvim",
    },

    opts = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local opts = {
            completion = { completeopt = "menu,menuone,noinsert" },

            mapping = cmp.mapping.preset.insert({
                -- Select the [n]ext item.
                ["<C-n>"] = cmp.mapping.select_next_item(),
                -- Select the [p]revious item.
                ["<C-p>"] = cmp.mapping.select_prev_item(),

                -- Scroll the documentation window [b]ack / [f]orward.
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),

                -- Manually trigger a completion from nvim-cmp.
                ["<C-Space>"] = cmp.mapping.complete(),

                -- Accept ([y]es) the completion.
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }),

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
        }

        return opts
    end,
} }
