-- vscode is true if we are running in vscode
local vscode = vim.fn.exists("g:vscode") == 1

local M = {}
local plugin = function(plugin) table.insert(M, plugin) end


plugin({
  "olimorris/onedarkpro.nvim",
  disable = vscode,
  config = function()
    vim.cmd("colorscheme onedark_vivid")
  end,
})

return M
