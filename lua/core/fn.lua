local M = {}


function M.change_path()
	return vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file")
end

function M.set_global_path()
	local path = M.change_path()
	vim.api.nvim_command("silent :cd " .. path)
end

function M.set_window_path()
	local path = M.change_path()
	vim.api.nvim_command("silent :lcd " .. path)
end

---@param group string
function M.augroup(group)
  -- local id = vim.api.nvim_create_augroup(group, { clear = true })
  vim.api.nvim_create_augroup(group, { clear = true })

  ---@param autocmds fun(autocmd: fun(event: table | string, opts: table, command: function | string))
  return function(autocmds)
    autocmds(function(event, opts, command)
      -- opts.group = id
      opts.group = group
      if type(command) == 'function' then
        opts.callback = command
      else
        opts.command = command
      end
      vim.api.nvim_create_autocmd(event, opts)
    end)
  end
end

return M
