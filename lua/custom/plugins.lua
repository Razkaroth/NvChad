local plugins = {
  {
    "tpope/vim-surround",
    event = "BufRead",
  },
  {
    "justinmk/vim-sneak",
    event = "BufRead",
  },
  {
    "unblevable/quick-scope",
    event = "BufRead",
  },
  {
    -- Undotree
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
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
  },
  {
    "stevearc/dressing.nvim",
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
