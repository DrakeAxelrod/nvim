local M = {
  "olimorris/onedarkpro.nvim"
}

M.config = function()
  local status, odp = pcall(require, "onedarkpro")
  if not status then
    return
  end

  odp.setup({})
  vim.cmd [[colorscheme onedark_vivid]]
end

return M
