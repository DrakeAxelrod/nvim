local M = {}
local fs = require("lib").fs

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

M.options = function(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

M.plugins = function(plugins)
  local url = "https://github.com/wbthomason/packer.nvim"
  local compile_path = fs.join(vim.fn.stdpath("config"), "lua", "compiled.lua")
  local new_install = (function()
    local install_path = fs.join(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim")
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
      return vim.fn.system({ "git", "clone", "--depth", "1", url, install_path })
    end
  end)()

  vim.cmd("packadd packer.nvim")
  require("packer").startup({ plugins, config = { compile_path = compile_path, display = {
    open_fn = function(float) return require("packer.util").float({ border = "rounded" }) end }
  }})

  if new_install then require("packer").sync() end
  if fs.exists(compile_path) then require("compiled") end
end

return M
