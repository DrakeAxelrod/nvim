local config = function(file)
  return require("plugins.misc." .. file)
end

local M = {
  { "antoinemadec/FixCursorHold.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "rcarriga/nvim-notify", config = config("notify") },
}

return M
