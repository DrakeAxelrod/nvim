return function()
  local icons = require("theme.icons")
  local start_telescope = function(telescope_mode)
    local node = require("nvim-tree.lib").get_node_at_cursor()
    local abspath = node.link_to or node.absolute_path
    local is_folder = node.open ~= nil
    local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
    require("telescope.builtin")[telescope_mode] { cwd = basedir }
  end
  local function telescope_find_files(_)
    start_telescope "find_files"
  end

  local function telescope_live_grep(_)
    start_telescope "live_grep"
  end

  require("nvim-tree").setup {
    disable_netrw        = true,
    hijack_netrw         = true,
    ignore_ft_on_setup   = {
      "startify",
      "dashboard",
      "alpha",
    },
    auto_reload_on_write = false,
    hijack_directories   = {
      enable = false,
    },
    update_cwd           = true,
    diagnostics          = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info,
        warning = icons.diagnostics.Warn,
        error = icons.diagnostics.Error,
      },
    },
    update_focused_file  = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    system_open          = {
      cmd = nil,
      args = {},
    },
    git                  = {
      enable = true,
      ignore = false,
      timeout = 200,
    },
    view                 = {
      width = 30,
      hide_root_folder = false,
      side = "left",
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
          { key = "h", action = "close_node" },
          { key = "v", action = "vsplit" },
          { key = "C", action = "cd" },
          { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
          { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
          { key = "?", action = "toggle_help" },
        },
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    renderer             = {
      indent_markers = {
        enable = false,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {},
      highlight_git = true,
      group_empty = false,
      root_folder_modifier = ":t",
    },
    filters              = {
      dotfiles = false,
      custom = { "node_modules", "\\.cache" },
      exclude = {},
    },
    trash                = {
      cmd = "trash",
      require_confirm = true,
    },
    log                  = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
      },
    },
    actions              = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
  }
end
