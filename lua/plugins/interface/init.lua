local config = function(file)
  return require("plugins.interface." .. file)
end

local M = {
  { "kyazdani42/nvim-web-devicons" },
  { "antoinemadec/FixCursorHold.nvim" },
  { "olimorris/onedarkpro.nvim", config = config("onedarkpro") },
  { "folke/which-key.nvim", config = config("which-key") },
}

return M
