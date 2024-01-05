local M = {}
--opts is an optional parameter
-- ["keys"] = {"action", "description", opts = {}},
--
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
    ["<leader>u"] = { ":UndotreeToggle<CR>", "See the past with [U]ndoTree" },
  },
}

M.TODO = {
  n = {
    ["<leader>td"] = { ":TodoTelescope<CR>", "Search [T]ODOs" },
    ["<leader>tr"] = { ":TodoTrouble<CR>", "Search [T]ODOs with Trouble" },
  },
}

M.general = require('custom.maps.general')
M.lspconfig = require('custom.maps.lsp')
M.Harpoon = require('custom.maps.harpoon')
M.Nx = require('custom.maps.nx')
M.Tabs = require('custom.maps.tabs')

return M
