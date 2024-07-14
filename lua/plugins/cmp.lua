return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		"saadparwaiz1/cmp_luasnip",
		"f3fora/cmp-spell",
		"ray-x/cmp-treesitter",
		"kdheepak/cmp-latex-symbols",
		"jmbuhr/cmp-pandoc-references",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind-nvim",
		"jmbuhr/otter.nvim",
	},
	config = function()
		local opts = require("nvchad.configs.cmp")
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")
		luasnip.filetype_extend("quarto", { "markdown" })

		opts.sources = {
			{ name = "otter" }, -- for code chunks in quarto
			{ name = "path" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "nvim_lsp" },
			{ name = "luasnip", keyword_length = 3, max_item_count = 3 },
			{ name = "pandoc_references" },
			{ name = "buffer", keyword_length = 5, max_item_count = 3 },
			{ name = "spell" },
			{ name = "treesitter", keyword_length = 5, max_item_count = 3 },
			{ name = "calc" },
			{ name = "latex_symbols" },
			{ name = "emoji" },
		}
		opts.formatting = {
			format = lspkind.cmp_format({
				mode = "symbol",
				menu = {
					otter = "[🦦]",
					nvim_lsp = "[LSP]",
					nvim_lsp_signature_help = "[sig]",
					luasnip = "[snip]",
					buffer = "[buf]",
					path = "[path]",
					spell = "[spell]",
					pandoc_references = "[ref]",
					tags = "[tag]",
					treesitter = "[TS]",
					calc = "[calc]",
					latex_symbols = "[tex]",
					emoji = "[emoji]",
				},
			}),
		}

		opts.preselect = cmp.PreselectMode.None

		opts.completion = {
			completeopt = "menu,menuone,noselect",
		}

		opts.mapping["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		})

		cmp.setup(opts)
	end,
}
