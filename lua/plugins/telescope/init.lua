return function()
  local telescope = require("telescope")
  local config = require("plugins.telescope.config")
  
  pcall(telescope.load_extension, "notify")
  pcall(telescope.load_extension, "ui-select")
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "smart_history")
  pcall(telescope.load_extension, "fzy_native")
  pcall(telescope.load_extension, "noice")
  pcall(telescope.load_extension, "file_browser")
  telescope.setup(config)
end
