if not import then require("core.globals") end
if not Packer then require("core.pack") end

local M = {}

--- list of on_attach callbacks
--- @type table<fun(client: number, bufnr: number)>
M.on_attach_list = {}
M.servers_path = joinpath(vim.fn.stdpath("config"), "lua", "servers")

--- Add a function to the on_attach_list
---@param fn fun(client: number, bufnr: number)
M.on_attach = function(fn)
  -- add the function to the list
  table.insert(M.on_attach_list, fn)
end

M.set_servers_path = function(path)
  M.servers_path = path
end


M.checkmod = function(mod)
  local ok, _ = pcall(require, mod)
  if ok then
    return true
  end
  return false
end

local cfg = {
  leader = function() end,
  options = function() end,

  servers = function() end,
  plugins = function() end,
  keymaps = function() end,
  commands = function() end,
  autocommands = function() end,
  colorscheme = function() end,
}

M.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true, silent = true })
    vim.keymap.set("v", "<Space>", "<NOP>", { noremap = true, silent = true })
    vim.keymap.set("x", "<Space>", "<NOP>", { noremap = true, silent = true })
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

if not Neovim then
  Neovim = {}
end

local init = function(path)
  pcall(require, path)
  -- local ok, _ = pcall(require, path)
  -- if not ok then
  --   vim.notify("Failed to load config: %s" % path)
  -- end
end

Neovim.leader = function(key)
  cfg.leader = function()
    M.leader(key)
  end
end

Neovim.plugins = function(path)
  cfg.plugins = function()
    Packer.plugin_dir = path
    Packer.startup()
  end
end

Neovim.servers = function(path)
  cfg.servers = function()
    M.set_servers_path(path)
  end
end

Neovim.options = function(path)
  cfg.options = function()
    init(path)
  end
end

Neovim.keymaps = function(path)
  cfg.keymaps = function()
    init(path)
  end
end

Neovim.autocommands = function(path)
  cfg.autocommands = function()
    init(path)
  end
end

Neovim.commands = function(path)
  cfg.commands = function()
    init(path)
  end
end

Neovim.load = function()
  cfg.leader()
  cfg.options()
  cfg.servers()
  cfg.plugins()
  cfg.keymaps()
  cfg.commands()
  cfg.autocommands()
end

return M
