return {
  {
    "rcarriga/nvim-notify",
    after = { "nvim-lua/popup.nvim", "yamatsum/nvim-nonicons"},
    function()
      -- local icons = require "nvim-nonicons"
      local utils = require("utils")
      local icons = utils.icons()
      vim.notify = require("notify")
      vim.notify.setup({
        stages = "slide",
        on_open = nil,
        on_close = nil,
        render = "default",
        timeout = 1000,
        background_colour = "Normal",
        minimum_width = 50,
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      })
    end
  },
}
