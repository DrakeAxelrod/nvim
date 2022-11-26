local vim = vim
-- local M = {}
local comp = {}
-- local lush = require("theme.spec")

-- local colors = lush.colors

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

local hide_in_width = function()
  return vim.fn.winwidth(0) > 70
end

comp.space = {
  function()
    return " "
  end,
  padding = { left = 0, right = 0 },
  cond = nil,
}

comp.mode =  {
  function()
    local current = vim.api.nvim_get_mode().mode
    local m = modes[current]
    return "[" .. m.text .. "]"
  end,
  -- fmt = string.upper,
  padding = { left = 1, right = 1 },
  cond = nil,
}

comp.branch = {
  "b:gitsigns_head",
  -- icon = {
  --   "",
  --   align = "right",
  -- },
  padding = { left = 1, right = 1 },
  -- color = { fg = colors.magenta, bg = colors.bg },
  cond = hide_in_width,
}

comp.filename = {
  "filename",
  file_status = true,      -- Displays file status (readonly status, modified status)
  path = 0,                -- 0: Just the filename
                           -- 1: Relative path
                           -- 2: Absolute path
                           -- 3: Absolute path, with tilde as the home directory

  shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                           -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '[+]',      -- Text to show when the file is modified.
    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
  },
  padding = { left = 0, right = 1 },
  cond = hide_in_width,
}

comp.diff = {
  "diff",
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  symbols = { added = "  ", modified = " ", removed = " " },
  diff_color = {
    -- added = { fg = colors.green },
    -- modified = { fg = colors.yellow },
    -- removed = { fg = colors.red },
  },
  padding = { left = 0, right = 1 },
  cond = hide_in_width,
}
comp.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  padding = { left = 1, right = 0 },
  cond = hide_in_width,
}

comp.treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return ""
    end
    return ""
  end,
  -- color = { fg = colors.green },
  padding = { left = 1, right = 0 },
  cond = hide_in_width,
}
comp.lsp = {
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
    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end
    return "[" .. table.concat(buf_client_names, ", ") .. "]"
  end,
  padding = { left = 1, right = 0 },
  cond = hide_in_width,
}

comp.copilot = {
  function()
    local active = false
    local buf_clients = vim.lsp.buf_get_clients()
    for _, client in pairs(buf_clients) do
      if client.name == "copilot" then
        active = true
      end
    end
    if active then
      return "ﯙ"
    else
      return ""
    end
  end,
  padding = { left = 1, right = 0 },
  -- color = { fg = colors.cyan, gui = "bold" },
  cond = hide_in_width,
}

comp.location = {
  "location",
  padding = { left = 0, right = 0 },
  cond = hide_in_width
}
comp.progress = {
  "progress",
  padding = { left = 0, right = 1 },
  cond = hide_in_width
}
comp.spaces = {
  function()
    if not vim.api.nvim_buf_get_option(0, "expandtab") then
      return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
    end
    local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
    if size == 0 then
      size = vim.api.nvim_buf_get_option(0, "tabstop")
    end
    return "Spaces: " .. size .. " "
  end,
  padding = { left = 1, right = 0 },
  cond = hide_in_width,
}
comp.encoding = {
  "o:encoding",
  fmt = string.upper,
  padding = { left = 1, right = 0 },
  cond = hide_in_width,
}
comp.filetype = {
  "filetype",
  colored = true,   -- Displays filetype icon in color if set to true
  icon_only = true, -- Display only an icon for filetype
  icon = { align = 'right' }, -- Display filetype icon on the right hand side
  -- icon =    {'X', align='right'}
  -- Icon string ^ in table is ignored in filetype component
  padding = { left = 0, right = 1 },
  cond = hide_in_width
}


comp.scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  -- color = { fg = colors.yellow, bg = colors.bg },
  cond = nil,
}


return {
  comp = comp,
  theme = {
    normal = {},
    insert = {},
    visual = {},
    replace = {},
    command = {},
    inactive = {},
    terminal = {},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
  icons_enabled = true,
  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
  disabled_filetypes = {},
  always_divide_middle = true,
  globalstatus = true,
  init = function(self)
    require("lualine").setup({
      options = {
        icons_enabled = self.icons_enabled,
        theme = self.theme,
        component_separators = self.component_separators,
        section_separators = self.section_separators,
        disabled_filetypes = self.disabled_filetypes,
        always_divide_middle = self.always_divide_middle,
        globalstatus = self.globalstatus,
      },
      sections = self.sections,
      inactive_sections = self.inactive_sections,
      tabline = self.tabline,
      extensions = self.extensions,
    })
  end
}
