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

M.Git = {
  n = {
    ["<leader>G"] = { ":LazyGit<CR>", "LazyGit" },
  },
}

return M
