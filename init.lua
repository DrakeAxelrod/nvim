local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

local fn = require("utils.fn")
fn.leader("<space>")
require("opts")
require("plugins")
require("maps")
require("cmds")
require("autocmds")

