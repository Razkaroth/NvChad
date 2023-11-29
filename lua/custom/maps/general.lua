return {
  n = {
    ['<C-LeftMouse>'] = { function ()
      -- open url under cursor in browser
      local url = vim.fn.expand("<cWORD>")
      if url ~= "" then
        print("Opening " .. url .. " in browser")
        vim.fn.jobstart("xdg-open " .. url, {detach = true})
      end
    end, 'Open url under cursor in browser'},
    ['<C-s>'] = { ":wa<CR>", "Save all buffers" },
    ['<leader>n'] = {function () end}
  },
  t = {
    ['<C-LeftMouse>'] = { function ()
      -- open url under cursor in browser
      local url = vim.fn.expand("<cWORD>")
      if url ~= "" then
        print("Opening " .. url .. " in browser")
        vim.fn.jobstart("xdg-open " .. url, {detach = true})
      end
    end, 'Open url under cursor in browser'}
  },
  i = {
    ["<C-s>"] = { "<c-o>:wa<CR>", "Save all buffers" },
    -- use ctrl backspace to delete the previous word
    ["<S-BS>"] = { "<c-o>db", "Delete word backwards" },
    -- use ctrl delete to delete the next word
    ["<S-Del>"] = { "<c-o>dw", "Delete next word" },
  },
}
