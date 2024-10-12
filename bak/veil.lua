local icons = require("icons")

return {
  "willothy/veil.nvim",
  -- lazy = true,
  enabled = false,
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
  -- config = function()
  --   local veil = require("veil")
  --   local builtin = require("veil.builtin")
  --   veil.setup({
  --     sections = {
  --       builtin.sections.animated(builtin.headers.frames_nvim, {
  --         hl = { fg = "#5de4c7" },
  --       }),
  --       -- builtin.sections.oldfiles(),
  --       builtin.sections.buttons({
  --         {
  --           icon = "",
  --           text = "Find Files",
  --           shortcut = "f",
  --           callback = function()
  --             require("telescope.builtin").find_files()
  --           end,
  --         },
  --         {
  --           icon = "",
  --           text = "Find Word",
  --           shortcut = "w",
  --           callback = function()
  --             require("telescope.builtin").live_grep()
  --           end,
  --         },
  --         {
  --           icon = "",
  --           text = "Buffers",
  --           shortcut = "b",
  --           callback = function()
  --             require("telescope.builtin").buffers()
  --           end,
  --         },
  --         {
  --           icon = "",
  --           text = "Config",
  --           shortcut = "c",
  --           callback = function()
  --             require("telescope").extensions.file_browser.file_browser({
  --               path = vim.fn.stdpath("config"),
  --             })
  --           end,
  --         },
  --         { -- quit
  --           icon = "",
  --           text = "Quit",
  --           shortcut = "q",
  --           callback = function()
  --             vim.cmd("qa!")
  --           end,
  --         },
  --       }, { spacing = 2 }),
  --     },
  --     mappings = {},
  --     startup = true,
  --     listed = false,
  --   })
  -- end,
  -- or configure with:
  opts = function()
    local veil = require("veil")
    local builtin = require("veil.builtin")
    local odp = require("onedarkpro.helpers")
    local colors = {
      green = "#5de4c7",
      purple = "#c678dd",
      red = "#e06c75",
      yellow = "#d19a66",
      blue = "#61afef",
      cyan = "#56b6c2",
    }
    -- dump(odp.get_colors())
    -- local color = odp and odp.lighten("purple", 7, "onedark_vivid") or "#5de4c7"
    if odp then
      colors = odp.get_colors()
    end
    -- dump(colors)
    return {
      sections = {
        builtin.sections.animated(
          -- builtin.headers.frames_nvim,
          builtin.headers.frames_veil1,
          { hl = { fg = colors.red } }
        ),
        builtin.sections.oldfiles({
          max = 5,
          align = "a",
          hl = { fg = colors.gray },
          focused_hl = { fg = colors.black, bg = colors.blue },
        }),
        builtin.sections.buttons({
          {
            icon = "", --"", --"",
            text = "Files",
            shortcut = "f",
            callback = function()
              require("telescope.builtin").find_files()
            end,
          },
          {
            icon = "", --"",
            text = "Word",
            shortcut = "w",
            callback = function()
              require("telescope.builtin").live_grep()
            end,
          },
          {
            icon = "", --"",
            text = "Buffers",
            shortcut = "b",
            callback = function()
              require("telescope.builtin").buffers()
            end,
          },
          {
            icon = "", -- "",
            text = "Config",
            shortcut = "c",
            callback = function()
              require("telescope").extensions.file_browser.file_browser({
                path = vim.fn.stdpath("config"),
              })
            end,
          },
          { -- quit
            icon = "✗", --"✗", -- "",
            text = "Quit",
            shortcut = "q",
            callback = function()
              vim.cmd("qa!")
            end,
          },
        }, {
          spacing = 2,
          align = "center",
          hl = { fg = colors.gray },
          focused_hl = { fg = colors.black, bg = colors.blue },
        }),
        -- builtin.sections.oldfiles(),
      },
      mappings = {},
      startup = true,
      listed = false,
    }
  end,
}
