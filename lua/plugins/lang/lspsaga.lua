local M = {
  "glepnir/lspsaga.nvim",
  branch = "main",
  function()
    local saga = require "lspsaga"
    saga.init_lsp_saga {
      -- your configuration
    }
  end,
}

return M
