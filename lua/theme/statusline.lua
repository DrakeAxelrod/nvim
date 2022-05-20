local vim = vim
-- local M = {}
local comp = {}

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

comp.mode = function()
	local current = vim.api.nvim_get_mode().mode
	local m = modes[current]
	return m.text
end

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
