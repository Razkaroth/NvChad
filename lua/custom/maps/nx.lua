return {
  n = {
    ['<leader>ng'] = { function ()
      require('nx.generators').generators({})
    end, 'Run nx generator'},
    ['<leader>na'] = { function ()
      require('nx.actions').actions_finder({})
    end}
  },
}
