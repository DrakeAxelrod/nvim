local M = {
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      local odp = prequire("onedarkpro")
      if odp then
        odp.setup({})
        vim.cmd [[colorscheme onedark_vivid]]
      end
    end
  },
}

return M
