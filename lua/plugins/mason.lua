return { {
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    'williamboman/mason.nvim',

    config = function(_, opts)
        local mason = require('mason')

        mason.setup(opts)
    end,
} }
