local M = {}

local function config(file)
  return require(("modules.editor.%s"):format(file))
end

M.hop = config("hop")
M.which_key = config("which-key")
M.legendary = config("legendary")
M.doom_one = config("doom-one")
M.nvim_tree = config("nvim-tree")
M.lualine = config("lualine")
M.hardline = config("hardline")
M.dressing = config("dressing")

return M
