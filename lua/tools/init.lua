require("tools.globals")
import("impatient", function(imp)
  imp.enable_profile()
end)
local keymap = require("tools.keymap")
local M = {}

--- @type fun(...): table
M.keymap_opts = keymap.new_opts
--- @type fun(opts: table): table
M.silent = keymap.silent
--- @type fun(opts: table): table
M.noremap = keymap.noremap
--- @type fun(opts: table): table
M.expr = keymap.expr
--- @type fun(opts: table): table
M.remap = keymap.remap
--- @type fun(opts: table): table
M.nowait = keymap.nowait
--- @type fun(tbl: table): table
M.nmap = keymap.nmap
--- @type fun(tbl: table): table
M.vmap = keymap.vmap
--- @type fun(tbl: table): table
M.xmap = keymap.xmap
--- @type fun(tbl: table): table
M.imap = keymap.imap
--- @type fun(tbl: table): table
M.cmap = keymap.cmap
--- @type fun(tbl: table): table
M.tmap = keymap.tmap
--- @type fun(tbl: table): table
M.xmap = keymap.xmap
--- @type fun(str: string): string
M.kcmd = keymap.cmd
--- @type fun(str: string): string
M.kcu = keymap.cu

M.leader = function(c)
  if c == ' ' then
    vim.keymap.set('n', '<Space>', '<NOP>')
    vim.keymap.set('v', '<Space>', '<NOP>')
    vim.keymap.set('x', '<Space>', '<NOP>')
  end
  vim.g.mapleader = c
end

M.local_leader = function(c)
  if c == ' ' then
    vim.keymap.set('n', '<LocalLeader>', '<NOP>')
    vim.keymap.set('v', '<LocalLeader>', '<NOP>')
    vim.keymap.set('x', '<LocalLeader>', '<NOP>')
  end
end

M.set = function(opts)
  for scope, settings in pairs(opts) do
    for key, value in pairs(settings) do
      vim[scope][key] = value
    end
  end
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

--- Initializes Dep (installs if needed)
--- - prefix is the path to the plugins folder
--- - the default prefix is "packages" (relative to the lua folder in nvim config directory)
--- @param directories table the name of the plugin configs folders
M.init_packages = function(directories)
  local path = vim.fn.stdpath "data" .. "/site/pack/deps/opt/dep"
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
  end
  vim.cmd "packadd dep"

  local modules = {}
  for _, dir in ipairs(directories) do
    local packages_dir = vim.fn.stdpath "config" .. "/lua/" .. dir .. "/"
    if vim.fn.empty(vim.fn.glob(packages_dir)) > 0 then
      return
    end
    local files = vim.fn.readdir(packages_dir)
    local plugins = vim.tbl_map(function(file)
      return file:match "(.*)%.lua" or file
    end, files)
    -- check if valid plugin files actually return a table
    for _, plugin in ipairs(plugins) do
      local ok, mod = pcall(require, dir .. "." .. plugin)
      if ok and type(mod) ~= "boolean" then
        table.insert(modules, mod)
      end
    end
  end
  return require "dep" {
    modules = modules,
  }
end

-- M.packages = function(...)
--   local path = joinpath(vim.fn.stdpath "data", "site", "pack", "deps", "opt", "dep")
--   if vim.fn.empty(vim.fn.glob(path)) > 0 then
--     vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
--   end
--   vim.cmd "packadd dep"

--   require("dep").setup(...)
-- end

M.checkmod = function(mod)
  local ok, _ = pcall(require, mod)
  return ok
end

M.on_attach_list = {}

--- Add a function to the on_attach_list
---@param fn fun(client: number, bufnr: number)
M.on_attach = function(fn)
  -- add the function to the list
  table.insert(M.on_attach_list, fn)
end


return M

-- autocmd({ "TermOpen" }, {
--   group = Terminal,
--   pattern = { "*" },
--   callback = function()
--       vim.wo.number = false
--       vim.wo.relativenumber = false
--       vim.api.nvim_command("startinsert")
--   end,
-- })

-- function _G.map(mode, lhs, rhs, opts)
--   opts = opts or {}
--   vim.keymap.set(mode, lhs, rhs, opts)
-- end

