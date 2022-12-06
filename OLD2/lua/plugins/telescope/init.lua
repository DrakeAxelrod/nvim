return function()
  local telescope = require("telescope")
  local config = require("plugins.telescope.config")
  
  local extensions = {
    "notify",
    "ui-select",
    "frecency",
    "smart_history",
    "fzy_native",
    "noice",
    "file_browser",
    "cheatsheet",
  }
  for _, ext in ipairs(extensions) do
    pcall(telescope.load_extension, ext)
  end

  telescope.setup(config)
end
