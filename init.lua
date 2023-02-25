
-- vscode is true if we are running in vscode
local vscode = vim.fn.exists("g:vscode") == 1

local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

local fn = require("utils.fn")
fn.leader("<space>")
require("opts")
require("plugins")
if not vscode then
  require("maps")
  require("cmds")
end

require("autocmds")
require("packer_compiled")

if vscode then
  vim.opt.showmode = true
end
