local M = {}

local before = {
  { "nvim-telescope/telescope-fzy-native.nvim" },
  {
    "nvim-telescope/telescope-smart-history.nvim",
    requires = { "kkharji/sqlite.lua" },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" },
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "rcarriga/nvim-notify" },
}

table.insert(M, {
  "nvim-telescope/telescope.nvim",
  requires = before,
  function()
    local telescope = require "telescope"
    local config = require "plugins.telescope.config"
    telescope.load_extension "notify"
    telescope.load_extension "ui-select"
    telescope.load_extension "frecency"
    telescope.load_extension "smart_history"
    telescope.load_extension "fzy_native"
    telescope.setup(config)
  end,
})

return M
