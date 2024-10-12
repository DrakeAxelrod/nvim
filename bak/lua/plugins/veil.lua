local config = function()
  local veil = require("veil")
  local builtin = require("veil.builtin")
  veil.setup({
    sections = {
      builtin.sections.animated(builtin.headers.frames_nvim, {
        hl = { fg = "#5de4c7" },
      }),
      -- builtin.sections.oldfiles(),
      builtin.sections.buttons({
        {
          icon = "",
          text = "Find Files",
          shortcut = "f",
          callback = function()
            require("telescope.builtin").find_files()
          end,
        },
        {
          icon = "",
          text = "Find Word",
          shortcut = "w",
          callback = function()
            require("telescope.builtin").live_grep()
          end,
        },
        {
          icon = "",
          text = "Buffers",
          shortcut = "b",
          callback = function()
            require("telescope.builtin").buffers()
          end,
        },
        {
          icon = "",
          text = "Config",
          shortcut = "c",
          callback = function()
            require("telescope").extensions.file_browser.file_browser({
              path = vim.fn.stdpath("config"),
            })
          end,
        },
        { -- quit
          icon = "",
          text = "Quit",
          shortcut = "q",
          callback = function()
            vim.cmd("qa!")
          end,
        },
      }, { spacing = 2 }),
    },
    mappings = {},
    startup = true,
    listed = false,
  })
end

return {
  "willothy/veil.nvim",
  -- lazy = true,
  dependencies = {
    -- All optional, only required for the default setup.
    -- If you customize your config, these aren't necessary.
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "yamatsum/nvim-nonicons",
      requires = { "kyazdani42/nvim-web-devicons" },
    },
  },
  -- config = true,
  config = config,
  -- or configure with:
  opts = {},
}
