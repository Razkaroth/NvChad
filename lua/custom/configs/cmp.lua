return function(opts)
  local cmp = require "cmp"

  opts.preselect = cmp.PreselectMode.None

  opts.completion = {
    completeopt = "menu,menuone,noselect",
  }

  opts.mapping["<CR>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  }

  cmp.setup(opts)
end
