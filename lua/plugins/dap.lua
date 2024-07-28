return {
	-- Debug Adapter Protocol client implementation for Neovim.
	"mfussenegger/nvim-dap",

	-- Lazy-loaded plugin.
	lazy = true,
	keys = function(_, keys)
		local dap = require("dap")
		local dapui = require("dapui")

		return {
			{ "<F5>", dap.continue, desc = "Debug: Start/Continue" },
			{ "<F1>", dap.step_into, desc = "Debug: Step Into" },
			{ "<F2>", dap.step_over, desc = "Debug: Step Over" },
			{ "<F3>", dap.step_out, desc = "Debug: Step Out" },
			{ "<leader>b", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
			{
				"<leader>B",
				function()
					dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Debug: Set Breakpoint",
			},
			{ "<F7>", dapui.toggle, desc = "Debug: See last session result." },
			unpack(keys),
		}
	end,

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.listeners.after.event_initialized.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,

	dependencies = {
		-- Mason-nvim-dap bridges mason.nvim with the nvim-dap plugin -
		-- making it easier to use both plugins together.
		"jay-babu/mason-nvim-dap.nvim",

		{
			-- An extension for nvim-dap providing default configurations for
			-- python and methods to debug individual test methods or classes.
			"mfussenegger/nvim-dap-python",

			config = function()
				local python_path =
					vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages", "debugpy", "venv", "bin", "python")

				require("dap-python").setup(python_path)
			end,
		},

		{
			-- A UI for nvim-dap.
			"rcarriga/nvim-dap-ui",

			config = true,

			dependencies = {
				-- A library for asynchronous IO in Neovim.
				"nvim-neotest/nvim-nio",
			},
		},
	},
}
