
local M = {}

--- returns a string joined by the path seperator
--- @param ... any to join
--- @return string joined string
M.joinpath = function(...)
  return table.concat({ ... }, package.config:sub(1, 1))
end

M.get_relative_dir = function()
  local init_path = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])"):sub(1, -2)
end

--- reads all files and directories in a directory and returns them as a table
--- @param dir string - the path to the directory
--- @return table
M.readdir = function(dir)
  local packages_dir = M.joinpath(vim.fn.stdpath "config", "lua", dir)
  if vim.fn.empty(vim.fn.glob(packages_dir)) > 0 then
    return {}
  end
  return vim.tbl_map(function(file)
    return file:match "(.*)%.lua" or file
  end, vim.fn.readdir(packages_dir))
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

M.keycmd = function(str)
  return "<cmd>" .. str .. "<CR>"
end

M.keyluacmd = function(str)
  return "<cmd>lua " .. str .. "<CR>"
end

M.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true, silent = true })
    vim.keymap.set("v", "<Space>", "<NOP>", { noremap = true, silent = true })
    vim.keymap.set("x", "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.mapleader = c
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


return M
