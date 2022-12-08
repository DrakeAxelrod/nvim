return function()
  local wilder = require("wilder")
  local accent_color = "#de73ff"
  wilder.setup({ modes = { ":", "/", "?" } })
  wilder.set_option("use_python_remote_plugin", 0) -- Disable Python remote plugin
  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.cmdline_pipeline({
        fuzzy = 1,
        fuzzy_filter = wilder.lua_fzy_filter(),
      }),
      wilder.vim_search_pipeline()
    ),
  })
  wilder.set_option(
    "renderer",
    wilder.wildmenu_renderer({
      highlighter = wilder.lua_fzy_highlighter(),
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", {
          { a = 1 },
          { a = 1 },
          { foreground = accent_color, background = "Pmenu" },
        }),
      },
      separator = " · ",
      left = { " ", wilder.wildmenu_spinner(), " " },
      right = { " ", wilder.wildmenu_index() },
    })
  )
end
