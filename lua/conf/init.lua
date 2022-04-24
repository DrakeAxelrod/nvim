-- local keymaps = require("conf.global.keys")
local group = vim.api.nvim_create_augroup("XYZ", {
  clear = true,
})

local function nvim_options()
  local init = require "conf.opts"
  init()
end

local function keymaps()
  local mappings = require "conf.keys"
  mappings.insert()
  mappings.normal()
  mappings.command()
  mappings.visual()
  mappings.visual_block()
  mappings.terminal()
end

local function events()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dart", "ruby", "yaml", "c", "cpp", "objc", "objcpp" },
    command = "setlocal ts=2 sw=2",
    group = group,
  })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "Trouble",
      "Outline",
      "git",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "NeogitStatus",
    },
    command = "setlocal colorcolumn=0 nocursorcolumn",
    group = group,
  })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dashboard" },
    command = "setlocal nowrap",
    group = group,
  })
end

local function langs()
  vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    command = [[lua require("langs").setup()]],
    group = group,
  })
end

local function commands()
  vim.cmd [[command! SetGlobalPath lua require("core.globals").fs.set_global_path()]]
  vim.cmd [[command! SetWindowPath lua require("core.globals").fs.set_window_path()]]
  vim.cmd(
    ([[command! Config execute ":e %s"]]):format(
      table.concat({ vim.fn.stdpath "config", "lua", "conf", "init.lua" }, package.config:sub(1, 1))
    )
  )
end

local function common()
  vim.g.indent_blankline_char = "▏"
  vim.g.indentLine_char = "▏"
  vim.g.gitblame_enabled = 0
  vim.g.gitblame_highlight_group = "CursorLine"
end

-- M["ctrlspace_pre_config_global"] = function()
--  vim.g.ctrlspace_use_tablineend = 1
--  vim.g.CtrlSpaceLoadLastWorkspaceOnStart = 1
--  vim.g.CtrlSpaceSaveWorkspaceOnSwitch = 1
--  vim.g.CtrlSpaceSaveWorkspaceOnExit = 1
--  vim.g.CtrlSpaceUseTabline = 0
--  vim.g.CtrlSpaceUseArrowsInTerm = 1
--  vim.g.CtrlSpaceUseMouseAndArrowsInTerm = 1
--  vim.g.CtrlSpaceGlobCommand = "rg --files --follow --hidden -g '!{.git/*,node_modules/*,target/*,vendor/*}'"
--  vim.g.CtrlSpaceIgnoredFiles = "\v(tmp|temp)[\\/]"
--  vim.g.CtrlSpaceSymbols = {
--    CS = " ",
--    Sin = "",
--    All = "",
--    Vis = "★",
--    File = "",
--    Tabs = "ﱡ",
--    CTab = "ﱢ",
--    NTM = "⁺",
--    WLoad = "ﰬ",
--    WSave = "ﰵ",
--    Zoom = "",
--    SLeft = "",
--    SRight = "",
--    BM = "",
--    Help = "",
--    IV = "",
--    IA = "",
--    IM = " ",
--    Dots = "ﳁ",
--  }
-- end

return function()
  nvim_options()
  keymaps()
  events()
  langs()
  commands()
  common()
end
