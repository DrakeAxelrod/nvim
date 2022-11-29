require("utils.globals")
local M = {}

M.check_mod = function(mod)
  local ok, _ = pcall(require, mod)
  return ok
end

--- Sets a keymap with vim.keymap.set (just a wrapper to make it easier to read)
--- @param mode string | table The mode(s) to map the key in
--- @param lhs string The key to map
--- @param rhs string | function The command to run when the key is pressed
--- @param opts table | string | nil The options for the keymap defaults: { noremap = true, silent = true }
M.keymap = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

--- Sets a command with vim.api.nvim_create_user_command (just a wrapper to make it easier to read)
--- @see https://neovim.io/doc/user/api.html#nvim_create_user_command()
--- @param name string The name of the command
--- @param cmd string | function The command to run
--- @param opts table | nil The options for the command
M.user_command = function(name, cmd, opts)
  opts = vim.tbl_deep_extend("force", {}, opts or {})
  vim.api.nvim_create_user_command(name, cmd, opts)
end

--- Creates a new augroup
--- @param group string The name of the augroup
--- @return fun(autocmds: fun(event: table | string, opts: table, command: function | string))
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

--- Creates a new autocmd
--- @param event string | table The event(s) to run the autocmd on
--- @param command function | string The command to run
--- @param opts table The options for the autocmd
M.autocmd = function(event, command, opts)
  if type(command) == "function" then
    opts.callback = command
  else
    opts.command = command
  end
  vim.api.nvim_create_autocmd(event, opts)
end


local packages = function(prefix)
  local path = vim.fn.stdpath "data" .. "/site/pack/deps/opt/dep"
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
  end
  vim.cmd "packadd dep"

  -- check if packages directory exists
  local packages_dir = vim.fn.stdpath "config" .. "/lua/" .. prefix .. "/"
  if vim.fn.empty(vim.fn.glob(packages_dir)) > 0 then
    return
  end
  -- get all file or directory names in the given directory
  local files = vim.fn.readdir(packages_dir)
  -- remove the extension from the file name if it exists
  local modules = vim.tbl_map(function(file)
    return file:match "(.*)%.lua" or file
  end, files)
  modules.prefix = prefix .. "."
  return require "dep" {
    modules = modules,
  }
end

--- Sets all settings for vim[scope][key] = value
--- @param options fun({ [scope]: { [key] = value } })
local options = function(options)
  local opts = options()
  for scope, table in pairs(opts) do
    for k, v in pairs(table) do
      vim[scope][k] = v
    end
  end
end

local keymaps = function(keymaps)
  keymaps(M.check_mod, M.keymap)
end

local commands = function(commands)
  commands(M.check_mod, M.user_command)
end

local autocmds = function(autocmds)
  autocmds(M.check_mod, M.augroup)
end

M.init = function(settings)
  import("impatient", function(impatient)
    impatient.enable_profile()
  end)
  options(settings.options)
  packages(settings.packages_dir)
  commands(settings.commands)
  keymaps(settings.keymaps)
  autocmds(settings.autocmds)
end

return M
