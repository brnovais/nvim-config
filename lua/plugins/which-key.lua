return { {
    -- Create key bindings that stick. WhichKey is a lua plugin for
    -- Neovim 0.5 that displays a popup with possible keybindings
    -- of the command you started typing.
    "folke/which-key.nvim",

    -- Make sure we don't load this during startup.
    lazy = true,
    event = "VeryLazy",

    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
} }
