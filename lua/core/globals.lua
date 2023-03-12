---@diagnostic disable: lowercase-global
vim = vim -- luacheck: ignore

prequire = function(mod)
  local status, lib = pcall(require, mod)
  if (status) then return lib end
  return nil
end

vscode = (function()
  if vim.fn.exists("g:vscode") == 1 then
    return true
  end
  return false
end)()

-- Save copied tables in `copies`, indexed by original table.
deepcopy = function(orig, copies)
  copies = copies or {}
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      if copies[orig] then
          copy = copies[orig]
      else
          copy = {}
          copies[orig] = copy
          for orig_key, orig_value in next, orig, nil do
              copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
          end
          setmetatable(copy, deepcopy(getmetatable(orig), copies))
      end
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end

oak = deepcopy(vim)

set = {}

set.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set({"n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.mapleader = c
end

set.options = function(opts)
  for scope, settings in pairs(opts) do
    for key, value in pairs(settings) do
      vim[scope][key] = value
    end
  end
end

path = {}

--- returns a string joined by the path seperator
--- @param ... any to join
--- @return string joined string
path.join = function(...)
  return table.concat({ ... }, package.config:sub(1, 1))
end

path.joinconfig = function(...)
  return path.join(vim.fn.stdpath("config"), ...)
end

path.joindata = function(...)
  return path.join(vim.fn.stdpath("data"), ...)
end

path.joincache = function(...)
  return path.join(vim.fn.stdpath("cache"), ...)
end

path.joinstate = function(...)
  return path.join(vim.fn.stdpath("state"), ...)
end
