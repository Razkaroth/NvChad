require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

-- Lines
o.cursorlineopt ='both' -- to enable cursorline!
o.number = true
o.lnr = true
o.relativenumber = true

-- Columns
o.tw = 140
o.colorcolumn = 140
o.wrap = true

-- Set the shell to pwsh if OS is Windows

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
  vim.opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true


-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = "yes"


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- run :Nvdash to open nvim-dash at startup
vim.cmd [[ autocmd VimEnter * Nvdash ]]


vim.treesitter.language.register("markdown", "mdx")


