return {
  "goolord/alpha-nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local utils = require("alpha.utils")
    local theta = require("alpha.themes.theta")
    -- local icon, color  ("init.lua", "lua")
    local get_icon_color = require('nvim-web-devicons').get_icon_color

    local function colorize(logo, colors, logoColors)
      -- helper function for utf8 chars
      local function get_char_len(s, pos)
        local byte = string.byte(s, pos)
        if not byte then
          return nil
        end
        return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
      end

      header = dashboard.section.header
      -- dashboard.section.header.val = logo
      header.val = logo

      for key, color in pairs(colors) do
        local name = "Alpha" .. key
        vim.api.nvim_set_hl(0, name, color)
        colors[key] = name
      end

      -- dashboard.section.header.opts.hl = {}
      header.opts.hl = {}
      for i, line in ipairs(logoColors) do
        local highlights = {}
        local pos = 0

        for j = 1, #line do
          local opos = pos
          pos = pos + get_char_len(logo[i], opos + 1)

          local color_name = colors[line:sub(j, j)]
          if color_name then
            table.insert(highlights, { color_name, opos, pos })
          end
        end

        -- table.insert(dashboard.section.header.opts.hl, highlights)
        table.insert(header.opts.hl, highlights)
      end
      -- return dashboard.header
      return header
    end

    local header = colorize({
      [[  ███       ███  ]],
      [[  ████      ████ ]],
      [[  ████     █████ ]],
      [[ █ ████    █████ ]],
      [[ ██ ████   █████ ]],
      [[ ███ ████  █████ ]],
      [[ ████ ████ ████ ]],
      [[ █████  ████████ ]],
      [[ █████   ███████ ]],
      [[ █████    ██████ ]],
      [[ █████     █████ ]],
      [[ ████      ████ ]],
      [[  ███       ███  ]],
      [[                    ]],
      [[  N  E  O  V  I  M  ]],
    }, {
      ["b"] = { fg = "#3399ff", ctermfg = 33 },
      ["a"] = { fg = "#53C670", ctermfg = 35 },
      ["g"] = { fg = "#39ac56", ctermfg = 29 },
      ["h"] = { fg = "#33994d", ctermfg = 23},
      ["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29},
      ["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
      ["k"] = { fg = "#30A572", ctermfg = 36},
    }, {
      [[  kkkka       gggg  ]],
      [[  kkkkaa      ggggg ]],
      [[ b kkkaaa     ggggg ]],
      [[ bb kkaaaa    ggggg ]],
      [[ bbb kaaaaa   ggggg ]],
      [[ bbbb aaaaaa  ggggg ]],
      [[ bbbbb aaaaaa igggg ]],
      [[ bbbbb  aaaaaahiggg ]],
      [[ bbbbb   aaaaajhigg ]],
      [[ bbbbb    aaaaajhig ]],
      [[ bbbbb     aaaaajhi ]],
      [[ bbbbb      aaaaajh ]],
      [[  bbbb       aaaaa  ]],
      [[                    ]],
      [[  a  a  a  b  b  b  ]],
    })

    local mru = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Recent files",
          opts = {
            hl = "SpecialComment",
            shrink_margin = false,
            position = "center",
          },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { theta.mru(0, vim.fn.getcwd()) }
          end,
          opts = { shrink_margin = false },
        },
      },
    }

    local buttons = {
      type = "group",
        val = {
          { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
          { type = "padding", val = 1 },
          dashboard.button("e",       "  New File",        ":ene<cr>"),
          dashboard.button("SPC f f", "  Find File",       ":Telescope find_files<cr>"),
          dashboard.button("SPC f f", "󰈞  Find",             ":Telescope fd<cr>"),
          dashboard.button("SPC f g", "  Live Grep",       ":Telescope live_grep<cr>"),
          dashboard.button("c",       "  Configuration",   ":lua vim.fn.stdpath('config')<cr>"),
          dashboard.button("l",       "󰒲  Lazy",            ":Lazy<cr>"),
          dashboard.button("q",       "✗  Quit",            ":qa<cr>"),
        },
        position = "center",
    }
    return {
      layout = {
        { type = "padding", val = 4 },
        header,
        { type = "padding", val = 1 },
        mru,
        { type = "padding", val = 1 },
        buttons,
      },
      opts = {
        margin = 5,
        setup = function()
        vim.api.nvim_create_autocmd('DirChanged', {
          pattern = '*',
          group = "alpha_temp",
          callback = function ()
            require('alpha').redraw()
            vim.cmd('AlphaRemap')
          end,
        })
        end,
      },
    }
  end
}