local M = {}

M.ensure_installed = {
  "vim",
  "vimdoc",
  "lua",
  -- web dev
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "markdown",
  -- data analysis
  "python",
  -- containers and orchestration
  "dockerfile",
  "yaml",
}

M.context_commentstring = {
  config = {
    javascript = {
      __default = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      jsx_attribute = "// %s",
      comment = "// %s",
    },
    typescript = { __default = "// %s", __multiline = "/* %s */" },
  },
}

M.highlight = {
  enable = true,
}

M.indent = {
  enable = true,
}

M.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "<c-space>",
    node_incremental = "<c-space>",
    node_decremental = "<M-space>",
  },
}

M.textobjects = {
  swap = {
    enable = true,
    swap_next = {
      ["<leader>a"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner",
    },
  },
  lsp_interop = {
    enable = true,
    floating_preview_opts = {
      border = "rounded",
    },
    peek_definition_code = {
      ["<leader>df"] = "@function.outer",
      ["<leader>dF"] = "@class.outer",
    },
  },
}

return M
