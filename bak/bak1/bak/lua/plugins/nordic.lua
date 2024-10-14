-- local setup = function()
--   require("nordic").load()
-- end

-- return setup

return {
  "AlexvZyl/nordic.nvim",
  config = function()
    local nordic = require("nordic")
    nordic.load()
  end,
}
