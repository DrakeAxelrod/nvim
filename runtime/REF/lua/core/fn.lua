local M = {}

function M.merge(a, b)
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

function M.options_global(options)
	for name, value in pairs(options) do
		vim.o[name] = value
	end
end

function M.options_set(options)
	for k, v in pairs(options) do
		if v == true or v == false then
			vim.cmd("set " .. k)
		else
			vim.cmd("set " .. k .. "=" .. v)
		end
	end
end

function M.keymaps(mode, opts, keymaps)
	for _, keymap in ipairs(keymaps) do
		vim.keymap.set(mode, keymap[1], keymap[2], opts)
	end
end

function M.configs()
	local global_configs = require("configs.global")
	local custom_configs = require("configs.custom")
	local configs = M.merge(global_configs, custom_configs)
	for _, func in pairs(configs) do
		if type(func) == "function" then
			func()
		end
	end
end

function M.file_exists(name)
	local f = io.open(name, "r")
	return f ~= nil and io.close(f)
end

function M.dir_exists(path)
	return M.file_exists(path)
end

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
