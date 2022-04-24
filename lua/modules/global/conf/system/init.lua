local M = {}

function M.nvim_notify()
  local notify = require("notify")
  vim.notify = notify
  notify.setup({
    stages = "slide",
    on_open = nil,
    on_close = nil,
    render = "default",
    timeout = 5000,
    background_colour = "Normal",
    minimum_width = 50,
    icons = {
      ERROR = "", -- "", -- ""
      WARN = "", -- "", -- ""
      INFO = "", -- "", -- ""
      DEBUG = "", -- "", --"", -- ""
      TRACE = "" --"", -- "", -- ""
    },
  })
end

return M
