-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
require("mason").setup()
require("mason-lspconfig").setup({})
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	--
	["pyright"] = function()
		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						diagnosticSeverityOverrides = {
							reportUnusedExpression = "none",
						},
					},
				},
			},
		})
	end,

	["cssls"] = function()
		-- scss and html
		lspconfig.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"css",
				"scss",
				"html",
			},
			settings = {
				css = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
				scss = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
				less = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
			},
		})
	end,

	["tailwindcss"] = function()
		-- tailwindcss
		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"svelte",
				"vue",
			},
			root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
		})
	end,
	["angularls"] = function()
		-- Angular
		local ang_install_path = vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/node_modules"
		-- local cwdpath = vim.fn.getcwd() .. "/node_modules"
		local ang = ang_install_path .. "/@angular/language-server/node_modules"

		local cmd = {
			"ngserver",
			"--stdio",
			"--tsProbeLocations",
			ang_install_path,
			"--ngProbeLocations",
			ang,
		}

		lspconfig.angularls.setup({
			root_dir = lspconfig.util.root_pattern("angular.json", "project.json", "nx.json"),
			on_attach = on_attach,
			cmd = cmd,
			on_new_config = function(new_config, new_root_dir)
				new_config.cmd = cmd
				require("nx")
			end,
		})
	end,

	-- https://github.com/pmizio/typescript-tools.nvim
	["tsserver"] = function()
		require("typescript-tools").setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				-- spawn additional tsserver instance to calculate diagnostics on it
				separate_diagnostic_server = true,
				-- "change"|"insert_leave" determine when the client asks the server about diagnostic
				publish_diagnostic_on = "insert_leave",
				-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
				-- "remove_unused_imports"|"organize_imports") -- or string "all"
				-- to include all supported code actions
				-- specify commands exposed as code_actions
				expose_as_code_action = "all",
				-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
				-- not exists then standard path resolution strategy is applied
				tsserver_path = nil,
				-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
				-- (see 💅 `styled-components` support section)
				tsserver_plugins = {},
				-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
				-- memory limit in megabytes or "auto"(basically no limit)
				tsserver_max_memory = "auto",
				-- described below
				tsserver_format_options = {},
				tsserver_file_preferences = {},
				-- locale of all tsserver messages, supported locales you can find here:
				-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
				tsserver_locale = "en",
				-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
				complete_function_calls = false,
				include_completions_with_insert_text = true,
				-- CodeLens
				-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
				-- possible values: ("off"|"all"|"implementations_only"|"references_only")
				code_lens = "off",
				-- by default code lenses are displayed on all referencable values and for some of you it can
				-- be too much this option reduce count of them by removing member references from lenses
				disable_member_code_lens = true,
			},
		})
	end,
})
