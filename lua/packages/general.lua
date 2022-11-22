return {
    { "nvim-lua/popup.nvim" },
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "kkharji/sqlite.lua" },
    { "romgrk/fzy-lua-native" },
    { "nathom/filetype.nvim",
      function()
        require("filetype").setup({})
      end,
    },
    { "antoinemadec/FixCursorHold.nvim",
      setup = function()
        vim.g.cursorhold_updatetime = 100
      end,
    },
    { "rcarriga/nvim-notify",
      requires = "nvim-lua/popup.nvim",
      function()
        vim.notify = require("notify")
        vim.notify.setup({
          stages = "slide",
          on_open = nil,
          on_close = nil,
          render = "default",
          timeout = 1000,
          background_colour = "Normal",
          minimum_width = 50,
          icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
          },
        })
      end
    },
}
