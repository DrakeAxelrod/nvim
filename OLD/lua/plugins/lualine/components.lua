local M = {}

local icons = require "theme.icons"

local window_width_limit = 100

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.o.columns > window_width_limit
  end,
  -- check_git_workspace = function()
  --   local filepath = vim.fn.expand "%:p:h"
  --   local gitdir = vim.fn.finddir(".git", filepath .. ";")
  --   return gitdir and #gitdir > 0 and #gitdir < #filepath
  -- end,
}

local modes = {
	["n"] = { text = "norm", hl = "%#StatusLineNormal#" }, -- normal
	["niI"] = { text = "norm", hl = "%#StatusLineNormal#" }, -- niI
	["niR"] = { text = "norm", hl = "%#StatusLineNormal#" }, -- niR
	["niV"] = { text = "norm", hl = "%#StatusLineNormal#" }, -- niV
	["no"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- no-pending
	["nov"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- nov-pending
	["noV"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- noV-pending
	["no\022"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- noVB-pending
	["v"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- visual
	["V"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- V-line
	["\022"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- V-block
	["s"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- selection
	["S"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- S-line
	["\019"] = { text = "visu", hl = "%#StatusLineVisual#" }, -- S-block
	["i"] = { text = "ins+", hl = "%#StatusLineInsert#" }, -- insert
	["ic"] = { text = "ins+", hl = "%#StatusLineInsert#" }, -- insert-command
	["ix"] = { text = "ins+", hl = "%#StatusLineInsert#" }, -- insert-x
	["r"] = { text = "rplc", hl = "%#StatusLineReplace#" }, -- replace
	["R"] = { text = "rplc", hl = "%#StatusLineReplace#" }, -- replace
	["Rc"] = { text = "rplc", hl = "%#StatusLineReplace#" }, -- replace-command
	["Rv"] = { text = "rplc", hl = "%#StatusLineReplace#" }, -- v-replace
	["Rx"] = { text = "rplc", hl = "%#StatusLineReplace#" }, -- replace-x
	["Rvc"] = { text = "rplc", hl = "%#StatusLineReplace#" }, -- v-replace-command
	["Rvx"] = { text = "rplc", hl = "%#StatusLineReplace#" }, -- v-replace-x
	["c"] = { text = "viex", hl = "%#StatusLineCommand#" }, -- command
	["cv"] = { text = "viex", hl = "%#StatusLineCommand#" }, -- command-visual
	["ce"] = { text = "viex", hl = "%#StatusLineCommand#" }, -- command-ex
	["rm"] = { text = "more", hl = "%#StatusLineCommand#" }, -- more
	["r?"] = { text = "????", hl = "%#StatusLineNormal#" }, -- confirm
	["!"] = { text = "!!!!", hl = "%#StatusLineCommand#" }, -- shell
	["nt"] = { text = "term", hl = "%#StatusLineTerminal#" }, -- t-normal
	["t"] = { text = "term", hl = "%#StatusLineTerminal#" }, -- terminal
}

-- local colors = require("theme.colors")
local odp = require("onedarkpro")
local colors = odp.get_colors()

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

local branch = icons.git.Branch

M.mode = {
  function()
    return " ".. icons.misc.Package .. "  " .. modes[vim.fn.mode()].text .. "  "
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
}
M.branch = {
  "b:gitsigns_head",
  icon = branch,
  color = { gui = "bold" },
}
M.filename = {
  "filename",
  shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
  modified = '[+]',      -- Text to show when the file is modified.
  readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
  unnamed = '[No Name]', -- Text to show for unnamed buffers.
  },
  color = {},
  cond = nil,
}
M.diff = {
  "diff",
  source = diff_source,
  symbols = {
    added = icons.git.LineAdded .. " ",
    modified = icons.git.LineModified .. " ",
    removed = icons.git.LineRemoved .. " ",
  },
  padding = { left = 2, right = 1 },
  diff_color = {
    -- added = "DiffAdd", -- Changes the diff's added color
    -- modified = "DiffChange", -- Changes the diff's modified color
    -- removed = "DiffDelete", -- Changes the diff's removed color you
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = nil,
}
M.python_env = {
  function()
    local utils = require "lvim.core.lualine.utils"
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
      if venv then
        local _icons = require "nvim-web-devicons"
        local py_icon, _ = _icons.get_icon ".py"
        return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
      end
    end
    return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}
M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostics.BoldError .. " ",
    warn = icons.diagnostics.BoldWarning .. " ",
    info = icons.diagnostics.BoldInformation .. " ",
    hint = icons.diagnostics.BoldHint .. " ",
  },
  cond = conditions.hide_in_width,
}
M.treesitter = {
  function()
    return icons.ui.Tree
  end,
  color = function()
    local buf = vim.api.nvim_get_current_buf()
    local ts = vim.treesitter.highlighter.active[buf]
    return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
  end,
  cond = conditions.hide_in_width,
}
M.lsp = {
  function(msg)
    msg = msg or "LS Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return "LS Inactive"
      end
      return msg
    end
    local buf_ft = vim.bo.filetype
    local buf_client_names = {}
    local copilot_active = false

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end

      if client.name == "copilot" then
        copilot_active = true
      end
    end

    local unique_client_names = vim.fn.uniq(buf_client_names)

    local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

    if copilot_active then
      language_servers = language_servers .. " " .. icons.git.Octoface
    end

    return language_servers
  end,
  color = { gui = "bold" },
  cond = conditions.hide_in_width,
}
M.location = { "location" }
M.progress = {
  "progress",
  fmt = function()
    return "%P/%L"
  end,
  color = {},
}

M.spaces = {
  function()
    local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
    return icons.ui.Tab .. " " .. shiftwidth
  end,
  padding = 1,
}
M.encoding = {
  "o:encoding",
  fmt = string.upper,
  color = {},
  cond = conditions.hide_in_width,
}
M.filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } }
M.scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = icons.Statusline.Scrollbar
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  color = "SLProgress",
  cond = nil,
}

return M
