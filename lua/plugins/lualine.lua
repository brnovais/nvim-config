return { {
    -- A blazing fast and easy to configure Neovim statusline written in Lua.
    "nvim-lualine/lualine.nvim",

    -- Make sure we load this during startup.
    lazy = false,

    dependencies = {
        -- A lua fork of vim-devicons. This plugin provides
        -- the same icons as well as colors for each icon.
        "nvim-tree/nvim-web-devicons",
    },

    opts = function()
        local opts = {
            globalstatus = true,
            theme = "tokyonight",
        }

        return opts
    end,
} }
