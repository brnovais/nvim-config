local servers = {
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace',
                },
                diagnostics = {
                    globals = { 'vim' },
                },
            },
        },
    },
}

return { {
    -- Quickstart configs for Nvim LSP.
    'neovim/nvim-lspconfig',

    dependencies = {
        -- Portable package manager for Neovim that runs everywhere Neovim runs.
        'williamboman/mason.nvim',

        {
            -- Extension to mason.nvim that makes it easier
            -- to use lspconfig with mason.nvim.
            'williamboman/mason-lspconfig.nvim',

            opts = function()
                local lspconfig = require('lspconfig')
                local lsp_base_cap = lspconfig.util.default_config.capabilities

                local opts = {
                    automatic_installation = false,
                    ensure_installed = {
                        'lua_ls',
                    },
                    handlers = {
                        function(server_name)
                            lspconfig[server_name].setup(
                                vim.tbl_deep_extend(
                                    'force',
                                    lsp_base_cap,
                                    servers[server_name] or {}
                                )
                            )
                        end,
                    },
                }

                return opts
            end,
        },
    },
} }
