require("core")

local options = require("options")
for scope, settings in pairs(options) do
  for key, value in pairs(settings) do
    vim[scope][key] = value
  end
end

vim.pm.setup()
