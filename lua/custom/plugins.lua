local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss",
        "prettierd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    opts = function()
      return require "custom.configs.copilot"
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
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
      },
    },
  },
  {
    "theprimeagen/harpoon",
    config = function()
      local keymap = vim.keymap
      keymap.set("n", "<leader>h1", function()
        require("harpoon.ui").nav_file(1)
      end, { desc = "Open [1]st file in Harpoon" })
      keymap.set("n", "<leader>h2", function()
        require("harpoon.ui").nav_file(2)
      end, { desc = "Open [2]nd file in Harpoon" })
      keymap.set("n", "<leader>h3", function()
        require("harpoon.ui").nav_file(3)
      end, { desc = "Open [3]rd file in Harpoon" })
      keymap.set("n", "<leader>h4", function()
        require("harpoon.ui").nav_file(4)
      end, { desc = "Open [4]th file in Harpoon" })
      keymap.set("n", "<leader>h5", function()
        require("harpoon.ui").nav_file(5)
      end, { desc = "Open [5]th file in Harpoon" })
      keymap.set("n", "<leader>hm", function()
        require("harpoon.mark").add_file()
      end, { desc = "Add [H]arpoon [M]ark file" })
      vim.keymap.set("n", "<leader>hu", function()
        require("harpoon.mark").remove_file()
      end, { desc = "[H]arpoon file [U]nmark" })
      -- set leader leader h to toggle Harpoon
      vim.keymap.set("n", "<leader>ht", function()
        require("harpoon.ui").toggle_quick_menu()
      end, { desc = "[H]arpoon [T]oggle" })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()

      -- telescope refactoring integrations
      require("telescope").load_extension "refactoring"

      -- keymaps
      vim.keymap.set({ "n", "x" }, "<leader>rr", function()
        require("telescope").extensions.refactoring.refactors()
      end)
    end,
  },
  -- {
  --   'mhartington/formatter.nvim',
  --   event = 'VeryLazy',
  --   opts = function ()
  --     return require "custom.configs.formatter"
  --   end,
  -- }
  -- Use null-ls until it no longer works
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
}

vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
}

vim.treesitter.language.register("markdown", "mdx")

vim.g.copilot_assume_mapped = true

return plugins
