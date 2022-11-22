return {
  { "junnplus/lsp-setup.nvim",
    requires = {
      { "neovim/nvim-lspconfig",
        -- function()
        --   local lspconfig = require("lspconfig")

        -- end
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  -- language plugins
  { "folke/neodev.nvim" }
}
