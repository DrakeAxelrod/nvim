
return function()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not config_status_ok then
    return
  end

  -- key can be either a string or a table of string (lhs)
  -- action is the name of the action, set to `""` to remove default action
  -- action_cb is the function that will be called, it receives the node as a parameter. Optional for default actions
  -- mode is normal by default

  local tree_cb = nvim_tree_config.nvim_tree_callback
  local icons = require("lib.icons")


  local keybinds = {
    { key = { "l", "<CR>", "o", "<MiddleMouse>" }, cb = tree_cb "edit" },
    { key = "h", cb = tree_cb "close_node" },
    { key = "v", cb = tree_cb "vsplit" },
    -- { key = {"<CR>", "o", "<MiddleMouse>"}, action = "edit" },
    { key = "<C-p>", action = "edit_in_place" },
    { key = { "O" }, action = "edit_no_picker" },
    { key = { "<2-LeftMouse>", "<C-]>" }, action = "cd" },
    { key = "<C-v>", action = "vsplit" },
    { key = "<C-x>", action = "split" },
    { key = "<C-t>", action = "tabnew" },
    { key = "<", action = "prev_sibling" },
    { key = ">", action = "next_sibling" },
    { key = "P", action = "parent_node" },
    { key = "<BS>", action = "close_node" },
    { key = "<Tab>", action = "preview" },
    { key = "K", action = "first_sibling" },
    { key = "J", action = "last_sibling" },
    { key = "I", action = "toggle_git_ignored" },
    { key = "H", action = "toggle_dotfiles" },
    { key = "R", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "D", action = "trash" },
    { key = "r", action = "rename" },
    { key = "<C-r>", action = "full_rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
    { key = "[c", action = "prev_git_item" },
    { key = "]c", action = "next_git_item" },
    { key = "-", action = "dir_up" },
    { key = "s", action = "system_open" },
    { key = "q", action = "close" },
    { key = "g?", action = "toggle_help" },
    { key = "W", action = "collapse_all" },
    { key = "S", action = "search_node" },
    { key = "<C-k>", action = "toggle_file_info" },
    { key = ".", action = "run_file_command" }
  }

  local cfg = {
    auto_reload_on_write = true,
    sort_by = "modification_time",
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    update_cwd = true,
    open_on_tab = false,
    open_on_setup_file = false,
    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },
    -- update_to_buf_dir = {
    --   enable = true,
    --   auto_open = true,
    -- },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = icons.diagnostics.hint,
        info = icons.diagnostics.information,
        warning = icons.diagnostics.warning,
        error = icons.diagnostics.error,
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        -- quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help", "Startup" },
          },
        },
      },
    },
    view = {
      width = 25,
      height = 30,
      hide_root_folder = false,
      side = "left",
      mappings = {
        custom_only = true,
        list = keybinds
        -- {
        -- { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        -- { key = "h", cb = tree_cb "close_node" },
        -- { key = "v", cb = tree_cb "vsplit" },
        -- },
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    -- quit_on_open = 0,
    -- git_hl = 1,
    -- show_icons = {
    --   git = 1,
    --   folders = 1,
    --   files = 1,
    --   folder_arrows = 1,
    --   tree_width = 30,
    -- },
    renderer = {
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
      },
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        git = false,
        profile = false,
      },
    },
  }
  nvim_tree.setup(cfg)
  local d = icons.documents
  vim.g.nvim_tree_show_icons = { -- 0 to disable
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  }
  vim.g.nvim_tree_icons = {
    default = d.file.default,
    symlink = d.file.symlink,
    git = {
      unstaged = d.git.unstaged,
      staged = d.git.staged,
      unmerged = d.git.unmerged,
      renamed = d.git.renamed,
      deleted = d.git.deleted,
      untracked = d.git.untracked,
      ignored = d.git.ignored,
    },
    folder = {
      arrow_open = d.arrow.open,
      arrow_closed = d.arrow.closed,
      default = d.folder.default,
      open = d.folder.open,
      empty = d.folder.empty,
      empty_open = d.folder.empty_open,
      symlink = d.folder.symlink,
    },
  }
  vim.api.nvim_create_autocmd(
    { "BufEnter" },
    {
    pattern = { "*" },
    callback = function()
      if vim.fn.winnr("$") == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
        vim.cmd("quit")
      end
    end
  }
  )
  -- nvim_tree.setup(cfg)
end
