-- return setmetatable({}, {
--   __index = function(self, key)
--     local ok, mod = pcall(require, ("lib.%s"):format(key))
--     if ok then
--       return mod
--     else
--       return nil
--     end
--   end
-- })
require("core.utils.globals")
local M = {}
M.icons = require("core.utils.icons")
M.colors = require("core.utils.colors")
M.fs = require("core.utils.fs")

M.check_mod = function(mod)
  local ok, _ = pcall(require, mod)
  return ok
end

function M.get_os()
  local os = vim.loop.os_uname()
  return os.sysname
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

M.dump = function(o)
  if type(o) == 'table' then
     local s = '\n{ '
     for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '['..k..'] = ' .. M.dump(v) .. ','
     end
     return s .. '}\n'
  else
     return tostring(o)
  end
end

M.tbl_to_json_file = function(tbl, filename)
  local file = assert(io.open(filename .. ".txt", "w"))
  file:write(vim.inspect(tbl))
  file:close()
end

M.create = {}
--- Sets a keymap with vim.keymap.set (just a wrapper to make it easier to read)
--- @param mode string | table The mode(s) to map the key in
--- @param lhs string The key to map
--- @param rhs string | function The command to run when the key is pressed
--- @param opts table | string | nil The options for the keymap defaults: { noremap = true, silent = true }
M.create.keymap = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

--- Sets a command with vim.api.nvim_create_user_command (just a wrapper to make it easier to read)
--- @see https://neovim.io/doc/user/api.html#nvim_create_user_command()
--- @param name string The name of the command
--- @param cmd string | function The command to run
--- @param opts table | nil The options for the command
M.create.user_command = function(name, cmd, opts)
  opts = vim.tbl_deep_extend("force", {}, opts or {})
  vim.api.nvim_create_user_command(name, cmd, opts)
end

--- Creates a new augroup
--- @param group string The name of the augroup
--- @return fun(autocmds: fun(event: table | string, opts: table, command: function | string))
M.create.augroup = function(group)
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
M.create.autocmd = function(event, command, opts)
  if type(command) == "function" then
    opts.callback = command
  else
    opts.command = command
  end
  vim.api.nvim_create_autocmd(event, opts)
end

return M
