--- Creates a new augroup
--- @param group string The name of the augroup
--- @return fun(autocmds: fun(event: table | string, opts: table, command: function | string))
core.augroup = function(group)
  -- local id = vim.api.nvim_create_augroup(group, { clear = true })
  vim.api.nvim_create_augroup(group, { clear = true })
  ---@param autocmds fun(autocmd: fun(event: table | string, opts: table, command: function | string))
  return function(autocmds)
    autocmds(function(event, opts, command)
      -- opts.group = id
      opts.group = group
      if type(command) == "function" then
        opts.callback = command
      else
        opts.command = command
      end
      vim.api.nvim_create_autocmd(event, opts)
    end)
  end
end

core.options = function(options_dir)
  options_dir = options_dir or "options"
  require(options_dir)
end
