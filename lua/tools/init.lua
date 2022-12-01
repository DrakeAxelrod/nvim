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

  Config.plugin = require("tools.pack").register_plugin


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
    local pack = require("tools.pack")
    M.impatient()
    pack.ensure_plugins()
    cfg.leader()
    cfg.options()
    pack.load_compile()
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
