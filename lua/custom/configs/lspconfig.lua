-- Import default configuration
local config = require "plugins.configs.lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- typescript

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

-- tailwindcss
lspconfig.tailwindcss.setup {
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
}

-- python
lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "python",
  },
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        pycodestyle = { enabled = false },
        flake8 = { enabled = true },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
        isort = { enabled = false },
        pylsp_mypy = { enabled = false },
      },
    },
  },
}
