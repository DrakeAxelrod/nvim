--[[
Links:
- https://github.com/nvim-tree/nvim-web-devicons
- https://github.com/rachartier/tiny-devicons-auto-colors.nvim
]]

return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      -- -- your personnal icons can go here (to override)
      -- -- you can specify color or cterm_color instead of specifying both of them
      -- -- DevIcon will be appended to `name`
      -- override = {
      --   zsh = {
      --     icon = "",
      --     color = "#428850",
      --     cterm_color = "65",
      --     name = "Zsh"
      --   }
      -- };
      -- -- globally enable different highlight colors per icon (default to true)
      -- -- if set to false all icons will have the default icon's color
      -- color_icons = true;
      -- -- globally enable default icons (default to false)
      -- -- will get overriden by `get_icons` option
      -- default = true;
      -- -- globally enable "strict" selection of icons - icon will be looked up in
      -- -- different tables, first by filename, and if not found by extension; this
      -- -- prevents cases when file doesn't have any extension but still gets some icon
      -- -- because its name happened to match some extension (default to false)
      -- strict = true;
      -- -- set the light or dark variant manually, instead of relying on `background`
      -- -- (default to nil)
      -- variant = "light|dark";
      -- -- same as `override` but specifically for overrides by filename
      -- -- takes effect when `strict` is true
      -- override_by_filename = {
      --   [".gitignore"] = {
      --     icon = "",
      --     color = "#f1502f",
      --     name = "Gitignore"
      --   }
      -- };
      -- -- same as `override` but specifically for overrides by extension
      -- -- takes effect when `strict` is true
      -- override_by_extension = {
      --   ["log"] = {
      --     icon = "",
      --     color = "#81e043",
      --     name = "Log"
      --   }
      -- };
      -- -- same as `override` but specifically for operating system
      -- -- takes effect when `strict` is true
      -- override_by_operating_system = {
      --   ["apple"] = {
      --     icon = "",
      --     color = "#A2AAAD",
      --     cterm_color = "248",
      --     name = "Apple",
      --   },
      -- };
    }
  },
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    opt = function()
      local c = require("colors")
      local colors = {
        c.vivid.red,
        c.vivid.orange,
        c.vivid.yellow,
        c.vivid.green,
        c.vivid.cyan,
        c.vivid.blue,
        c.vivid.purple,
      }
      -- dump(colors)
      return {
        -- A table of color codes that the plugin will use to assign colors to devicons.
        -- It is preferable to use a color palette from a theme, but you can also define it yourself.
        -- If not provided, the plugin will fetch highlights from the current theme to generate a color palette.
        -- colors = theme_colors,
        colors = colors,

        -- Adjusts factors to get a better color matching.
        factors = {
          lightness = 1.75, -- Adjust the lightness factor.
          chroma = 1,       -- Adjust the chroma factor.
          hue = 1.25, 	  -- Adjust the hue factor.
        },
        -- Cache greatly improve the performance of the plugin. It saves all the matchings in a file.
        cache = {
          enabled = true,
          path = vim.fn.stdpath("cache") .. "/tiny-devicons-auto-colors-cache.json",
        },
        -- Precise search can result in better colors matching by automatically tweaking the factors.
        -- It's nice to let it enabled when cache is enabled.
        precise_search = {
          enabled = true,
          iteration = 10,   -- It goes hand in hand with 'precision'
          precision = 20,   -- The higher the precision, better the search is
          threshold = 23,   -- Threshold to consider a color as a match (larger is more permissive)
        },
        -- A list of icon name to ignore.
        -- You can refer to: https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons/icons-default.lua
        -- to get the icon's name.
        --
        -- example:
        -- ignore = {
        -- 		"lua",
        -- 		"vim",
        -- 		"cs",
        -- 		"json"
        -- }
        ignore = {},
        -- Automatically reload the colors when the colorscheme changes.
        -- Warning: when reloaded, it overrides the colors that you set in `colors`.
        -- It can produce varying results according to the colorscheme, so if you always use the same colorscheme, you can keep it disabled.
        autoreload = false,
      }
    end
    -- config = function()
    --     require('tiny-devicons-auto-colors').setup()
    -- end
  }
}