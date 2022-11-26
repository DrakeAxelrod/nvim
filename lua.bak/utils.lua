local M = {}

M.colorscheme = function(colorscheme)
  colorscheme = colorscheme or "default"
  local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not ok then
    vim.cmd "colorscheme default" -- if the above fails, then use default
  end
end

M.join = function(...)
  return table.concat({...}, jit.os == "Windows" and "\\" or "/")
end

--- Check if a file or directory exists in this path
M.exists = function(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

--- Check if a directory exists in this path
M.isdir = function(path)
	-- "/" works on both Unix and Windows
	return M.exists(path .. "/")
end

---@param group string
M.augroup = function(group)
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

return M
