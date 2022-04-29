local icons = require("lib.icons")

local ok, notify = pcall(require, "notify")
if not ok then
  return
end
  vim.notify = notify
  notify.setup({
  stages = "fade_in_slide_out",
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
