local global = require("core.global")

local vim = vim

local function createdir()
  local data_path = {
    global.fs.join(global.fs.get_cache(), "backup"),
    global.fs.join(global.fs.get_cache(), "session"),
    global.fs.join(global.fs.get_cache(), "swap"),
    global.fs.join(global.fs.get_cache(), "tags"),
    global.fs.join(global.fs.get_cache(), "undo"),
  }
  if vim.fn.isdirectory(global.fs.get_cache()) == 0 then
    os.execute("mkdir -p " .. global.fs.get_cache())
  end
  for _, v in pairs(data_path) do
    if vim.fn.isdirectory(v) == 0 then
      os.execute("mkdir -p " .. v)
    end
  end
end

local mapleaders = function()
  vim.api.nvim_set_var("mapleader", " ")
  vim.api.nvim_set_var("maplocalleader", " ")
  vim.keymap.set({"x", "n"}, "<space>", "<Nop>", { noremap = true })
end

global["diagnostics"] = {}
global["diagnostics"]["path"] = vim.fn.getcwd()
global["diagnostics"]["method"] = "global"

local packer = require("core.pack")

-- pcall(function()
  -- fix cursorhold (plugins/fix_cursorhold_nvim.vim)
  vim.api.nvim_set_var("cursorhold_updatetime", 100)
  createdir()
  mapleaders()
  packer.load_pack()
  local init = require("conf")
  init()
-- end)
