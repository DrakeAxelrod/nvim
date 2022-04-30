-- https://github.com/rcarriga/nvim-notify
return function(notify)
  local icons = require("lib.icons")
  vim.notify = notify
  notify.setup({
    stages = "slide",
    on_open = nil,
    on_close = nil,
    render = "default",
    timeout = 5000,
    background_colour = "Normal",
    minimum_width = 10,
    icons = {
      ERROR = icons.diagnostics.error,
      WARN = icons.diagnostics.warning,
      INFO = icons.diagnostics.information,
      DEBUG = icons.ui.bug,
      TRACE = icons.ui.pencil,
    },
  })
end
