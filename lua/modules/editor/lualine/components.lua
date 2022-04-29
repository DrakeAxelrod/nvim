local M = {}
local fn = require("modules.editor.lualine.fn")

local gps_ok, gps = pcall(require, "nvim-gps")
if gps_ok then
  gps.setup()
end

local icons = require("lib.icons")

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

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostics.error .. " ",
    warn = icons.diagnostics.warning .. " ",
    info = icons.diagnostics.information .. " ",
    hint = icons.diagnostics.hint .. " "
  },
  sections = {
    'error',
    'warn',
    -- 'info',
    -- 'hint'
  },
  colored = false, -- Displays diagnostics status in color if set to true.
  update_in_insert = false, -- Update diagnostics in insert mode.
  always_visible = true, -- Show diagnostics even if there are none.
  -- diagnostics_color = {
  --   error = {
  --     fg = colors.color_08,
  --   },
  --   warn = {
  --     fg = colors.color_04,
  --   },
  --   hint = {
  --     fg = colors.color_07,
  --   },
  --   info = {
  --     fg = colors.color_07,
  --   },
  -- },
  cond = fn.hide_component,
  fmt = fn.trunc(90, 0, nil, true),
  padding = { left = 1, right = 0 },
}

M.diff = {
  "diff",
  source = diff_source,
  symbols = {
    added = icons.git.add .. " ",
    modified = icons.git.mod .. " ",
    removed = icons.git.remove .. " ",
  },
  -- diff_color = {
  --   added = { fg = colors.green },
  --   modified = { fg = colors.yellow },
  --   removed = { fg = colors.red },
  -- },
  colored = false,
  cond = fn.hide_component,
  fmt = fn.trunc(85, 0, nil, true),
  padding = { left = 0, right = 1 },
}


M.mode = {
  "mode",
  cond = fn.hide_component,
  fmt = function(str)
    return "[" .. str .. "]"
  end,
  padding = { left = 0, right = 0 },
}


M.filename = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 0, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path
  -- color = { fg = colors.fg, bg = colors.bg },
  symbols = {
    modified = "[+]", -- Text to show when the file is modified.
    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
    unnamed = "[No Name]", -- Text to show for unnamed buffers.
  },
  padding = { left = 1, right = 0 },
  cond = fn.hide_component,
  fmt = fn.trunc(37, 0, nil, true)
}

M.filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
  path = 2,
  shorting_target = 20,
  cond = M.hide_component,
  -- fmt = M.trunc(12, 0, nil, true)
  padding = {
    left = 0,
    right = 1,
  },
}

M.fileformat = {
  "fileformat",
  icons_enabled = true,
  symbols = {
    unix = " ", -- e712
    dos = " ", -- e70f
    mac = " " -- e711
  },
  cond = fn.hide_component,
  fmt = fn.trunc(12, 0, nil, true),
  padding = {
    left = 0,
    right = 1,
  },
}

-- M.encoding = {
--   "encoding",
--   cond = fn.hide_component,
--   fmt = fn.trunc(52, 0, nil, true)
-- }
M.encoding = {
  "o:encoding",
  fmt = string.upper,
  cond = fn.hide_in_width,
  padding = {
    left = 0,
    right = 1,
  },
}
M.branch = {
  -- "branch",
  -- "b:gitsigns_head",
  "FugitiveHead",
  icons_enabled = true,
  icon = icons.git.branch,
  padding = { left = 1, right = 0 },
  cond = fn.hide_component,
  fmt = fn.trunc(70, 0, nil, true)
}

M.location = {
  "location",
  padding = { left = 0, right = 1 },
  cond = fn.hide_component,
  fmt = fn.trunc(61, 0, nil, true)
}

M.progress = {
  "progress",
  padding = { left = 0, right = 0 },
  cond = fn.hide_component,
  fmt = fn.trunc(12, 0, nil, true)
}

M.scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = {
    left = 0,
    right = 0,
  },
  cond = nil,
}

M.spaces = {
  function()
    if not vim.api.nvim_buf_get_option(0, "expandtab") then
      return "tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
    end
    local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
    if size == 0 then
      size = vim.api.nvim_buf_get_option(0, "tabstop")
    end
    return "spaces: " .. size
  end,
  padding = {
    left = 0,
    right = 1,
  },
  -- cond = fn.hide_in_width,
  cond = fn.hide_component,
  fmt = fn.trunc(12, 0, nil, true),
  -- color = {},
}

M.nvim_gps = {
  function()
    if not gps_ok then
      return
    end
    local gps_location = gps.get_location()
    if gps_location == "error" then
      return ""
    else
      return gps.get_location()
    end
  end,
}

M.clients = {
  function(msg)
    msg = msg or ""
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return "LS Inactive"
      end
      return msg
    end
    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
      table.insert(buf_client_names, client.name)
    end
    return  table.concat(buf_client_names, ", ")
  end,
  -- icon = icons.ui.gear,
  padding = {
    left = 0,
    right = 1,
  },
  -- cond = fn.hide_in_width,
  -- color = {
  -- 	fg = colors.color_02,
  -- 	gui = "bold",
  -- },
}

M.python_env = {
  function()
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV"
      if venv then
        return string.format("  (%s)", fn.env_cleanup(venv))
      end
      venv = os.getenv "VIRTUAL_ENV"
      if venv then
        return string.format("  (%s)", fn.env_cleanup(venv))
      end
      return ""
    end
    return ""
  end,
  padding = {
    left = 0,
    right = 1,
  },
  -- color = { fg = colors.green },
  cond = fn.hide_in_width,
}

M.treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return icons.ui.tree
    end
    return ""
  end,
  padding = {
    left = 0,
    right = 0,
  },
  -- color = { fg = colors.green },
  cond = fn.hide_in_width,
}

return M
