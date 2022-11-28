return {
  {
    "rcarriga/nvim-notify",
    after = { "nvim-lua/popup.nvim", "yamatsum/nvim-nonicons"},
    function()
      local icons = require("core").utils.icons
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
          ERROR = icons.diagnostics.Error,
          WARN = icons.diagnostics.Warn,
          INFO = icons.diagnostics.Info,
          DEBUG = icons.diagnostics.Debug,
          TRACE = icons.diagnostics.Trace,
        },
      })
    end
  },
}
