function SetAutorun(groupName, pattern, cmd)
  -- create a new buffer in a vertical split
  vim.api.nvim_command "vsplit"
  vim.api.nvim_command "enew"
  --get the current buffer number
  local bufnr = vim.api.nvim_get_current_buf()
  -- set the buffer name
  vim.api.nvim_buf_set_name(bufnr, "Autorun " .. groupName)

  local input = vim.fn.input("Run command on " .. vim.fn.expand "%" .. "? (y/n): ")
  -- If the input is y, run the command
  if input ~= "y" then
    print "Aborted"
    -- close the buffer
    vim.api.nvim_command "q"
    return
  end

  -- join the command
  local pcmd = table.concat(cmd, " ")
  local ppattern = table.concat(pattern, " | ")

  print("Running command: " .. pcmd)
  print("Group name: " .. groupName)
  print("Pattern: " .. ppattern)

  -- Input to confirm running the command include the file name
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { groupName .. ": Runing " .. pcmd .. " on pattern" .. ppattern })

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup(groupName, { clear = true }),
    pattern = pattern,
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end

      vim.api.nvim_buf_set_lines(
        bufnr,
        0,
        -1,
        false,
        { groupName .. ": Running " .. pcmd .. " on pattern " .. ppattern }
      )
      vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
        on_exit = function(_, code)
          if code == 0 then
            vim.api.nvim_buf_set_lines(
              bufnr,
              -1,
              -1,
              false,
              { "Command " .. pcmd .. " on pattern " .. ppattern .. " finished successfully" }
            )
          else
            vim.api.nvim_buf_set_lines(
              bufnr,
              -1,
              -1,
              false,
              { "Command " .. pcmd .. " on pattern " .. ppattern .. " finished with error code " .. code }
            )
          end
          -- Scroll to the top of the buffer
          vim.api.nvim_buf_call(bufnr, function()
            vim.api.nvim_command "normal! gg"
          end)
        end,
      })
    end,
  })

  -- remove group on buffer close
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "Q",
    ":q<CR>:lua RemoveAutocmd('" .. groupName .. "')<CR>",
    { noremap = true, silent = true }
  )
end

function RemoveAutocmd(groupName)
  vim.api.nvim_del_augroup_by_name(groupName)
end
