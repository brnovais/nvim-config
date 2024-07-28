-- General visual (display) options.
vim.opt.background = "dark"
vim.opt.colorcolumn = "80,120"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- Line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- General editing options.
vim.opt.smartindent = true

-- General keyboard options.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tab pressing behavior.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Safety and file creation.
vim.opt.swapfile = false
vim.opt.backup = false

-- Search behavior and display.
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Miscellaneous.
vim.opt.errorbells = false

-- Environments (languages and tools) to install.
vim.g.envs = {
	default = {
		install = true,
		mason = {
			tools = { "prettierd" },
		},
		treesitter = { "bash", "diff", "vim", "vimdoc" },
	},
	devops = {
		install = false,
		treesitter = { "dockerfile" },
	},
	files = {
		install = false,
		treesitter = { "gitattributes", "gitignore", "json", "markdown", "toml", "yaml", "xml" },
	},
	go = {
		install = false,
		mason = {
			dap = { "delve" },
		},
		treesitter = { "go" },
	},
	lua = {
		install = false,
		lsp = { "lua_ls" },
		mason = {
			tools = { "stylua" },
		},
		treesitter = { "lua", "luadoc" },
	},
	node = {
		install = false,
		lsp = { "tsserver" },
		treesitter = { "javascript", "typescript" },
	},
	python = {
		install = false,
		lsp = { "pyright" },
		mason = {
			dap = { "debugpy" },
			tools = { "isort", "black" },
		},
		treesitter = { "python" },
	},
	rust = {
		install = false,
		lsp = { "rust_analyzer" },
		treesitter = { "rust" },
	},
	web = {
		install = false,
		lsp = { "tsserver" },
		treesitter = { "astro", "css", "html", "javascript", "scss", "typescript" },
	},
}
