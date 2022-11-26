return function()
  return {
    { "wbthomason/packer.nvim" },
    { "nvim-lua/popup.nvim" },
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    {
      "nathom/filetype.nvim",
      config = function()
        require("filetype").setup({})
      end,
    },
    {
      "antoinemadec/FixCursorHold.nvim",
      event = { "BufRead", "BufNewFile" },
      setup = function()
        vim.g.cursorhold_updatetime = 100
      end,
    },
    { "kyazdani42/nvim-web-devicons" },
    { "rktjmp/lush.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "wakatime/vim-wakatime" },
    {
      "rcarriga/nvim-notify",
      after = "popup.nvim",
      config = function()
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
end
