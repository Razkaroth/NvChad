return function(opts)
  opts.pre_hook = function()
    require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  end
  require("Comment").setup(opts)
end
