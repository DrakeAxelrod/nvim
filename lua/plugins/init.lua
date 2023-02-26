local M = {}

local plugin = function(plugin)
  plugin.cfile = plugin.cfile or ""
  -- vscode is true if we are running in vscode
  plugin.cond = function()
    if vim.fn.exists("g:vscode") == 1 then return false end
    return true
  end
  if plugin.cfile ~= "" then
    plugin.config = require("plugins." .. plugin.cfile)
  end
  -- remove the config_file key from the table
  plugin.cfile = nil
  table.insert(M, plugin)
end

-- ===========================[[ Utility ]]=========================== --

plugin({ "lewis6991/impatient.nvim" })
plugin({ "nvim-lua/plenary.nvim" })
plugin({ "nvim-lua/popup.nvim" })
plugin({ "kyazdani42/nvim-web-devicons" })
plugin({ "antoinemadec/FixCursorHold.nvim" })
plugin({ "rcarriga/nvim-notify", cfile = "notify" })
plugin({ "olimorris/onedarkpro.nvim", cfile = "onedarkpro" })

-- ===========================[[ Interface ]]=========================== --

return M
