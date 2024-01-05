return {
  n = {
    ['<leader>nxg'] = { function ()
      require('nx.generators').generators({})
    end, 'Run nx generator'},
    ['<leader>nxa'] = { function ()
      require('nx.actions').actions_finder({})
    end, "Run nx action"},
    ['<leader>nxl'] = { ":Lazy load nx.nvim<CR>", "Lazy load nx"},
    -- Angular navigation
    ['<leader>nc'] = { function ()
      require('ng').goto_component_with_template_file()
    end, "Go to component class"},
    ['<leader>nt'] = {function ()
      require('ng').goto_template_for_component()
    end, "Go to component template"}

  },
}
