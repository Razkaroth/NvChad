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

-- Angular
lspconfig.angularls.setup {
  root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
}

-- pyright
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "python",
  },
}

lspconfig.emmet_ls.setup {
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}
