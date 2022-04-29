
local header = string.format([[
     .-.      _______                             .  '  *   .  . '
    {}``; |==|_______D                                  . *  -+-  .
    / ('        /|\                                 . '   * .    '  *
(  /  |        / | \                                    * .  ' .  .-+-
 \(_)_%s      /  |  \                                *   *  .   .      ]],"]]")
local footer =
"<?> to toggle help                                           draxel.io"
local default_footer =
([[Type query to filter items
<BS> deletes latest character from query
<Esc> resets current query
<Down>/<Up> and <M-j>/<M-k> move current item
<CR> executes action of current item
<C-c> closes this buffer
<?> to toggle help]])


local function footer_help(content)
  vim.keymap.set('n', "?", function()
    if MiniStarter.config.footer == default_footer then
        MiniStarter.config.footer = footer
    else
        MiniStarter.config.footer = default_footer
    end
    MiniStarter.refresh()
  end)
  return content
end

return function()
  local ok, starter = pcall(require, "mini.starter")
  if not ok then
    return
  end
  starter.setup({
    -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
    -- started with intent to show something else.
    autoopen = true,
    -- Whether to evaluate action of single active item
    evaluate_single = false,
    header = header,
    footer = footer,
    -- Items to be displayed. Should be an array with the following elements:
    -- - Item: table with <action>, <name>, and <section> keys.
    -- - Function: should return one of these three categories.
    -- - Array: elements of these three types (i.e. item, array, function).
    -- If `nil` (default), default items will be used (see |mini.starter|).
    items = {
      { name = "Edit new buffer", action = "enew", section = "Actions" },
      { name = "Update Plugins", action = "PackerSync", section = "Actions" },
      { name = "Config", action = "e ".. api.fs.join(vim.fn.stdpath('config').."/init.lua"), section = "Actions" },
      { name = "StartupTime", action = "StartupTime", section = "Actions" },
      { name = "Quit Neovim", action = "qall", section = "Actions" },
      starter.sections.recent_files(3, true),
      starter.sections.recent_files(5, false),
      starter.sections.sessions(3, true) -- Use this if you set up "mini.sessions"
    },
    -- Array  of functions to be applied consecutively to initial content.
    -- Each function should take and return content for "Starter" buffer (see
    -- |mini.starter| and |MiniStarter.content| for more details).
    content_hooks = {
      footer_help,
      starter.gen_hook.adding_bullet(" ", true),
      -- {horizontal} (string) One of "left", "center", "right". Default: "left".
      -- {vertical} (string) One of "top", "center", "bottom". Default: "top".
      starter.gen_hook.aligning("center", "top"),
      starter.gen_hook.padding(3, 2),
      -- starter.gen_hook.indexing("all", { "Actions" }),
    },
    -- Characters to update query. Each character will have special buffer
    -- mapping overriding your global ones. Be careful to not add `:` as it
    -- allows you to go into command mode.
    query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-.]],
  })
end
