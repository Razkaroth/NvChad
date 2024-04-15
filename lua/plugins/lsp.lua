return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		{
			"Equilibris/nx.nvim",
			dependencies = {
				"nvim-telescope/telescope.nvim",
				"joeveiga/ng.nvim",
			},
			opts = {},
			keys = {
				"<leader>nx",
			},
		},
		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			opts = {},
		},
		{
			"roobert/tailwindcss-colorizer-cmp.nvim",
			-- optionally, override the default options:
			config = function()
				require("tailwindcss-colorizer-cmp").setup({
					color_square_width = 2,
				})
			end,
		},
		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
		{
			"weilbith/nvim-code-action-menu",
			cmd = "CodeActionMenu",
		},
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"angularls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"emmet_ls",
				"html",
				"jsonls",
				"tsserver",
				"lua_ls",
				"remark_ls",
				"mdx_analyzer",
				-- "powershell_es",
				"pyright",
				"svelte",
				"tailwindcss",
				"yamlls",
			},
			automatic_installation = true,
		})
		require("nvchad.configs.lspconfig")
		require("configs.lspconfig")
	end,
}
