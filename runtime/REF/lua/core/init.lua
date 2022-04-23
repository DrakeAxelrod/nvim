local global = require("core.global")
local fs = require("core.fs")
local fn = require("core.fn")
local vim = vim
local function createdir()
  local data_path = {
    fs.join(global.path.cache, "backup"),
    fs.join(global.path.cache, "session"),
    fs.join(global.path.cache, "swap"),
    fs.join(global.path.cache, "tags"),
    fs.join(global.path.cache, "undo"),
  }
  if vim.fn.isdirectory(global.path.cache) == 0 then
    os.execute("mkdir -p " .. global.path.cache)
  end
  for _, v in pairs(data_path) do
    if vim.fn.isdirectory(v) == 0 then
      os.execute("mkdir -p " .. v)
    end
  end
end
local leader_map = function()
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
  vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end
global["diagnostics"] = {}
global["diagnostics"]["path"] = vim.fn.getcwd()
global["diagnostics"]["method"] = "global"
local packer = require("core.pack")
local xyz = function()
  createdir()
  leader_map()
  packer.load_pack()
  fn.configs()
end

xyz()
