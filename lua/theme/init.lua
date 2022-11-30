local M = {}
local highlights = require "theme.highlights"

M.setup = function()
  vim.cmd "hi clear"

  vim.o.background = "dark"
  if vim.fn.exists "syntax_on" then
    vim.cmd "syntax reset"
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "theme"

  highlights.set_highlights()
end

return M
