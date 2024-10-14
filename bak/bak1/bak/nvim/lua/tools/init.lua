if not import then
  require("tools.globals")
end
local M = {}

--- list of on_attach callbacks
--- @type table<fun(client: number, bufnr: number)>
M.on_attach_list = {}

local cfg = {
  plugins = function() end,
  options = function() end,
  keymaps = function() end,
  commands = function() end,
  autocommands = function() end,
  leader = function() end,
}

--- loads impatient if it is installed to speed up startup
M.impatient = function()
  import("impatient", function(imp)
    imp.enable_profile()
  end)
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

--- Sets a keymap with vim.keymap.set (just a wrapper to make it easier to read)
--- @param mod string The mod required to map the key
--- @param mode string | table The mode(s) to map the key in
--- @param lhs string The key to map
--- @param rhs string | function The command to run when the key is pressed
--- @param opts table | string | nil The options for the keymap defaults: { noremap = true, silent = true }
M.modkeymap = function(mod, mode, lhs, rhs, opts)
  if M.checkmod(mod) then
  opts = vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

M.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == ' ' then
    vim.keymap.set('n', '<Space>', '<NOP>')
    vim.keymap.set('v', '<Space>', '<NOP>')
    vim.keymap.set('x', '<Space>', '<NOP>')
  end
  vim.g.mapleader = c
end

M.options = function(opts)
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
-- M.init_packages = function(directories)
--   local path = vim.fn.stdpath "data" .. "/site/pack/deps/opt/dep"
--   if vim.fn.empty(vim.fn.glob(path)) > 0 then
--     vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
--   end
--   vim.cmd "packadd dep"

--   local modules = {}
--   for _, dir in ipairs(directories) do
--     local packages_dir = vim.fn.stdpath "config" .. "/lua/" .. dir .. "/"
--     if vim.fn.empty(vim.fn.glob(packages_dir)) > 0 then
--       return
--     end
--     local files = vim.fn.readdir(packages_dir)
--     local plugins = vim.tbl_map(function(file)
--       return file:match "(.*)%.lua" or file
--     end, files)
--     -- check if valid plugin files actually return a table
--     for _, plugin in ipairs(plugins) do
--       local ok, mod = pcall(require, dir .. "." .. plugin)
--       if ok and type(mod) ~= "boolean" then
--         table.insert(modules, mod)
--       end
--     end
--   end
--   return require "dep" {
--     modules = modules,
--   }
-- end

-- M.packages = function(...)
--   local path = joinpath(vim.fn.stdpath "data", "site", "pack", "deps", "opt", "dep")
--   if vim.fn.empty(vim.fn.glob(path)) > 0 then
--     vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
--   end
--   vim.cmd "packadd dep"

--   require("dep").setup(...)
-- end

local bootstrap_package_manager =function()
  local path = vim.fn.stdpath "data" .. "/site/pack/deps/opt/dep"
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
  end
  vim.cmd "packadd dep"
  
  local ok, dep = pcall(require, "dep")
  if not ok then
    Log:warn("Failed to load dep")
  end
  return dep
end

M.plugins = function(prefix)
  prefix = prefix or "plugins"
  local dep = bootstrap_package_manager()
  local packages = readdir(prefix)
  if dep then
    dep({
      modules = {
        prefix = "%s." % prefix,
        table.unpack(packages),
      }
    })
  end
end

M.checkmod = function(mod)
  local ok, _ = pcall(require, mod)
  if ok then
    return true
  end
  return false
end

--- Add a function to the on_attach_list
---@param fn fun(client: number, bufnr: number)
M.on_attach = function(fn)
  -- add the function to the list
  table.insert(M.on_attach_list, fn)
end

if not Config then
  Config = {}

  local init = function(dir)
    local ok, _ = pcall(require, dir)
    if not ok then
      Log:warn("Failed to load config: %s" % dir)
    end
  end

  Config.plugins = function(dir)
    cfg.plugins = function()
      M.plugins(dir)
    end
  end

  Config.options = function(dir)
    cfg.options = function()
      init(dir)
    end
  end

  Config.keymaps = function(dir)
    cfg.keymaps = function()
      init(dir)
    end
  end

  Config.autocommands = function(dir)
    cfg.autocommands = function()
      init(dir)
    end
  end

  Config.commands = function(dir)
    cfg.commands = function()
      init(dir)
    end
  end

  Config.leader = function(key)
    cfg.leader = function()
      M.leader(key)
    end
  end

  Config.load = function()
    M.impatient()
    cfg.leader()
    cfg.options()
    cfg.plugins()
    cfg.keymaps()
    cfg.commands()
    cfg.autocommands()
  end
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
