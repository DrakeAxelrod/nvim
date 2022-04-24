local M = {}
M.tbl = {}

function M.tbl.merge(a, b)
	if type(a) == "table" and type(b) == "table" then
		for k, v in pairs(b) do
			if type(v) == "table" and type(a[k] or false) == "table" then
				M.merge(a[k], v)
			else
				a[k] = v
			end
		end
	end
	return a
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

function M.configs()
	local configs = M.tbl.merge(
		require("configs.global"),
		require("configs.custom")
	)
	for _, func in pairs(configs) do
		if type(func) == "function" then
			func()
		end
	end
end

return M
