local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "angularls",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "eslint",
          "html",
          "jsonls",
          "tsserver",
          "lua_ls",
          "remark_ls",
          "mdx_analyzer",
          "powershell_es",
          "pyright",
          "svelte",
          "tailwindcss",
        },

        automatic_installation = true,
      }
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function(_, opts)
      require "custom.configs.cmp"(opts)
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
    dependencier = {
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
      end, { desc = "Telescope [R]efactoring [R]efactors" })
    end,
  },
  {
    {
      "kdheepak/lazygit.nvim",
      -- load when opening a folder with .git directory
      cmd = { "LazyGit", "LazyGitConfig" },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opts = {},
    },
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        vim.keymap.set(
          "n",
          "<leader>hp",
          require("gitsigns").preview_hunk,
          { buffer = bufnr, desc = "Preview git hunk" }
        )

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ "n", "v" }, "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
        vim.keymap.set({ "n", "v" }, "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
      end,
    },
  },
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
