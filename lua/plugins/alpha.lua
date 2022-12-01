local M = {}

table.insert(M, {
  "goolord/alpha-nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  function()
    require "alpha".setup(require "alpha.themes.startify".config)
  end
})

return M
