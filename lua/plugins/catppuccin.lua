return { {
    -- Soothing pastel theme for (Neo)vim.
    "catppuccin/nvim",
    name = "catppuccin",

    -- Make sure we load this during startup.
    lazy = false,
    -- Make sure to load this before all the other start plugins.
    priority = 1000,

    config = function()
        -- Load the colorscheme here.
        vim.cmd([[colorscheme catppuccin]])
    end,
} }