-- M.check_mod = function(mod)
--   local ok, _ = pcall(require, mod)
--   return ok
-- end

-- --- Sets a keymap with vim.keymap.set (just a wrapper to make it easier to read)
-- --- @param mode string | table The mode(s) to map the key in
-- --- @param lhs string The key to map
-- --- @param rhs string | function The command to run when the key is pressed
-- --- @param opts table | string | nil The options for the keymap defaults: { noremap = true, silent = true }
-- M.keymap = function(mode, lhs, rhs, opts)
--   opts = vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts or {})
--   vim.keymap.set(mode, lhs, rhs, opts)
-- end

-- --- Sets a command with vim.api.nvim_create_user_command (just a wrapper to make it easier to read)
-- --- @see https://neovim.io/doc/user/api.html#nvim_create_user_command()
-- --- @param name string The name of the command
-- --- @param cmd string | function The command to run
-- --- @param opts table | nil The options for the command
-- M.user_command = function(name, cmd, opts)
--   opts = vim.tbl_deep_extend("force", {}, opts or {})
--   vim.api.nvim_create_user_command(name, cmd, opts)
-- end

-- --- Creates a new augroup
-- --- @param group string The name of the augroup
-- --- @return fun(autocmds: fun(event: table | string, opts: table, command: function | string))
-- M.augroup = function(group)
-- 	-- local id = vim.api.nvim_create_augroup(group, { clear = true })
-- 	vim.api.nvim_create_augroup(group, { clear = true })
-- 	---@param autocmds fun(autocmd: fun(event: table | string, opts: table, command: function | string))
-- 	return function(autocmds)
-- 		autocmds(function(event, opts, command)
-- 			-- opts.group = id
-- 			opts.group = group
-- 			if type(command) == "function" then
-- 				opts.callback = command
-- 			else
-- 				opts.command = command
-- 			end
-- 			vim.api.nvim_create_autocmd(event, opts)
-- 		end)
-- 	end
-- end

-- --- Creates a new autocmd
-- --- @param event string | table The event(s) to run the autocmd on
-- --- @param command function | string The command to run
-- --- @param opts table The options for the autocmd
-- M.autocmd = function(event, command, opts)
--   if type(command) == "function" then
--     opts.callback = command
--   else
--     opts.command = command
--   end
--   vim.api.nvim_create_autocmd(event, opts)
-- end


-- local packages = function(prefix)
--   local path = vim.fn.stdpath "data" .. "/site/pack/deps/opt/dep"
--   if vim.fn.empty(vim.fn.glob(path)) > 0 then
--     vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
--   end
--   vim.cmd "packadd dep"

--   -- check if packages directory exists
--   local packages_dir = vim.fn.stdpath "config" .. "/lua/" .. prefix .. "/"
--   if vim.fn.empty(vim.fn.glob(packages_dir)) > 0 then
--     return
--   end
--   -- get all file or directory names in the given directory
--   local files = vim.fn.readdir(packages_dir)
--   -- remove the extension from the file name if it exists
--   local modules = vim.tbl_map(function(file)
--     return file:match "(.*)%.lua" or file
--   end, files)
--   modules.prefix = prefix .. "."
--   return require "dep" {
--     modules = modules,
--   }
-- end

-- --- Sets all settings for vim[scope][key] = value
-- --- @param options fun({ [scope]: { [key] = value } })
-- local options = function(options)
--   local opts = options()
--   for scope, table in pairs(opts) do
--     for k, v in pairs(table) do
--       vim[scope][k] = v
--     end
--   end
-- end

-- local keymaps = function(keymaps)
--   keymaps(M.check_mod, M.keymap)
-- end

-- local commands = function(commands)
--   commands(M.check_mod, M.user_command)
-- end

-- local autocmds = function(autocmds)
--   autocmds(M.check_mod, M.augroup)
-- end

-- M.init = function(settings)
--   import("impatient", function(impatient)
--     impatient.enable_profile()
--   end)
--   options(settings.options)
--   packages(settings.packages_dir)
--   commands(settings.commands)
--   keymaps(settings.keymaps)
--   autocmds(settings.autocmds)
-- end

-- return M
