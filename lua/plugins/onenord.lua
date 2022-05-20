return function()
  local c = require("core").colors
  require("onenord").setup({
    theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
    borders = true, -- Split window borders
    fade_nc = false, -- Fade non-current windows, making them more distinguishable
    styles = {
      comments = "italic",
      strings = "NONE",
      keywords = "NONE",
      functions = "italic",
      variables = "bold",
      diagnostics = "underline",
    },
    disable = {
      background = false, -- Disable setting the background color
      cursorline = false, -- Disable the cursorline
      eob_lines = false, -- Hide the end-of-buffer lines
    },
    custom_highlights = {
      CursorLineNr = { fg = c.red },
    },
    custom_colors = {},
  })
end
