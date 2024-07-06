return { {
    -- Nvim Treesitter configurations and abstraction layer.
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
            "diff",
            "lua", "luadoc",
            "markdown",
            "vim", "vimdoc",
        },
        auto_install = false,
        sync_install = false,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
} }
