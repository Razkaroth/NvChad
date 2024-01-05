local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    -- null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.flake8.with {
      extra_args = { "--ignore=E501" },
      prefer_local = '/home/raz/.local/bin',
    },
    null_ls.builtins.formatting.prettier.with {
      extra_filetypes = { "mdx" },
    },
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black.with {
      extra_args = { "--line-length=120" },
      prefer_local = '/home/raz/.local/bin',
    },
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.proselint,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function()
      --     vim.lsp.buf.format { bufnr = bufnr }
      --   end,
      -- })
    end
  end,
}

return opts
