local M = {}

function M.alpha_nvim()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local cfg = require("alpha.themes.startify")
  local plugin_count = vim.fn.len(vim.fn.globpath(
		table.concat({ vim.fn.stdpath("config"), "runtime", "site", "pack", "packer", "start" },
		package.config:sub(1, 1)), "*", 0, 1))
  cfg.section.header.val = {
    ("[NeoVim / Packer   %s]"):format(plugin_count),
  }

  cfg.section.top_buttons.val = {
    cfg.button("e", "  New file", "<cmd>ene <CR>"),
    cfg.button("f", "  Find file", ":Telescope find_files <cr>"),
    cfg.button("t", "  Terminal", ":term<cr>"),
    cfg.button("c", "  Config", ":Config<CR>", "Config"),
    cfg.button("u", "  Sync Packages", ":PackerSync<CR>", "Config"),
  }

  alpha.setup(cfg.opts)
end



function M.which_key()
  require("which-key").setup({
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
        suggestions = 20
      },
    },
    -- operators = { gc = "Comments" },
    key_labels = {
      ["<space>"] = "<leader>",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    popup_mappings = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    window = {
      border = "single", --"none",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0,
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
    }
  })

  local binds = require("conf.keys").wk()
  local mappings = {
    normal = "n",
    insert = "i",
    visual = "v",

  }
  -- Remap using which_key
  for mode_name, mode_char in pairs(mappings) do
    require("which-key").register(binds[mode_name], {
      mode = mode_char,
      prefix = "<leader>",
      buffer = nil,
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    })
  end
end

function M.indent_blankline()
	require("indent_blankline").setup({
		char = "▏",
		show_first_indent_level = true,
		show_trailing_blankline_indent = true,
		show_current_context = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"block",
			"list_literal",
			"selector",
			"^if",
			"^table",
			"if_statement",
			"while",
			"for",
		},
		filetype_exclude = {
			"startify",
			"dashboard",
			"dotooagenda",
			"log",
			"fugitive",
			"gitcommit",
			"packer",
			"vimwiki",
			"markdown",
			"json",
			"txt",
			"vista",
			"help",
			"todoist",
			"NvimTree",
			"peekaboo",
			"git",
			"TelescopePrompt",
			"undotree",
			"flutterToolsOutline",
		},
		buftype_exclude = {
			"terminal",
			"nofile",
		},
	})
end

return M
