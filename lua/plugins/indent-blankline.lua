return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = function()
    -- local highlight = {
    --   "CursorColumn",
    --   "Whitespace",
    -- }
    return {
      indent = {
        char = "│",
        tab_char = nil,
        -- highlight = highlight,
        smart_indent_cap = true,
        priority = 1,
        repeat_linebreak = true,
      },
      whitespace = {
        -- highlight = highlight,
        remove_blankline_trail = true,
      },
      scope = {
        show_start = true,
        show_end = true
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    }
  end,
  -- enabled = false,
  -- event = "LazyFile",
  -- opts = function()
  --   -- LazyVim.toggle.map("<leader>ug", {
  --   --   name = "Indention Guides",
  --   --   get = function()
  --   --     return require("ibl.config").get_config(0).enabled
  --   --   end,
  --   --   set = function(state)
  --   --     require("ibl").setup_buffer(0, { enabled = state })
  --   --   end,
  --   -- })

  --   return {
  --     -- indent = {
  --     --   char = "│",
  --     --   tab_char = "│",
  --     -- },
  --     indent = {
  --       char = "▎",
  --       tab_char = nil,
  --       highlight = "IblIndent",
  --       smart_indent_cap = true,
  --       priority = 1,
  --       repeat_linebreak = true,
  --     },
  --     whitespace = {
  --       highlight = "IblWhitespace",
  --       remove_blankline_trail = true,
  --     },
  --     scope = {
  --       show_start = true,
  --       show_end = true
  --     },
  --     exclude = {
  --       filetypes = {
  --         "help",
  --         "alpha",
  --         "dashboard",
  --         "neo-tree",
  --         "Trouble",
  --         "trouble",
  --         "lazy",
  --         "mason",
  --         "notify",
  --         "toggleterm",
  --         "lazyterm",
  --       },
  --     },
  --   }
  -- end,
  main = "ibl",
}