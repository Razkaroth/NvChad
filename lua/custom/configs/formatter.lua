local M = {

  javascript = {
    require("formatter.filetypes.javascript").prettier,
  },
  javascriptreact = {
    require("formatter.filetypes.javascript").prettier,
  },
  typescript = {
    require("formatter.filetypes.typescript").prettier,
  },
  typescriptreact = {
    require("formatter.filetypes.typescript").prettier,
  },
  markdown = {
    require("formatter.filetypes.markdown").prettier,
  },
  json = {
    require("formatter.filetypes.json").prettier,
  },
  html = {
    require("formatter.filetypes.html").prettier,
  },
  css = {
    require("formatter.filetypes.css").prettier,
  },
  python = {
    require("formatter.filetypes.python").black,
  },
  lua = {
    require("formatter.filetypes.lua").stylua,
  },
  svelte = {
    require("formatter.filetypes.svelte").prettier,
  },
  yaml = {
    require("formatter.filetypes.yaml").prettier,
  },
  ["*"] = {
    require("formatter.filetypes.any").remove_trailing_whitespace,
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock",
})

return M
