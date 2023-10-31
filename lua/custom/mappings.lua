local M = {}
-- opts is an optional parameter
-- ["keys"] = {"action", "description", opts = {}},
M.windows = {
  n = {
    -- Window rezising with ctrl arrows
    ["<C-Up>"] = { ":resize -2 <CR>", "Resize window up" },
    ["<C-Down>"] = { ":resize +2 <CR>", "Resize window down" },
    ["<C-Left>"] = { ":vertical resize -2 <CR>", "Resize window left" },
    ["<C-Right>"] = { ":vertical resize +2 <CR>", "Resize window right" },
  },
}

M.GitAlchemy = {
  n = {
    ["<leader>G"] = { ":LazyGit<CR>", "Perform [G]it alchemy using LazyGit" },
    ["<leader>u"] = { ":", "See the past with [U]ndoTree" },
  },
}

M.Harpoon = {
  n = {
    ["<leader>h"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Open [1]st file in Harpoon",
    },
    ["<leader>h1"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Open [1]st file in Harpoon",
    },
    ["<leader>h2"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Open [2]nd file in Harpoon",
    },
    ["<leader>h3"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Open [3]rd file in Harpoon",
    },
    ["<leader>h4"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Open [4]th file in Harpoon",
    },
    ["<leader>h5"] = {
      function()
        require("harpoon.ui").nav_file(5)
      end,
      "Open [5]th file in Harpoon",
    },
    ["<leader>hm"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add [H]arpoon [M]ark file",
    },
    ["<leader>hu"] = {
      function()
        require("harpoon.mark").remove_file()
      end,
      "[H]arpoon file [U]nmark",
    },
    ["<leader>ht"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "[H]arpoon [T]oggle",
    },
  },
}

return M
