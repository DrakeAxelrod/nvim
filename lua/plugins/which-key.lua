-- https://github.com/folke/which-key.nvim
return function()
	return {
		"folke/which-key.nvim",
		config = function()
			local ok, which_key = pcall(require, "which-key")
			if not ok then
				return
			end
      local theme = require("theme")
      local icons = theme.icons
			which_key.setup({
				plugins = {
					marks = true, -- shows a list of your marks on ' and `
					registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
					presets = {
						operators = true, -- adds help for operators like d, y, ...
						motions = true, -- adds help for motions
						text_objects = true, -- help for text objects triggered after entering an operator
						windows = true, -- default bindings on <c-w>
						nav = true, -- misc bindings to work with windows
						z = true, -- bindings for folds, spelling and others prefixed with z
						g = true, -- bindings for prefixed with g
					},
					spelling = { -- use which-key for spelling hints
						enabled = true,
						suggestions = 20,
					},
				},
				operators = {
          gc = "Comments",
          d = "Delete",
          c = "Change",
          y = "Yank (copy)",
          ["g~"] = "Toggle case",
          ["gu"] = "Lowercase",
          ["gU"] = "Uppercase",
          [">"] = "Indent right",
          ["<lt>"] = "Indent left",
          ["zf"] = "Create fold",
          ["!"] = "Filter though external program",
        },
				key_labels = {
          ["<space>"] = "SPC",
          ["<cr>"] = "RET",
          ["<tab>"] = "TAB",
        },
				icons = {
					breadcrumb = "…", --"»",
					separator = icons.ui.arrow,
					group = "+",
				},
				popup_mappings = {
					scroll_down = "<c-d>",
					scroll_up = "<c-u>",
				},
				window = {
					border = "rounded", --"single",
					position = "bottom",
          padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
					-- margin = { 1, 0, 1, 0 },
					-- padding = { 2, 2, 2, 2 },
					-- winblend = 0,
				},
				layout = {
					height = { min = 4, max = 25 },
					width = { min = 20, max = 50 },
					spacing = 3,
					align = "left",
				},
				ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
				show_help = true,
				triggers = "auto",
				triggers_blacklist = {
					i = { "j", "k" },
					v = { "j", "k" },
				},
			})
		end,
	}
end
