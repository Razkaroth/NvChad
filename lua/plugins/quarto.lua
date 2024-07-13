-- plugins/quarto.lua
return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
  ft= { "quarto", "markdown" },
	opts = {
		lspFeatures = {
			-- NOTE: put whatever languages you want here:
			languages = { "python" },
			chunks = "all",
			diagnostics = {
				enabled = true,
				triggers = { "BufWritePost" },
			},
			completion = {
				enabled = true,
			},
		},
		keymap = {
			-- NOTE: setup your own keymaps:
			hover = "H",
			definition = "gd",
			rename = "<leader>rn",
			references = "gr",
			format = "<leader>gf",
		},
		codeRunner = {
			enabled = true,
			default_method = "molten",
		},
	},
	config = function()
		local runner = require("quarto.runner")
		vim.keymap.set("n", "<leader>jc", runner.run_cell, { desc = "run cell", silent = true })
		vim.keymap.set("n", "<leader>ja", runner.run_above, { desc = "run cell and above", silent = true })
		vim.keymap.set("n", "<leader>jA", runner.run_all, { desc = "run all cells", silent = true })
		vim.keymap.set("n", "<leader>jl", runner.run_line, { desc = "run line", silent = true })
		vim.keymap.set("v", "<leader>jR", runner.run_range, { desc = "run visual range", silent = true })
		vim.keymap.set("n", "<leader>jRA", function()
			runner.run_all(true)
		end, { desc = "run all cells of all languages", silent = true })
	end,
}
