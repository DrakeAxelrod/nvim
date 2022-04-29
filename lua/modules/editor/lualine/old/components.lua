local conditions = require "modules.editor.lualine.conditions"
local icons = require("lib.icons")
local colors = require("lib.colors")
local M = {}
M.buffers = {
  {
    "buffers",
    show_filename_only = true, -- Shows shortened relative path when set to false.
    hide_filename_extension = false, -- Hide filename extension when set to true.
    show_modified_status = true, -- Shows indicator when the buffer is modified.
    mode = 0, -- 0: Shows buffer name
    -- 1: Shows buffer index
    -- 2: Shows buffer name + buffer index
    max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
    -- it can also be a function that returns
    -- the value of `max_length` dynamically.
    filetype_names = {
      TelescopePrompt = "Telescope",
      dashboard = "Dashboard",
      packer = "Packer",
      fzf = "FZF",
      alpha = "Alpha",
    }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
    buffers_color = {
      -- Same values as the general color option can be used here.
      active = "lualine_{section}_normal", -- Color for active buffer.
      inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
    },
  },
}

M.diagnostics = {
  "diagnostics",
  -- Table of diagnostic sources, available sources are:
  --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
  -- or a function that returns a table as such:
  --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
  sources = { "nvim_diagnostic" },
  -- Displays diagnostics for the defined severity types
  sections = {
    "error",
    "warn",
    'info',
    'hint'
  },
  symbols = {
    error = icons.diagnostics.error .. " ",
    warn = icons.diagnostics.warning .. " ",
    info  = icons.diagnostics.information .. " ",
    hint  = icons.diagnostics.hint .. " "
  },
  diagnostics_color = {
    -- Same values as the general color option can be used here.
    error = "DiagnosticError", -- Changes diagnostics' error color.
    warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
    info = "DiagnosticInfo", -- Changes diagnostics' info color.
    hint = "DiagnosticHint", -- Changes diagnostics' hint color.
  },
  colored = false, -- Displays diagnostics status in color if set to true.
  update_in_insert = false, -- Update diagnostics in insert mode.
  always_visible = true, -- Show diagnostics even if there are none.
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

M.diff = {
  "diff",
  source = diff_source,
  symbols = {

    added = icons.git.add .. " ",
    modified = icons.git.mod .. " ",
    removed = icons.git.remove .. " ",
  },
  diff_color = {
    added = { fg = colors.color2},
    modified = { fg = colors.color3 },
    removed = { fg = colors.color1 },
  },
  colored = false,
  cond = conditions.hide_in_width,
}

M.treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return icons.ui.tree
    end
    return ""
  end,
  cond = conditions.hide_in_width,
}

-- M.lsp = {
--   function(msg)
--     msg = msg or "LS Inactive"
--     local buf_clients = vim.lsp.buf_get_clients()
--     if next(buf_clients) == nil then
--       -- TODO: clean up this if statement
--       if type(msg) == "boolean" or #msg == 0 then
--         return "LS Inactive"
--       end
--       return msg
--     end
--     local buf_ft = vim.bo.filetype
--     local buf_client_names = {}

--     -- add client
--     for _, client in pairs(buf_clients) do
--       if client.name ~= "null-ls" then
--         table.insert(buf_client_names, client.name)
--       end
--     end

--     -- add formatter
--     local formatters = require "lvim.lsp.null-ls.formatters"
--     local supported_formatters = formatters.list_registered(buf_ft)
--     vim.list_extend(buf_client_names, supported_formatters)

--     -- add linter
--     local linters = require "lvim.lsp.null-ls.linters"
--     local supported_linters = linters.list_registered(buf_ft)
--     vim.list_extend(buf_client_names, supported_linters)

--     return "[" .. table.concat(buf_client_names, ", ") .. "]"
--   end,
--   cond = conditions.hide_in_width,
-- }

M.mode = {
  "mode",
  fmt = function(str)
    return "[" .. str .. "]"
  end,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

M.branch = {
  "FugitiveHead",
  icons_enabled = true,
  icon = icons.git.branch,
  cond = conditions.hide_in_width,
}

M.filename = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 0, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path
  -- color = { fg = colors.fg, bg = colors.bg },
  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = "[+]", -- Text to show when the file is modified.
    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
    unnamed = "[No Name]", -- Text to show for unnamed buffers.
  },
}

M.location = {
  "location",
  cond = conditions.hide_in_width,
  padding = { left = 0, right = 0 },
}

M.progress = {
  "progress",
  cond = conditions.hide_in_width,
  padding = { left = 0, right = 1 },
}

M.scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    -- local chars = { "🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘" }
    -- local chars = { "⠄ ", "⠤ ", "⠦ ", "⠶ ", "⠷ ", "⠿ ", "⠿⠄", "⠿⠤", "⠿⠦", "⠿⠶", "⠿⠷", "⠿⠿" }
    local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  cond = nil,
}

M.spaces = {
  function()
    if not vim.api.nvim_buf_get_option(0, "expandtab") then
      return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
    end
    local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
    if size == 0 then
      size = vim.api.nvim_buf_get_option(0, "tabstop")
    end
    return ("Spaces: %s"):format(size)
  end,
  cond = conditions.hide_in_width,
}

M.encoding = {
  "o:encoding",
  fmt = string.upper,
  cond = conditions.hide_in_width,
}

return M
