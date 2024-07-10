return { {
    -- Lightweight yet powerful formatter plugin for Neovim.
    'stevearc/conform.nvim',

    -- Make sure we don't load this during startup.
    lazy = true,
    event = 'InsertEnter',

    dependencies = {
        -- Portable package manager for Neovim that runs everywhere Neovim runs.
        'williamboman/mason.nvim',
    },

    opts = function()
        local opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_format = 'fallback',
            },
            formatters_by_ft = {
                javascript = { { 'prettierd', 'prettier' } },
                lua = { 'stylua' },
                python = { 'isort', 'black' },
            },
        }

        return opts
    end,
} }
