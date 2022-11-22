return {
  { "nvim-neo-tree/neo-tree.nvim",
    requires = { "MunifTanjim/nui.nvim" },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
      require("neo-tree").setup {
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_diagnostics = false,
        default_component_configs = {
          container = {
            enable_character_fade = true,
          },
          indent = {
            indent_size = 2,
            padding = 0,
            with_markers = true,
            indent_marker = " ",
            last_indent_marker = " ",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            highlight = "NeoTreeIndentMarker",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
            highlight = "NeoTreeFileIcon",
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = true,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              added = "★",
              deleted = "",
              modified = "+",
              renamed = "➜",
              untracked = "u",
              ignored = "◌",
              unstaged = "",
              staged = "s",
              conflict = "",
            },
          },
        },
        window = {
          width = 25,
          position = "right",
          mappings = {
            ["."] = "toggle_hidden",
            ["!"] = "set_root",
            ["o"] = "open",
            ["<space>"] = {
              "toggle_node",
              nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["a"] = {
              "add",
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none", -- "none", "relative", "absolute"
              },
            },
            ["A"] = "add_directory", -- also accepts the config.show_path option.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination
            ["m"] = "move", -- takes text input for destination
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              ".DS_Store",
              "thumbs.db",
              "node_modules",
              "__pycache__",
            },
          },
          follow_current_file = true,
          -- hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["R"] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
            },
          },
        },
        git_status = {
          position = "float",
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
        event_handlers = {
          {
            event = "vim_buffer_enter",
            handler = function(_)
              if vim.bo.filetype == "neo-tree" then
                vim.wo.signcolumn = "auto"
              end
            end,
          },
        },
      }
    end,
  }
}
