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
      "yamatsum/nvim-nonicons",
    },
  },
  -- language plugins
  { "folke/neodev.nvim" },
  -- utils
  { "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
}
