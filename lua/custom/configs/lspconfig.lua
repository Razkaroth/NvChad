-- Import default configuration

local config = require "plugins.configs.lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local cmp = require "cmp"
local lspconfig = require "lspconfig"

-- nvim-cmp setup
-- set caret return to no autoselect first item

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

-- pyright
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "python",
  },
}
