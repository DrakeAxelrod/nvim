local M = {}

function M.nvim_comment()
  require("Comment").setup()
end

function M.smart_splits()
  local ok, splits = pcall(require, "smart-splits")
  if ok then
    return
  end
  splits.setup {
    -- Ignored filetypes (only while resizing)
    ignored_filetypes = {
      "nofile",
      "quickfix",
      "prompt",
    },
    -- Ignored buffer types (only while resizing)
    ignored_buftypes = {},
    -- when moving cursor between splits left or right,
    -- place the cursor on the same row of the *screen*
    -- regardless of line numbers. False by default.
    -- Can be overridden via function parameter, see Usage.
    move_cursor_same_row = false,
  }
end

function M.telescope()
  local loader = require("packer").loader
  if not packer_plugins["telescope-fzf-native.nvim"].loaded then
    loader("telescope-fzf-native.nvim" .. " telescope-media-files.nvim" .. " telescope-file-browser.nvim")
  end
  local telescope = require "telescope"
  local ok, actions = pcall(require, "telescope.actions")
  if not ok then
    return
  end
  local fb_actions = require("telescope").extensions.file_browser.actions

  telescope.setup {
    defaults = {
      prompt_prefix = "> ", --" ", --"   ",
      selection_caret = "> ", -- " " "  ",
      entry_prefix = "  ",
      multi_icon = "<>",
      winblend = 0,
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          width = 0.95,
          height = 0.85,
          prompt_position = "top",
          results_width = 0.8,
          -- width_padding = 0.1,
          -- height_padding = 0.1,
          preview_width = function(_, cols, _)
            if cols > 200 then
              return math.floor(cols * 0.4)
            else
              return math.floor(cols * 0.6)
            end
          end,
        },
        vertical = {
          mirror = false,
          -- width_padding = 0.05,
          -- height_padding = 1,
          width = 0.9,
          height = 0.95,
          preview_height = 0.5,
        },
        flex = {
          horizontal = {
            preview_width = 0.9,
          },
        },
        width = 0.95,
        height = 0.90,
        preview_cutoff = 120,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = {
        "node_modules",
        ".git",
        "target",
        "vendor",
      },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { shorten = 5 },
      border = true,
      -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      borderchars = {
        "─",
        "│",
        "─",
        "│",
        "╭",
        "╮",
        "╯",
        "╰",
      },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      treesitter = true,
      dynamic_preview_title = true,
      history = {
        path = table.concat({ vim.fn.stdpath "data", "telescope_history.sqlite3" }, package.config:sub(1, 1)),
        -- global.fs.join(vim.fn.stdpath("data"), "telescope_history.sqlite3"),
        limit = 100,
      },
      mappings = {
        i = {
          -- IMPORTANT
          -- either hot-reloaded or `function(prompt_bufnr) telescope.extensions.hop.hop end`
          -- ["<C-space>"] = R("telescope").extensions.hop.hop,  -- hop.hop_toggle_selection
          -- custom hop loop to multi selects and sending selected entries to quickfix list
          -- ["<C-space>"] = function(prompt_bufnr)
          --   local opts = {
          --     callback = actions.toggle_selection,
          --     loop_callback = actions.send_selected_to_qflist,
          --   }
          --   require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
          -- end,

          -- ["<C-x>"] = false,
          ["<C-s>"] = actions.select_horizontal,

          -- ["<C-y>"] = set_prompt_to_entry_value,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

          -- ["<C-n>"] = actions.move_selection_next,
          -- ["<C-p>"] = actions.move_selection_previous,

          -- ["<C-c>"] = actions.close,

          -- ["<Down>"] = actions.move_selection_next,
          -- ["<Up>"] = actions.move_selection_previous,

          -- ["<CR>"] = actions.select_default,
          -- ["<C-x>"] = actions.select_horizontal,
          -- ["<C-v>"] = actions.select_vertical,
          -- ["<C-t>"] = actions.select_tab,

          -- ["<C-u>"] = actions.preview_scrolling_up,
          -- ["<C-d>"] = actions.preview_scrolling_down,

          -- ["<PageUp>"] = actions.results_scrolling_up,
          -- ["<PageDown>"] = actions.results_scrolling_down,

          -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          -- ["<C-l>"] = actions.complete_tag,
          -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          -- ["<C-w>"] = { "<c-s-w>", type = "command" },
          ["<C-/>"] = "which_key",
        },
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

          -- ["<esc>"] = actions.close,
          -- ["<CR>"] = actions.select_default,
          -- ["<C-x>"] = actions.select_horizontal,
          -- ["<C-v>"] = actions.select_vertical,
          -- ["<C-t>"] = actions.select_tab,

          -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          -- -- TODO: This would be weird if we switch the ordering.
          -- ["j"] = actions.move_selection_next,
          -- ["k"] = actions.move_selection_previous,
          -- ["H"] = actions.move_to_top,
          -- ["M"] = actions.move_to_middle,
          -- ["L"] = actions.move_to_bottom,

          -- ["<Down>"] = actions.move_selection_next,
          -- ["<Up>"] = actions.move_selection_previous,
          -- ["gg"] = actions.move_to_top,
          -- ["G"] = actions.move_to_bottom,

          -- ["<C-u>"] = actions.preview_scrolling_up,
          -- ["<C-d>"] = actions.preview_scrolling_down,

          -- ["<PageUp>"] = actions.results_scrolling_up,
          -- ["<PageDown>"] = actions.results_scrolling_down,
          ["?"] = "which_key",
        },
      },
    },
    pickers = {
      file_browser = {
        cwd_to_path = true,
        hidden = true,
      },
      find_files = {
        hidden = true,
        find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
      },
      live_grep = {
        hidden = true,
        only_sort_text = true,
      },
      fd = {
        mappings = {
          n = {
            ["kj"] = "close",
          },
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },
      -- hop = {
      --   -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
      --   keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more
      --   -- Highlight groups to link to signs and lines; the below configuration refers to demo
      --   -- sign_hl typically only defines foreground to possibly be combined with line_hl
      --   sign_hl = { "WarningMsg", "Title" },
      --   -- optional, typically a table of two highlight groups that are alternated between
      --   line_hl = { "CursorLine", "Normal" },
      --   -- options specific to `hop_loop`
      --   -- true temporarily disables Telescope selection highlighting
      --   clear_selection_hl = false,
      --   -- highlight hopped to entry with telescope selection highlight
      --   -- note: mutually exclusive with `clear_selection_hl`
      --   trace_entry = true,
      --   -- jump to entry where hoop loop was started from
      --   reset_selection = true,
      -- },
      -- ["ui-select"] = {
      --   require("telescope.themes").get_dropdown {
      --     -- even more opts
      --   },
      -- },
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "rg",
      },
      file_browser = {
        grouped = true,
        cwd_to_path = true,
        mappings = {
          ["i"] = {
            -- Create file/folder at current path (trailing path separator creates folder)
            ["<A-c>"] = fb_actions.create,
            -- Rename multi-selected files/folders
            ["<A-r>"] = fb_actions.rename,
            -- Move multi-selected files/folders to current path
            ["<A-m>"] = fb_actions.move,
            -- Copy (multi-)selected files/folders to current path
            ["<A-y>"] = fb_actions.copy,
            -- Delete (multi-)selected files/folders
            ["<A-d>"] = fb_actions.remove,
            -- Open file/folder with default system application
            ["<C-o>"] = fb_actions.open,
            -- Go to parent directory
            ["<A-g>"] = fb_actions.goto_parent_dir,
            -- Go to home directory
            ["<A-h>"] = fb_actions.goto_home_dir,
            -- Go to current working directory (cwd)
            ["<C-w>"] = fb_actions.goto_cwd,
            -- Change nvim's cwd to selected folder/file(parent)
            ["<C-t>"] = fb_actions.change_cwd,
            -- Toggle between file and folder browser
            ["<C-f>"] = fb_actions.toggle_browser,
            -- Toggle hidden files/folders
            ["<C-.>"] = fb_actions.toggle_hidden,
            -- Toggle all entries ignoring ./ and ../
            ["<C-s>"] = fb_actions.toggle_all,
            -- toggle whichkey help
            ["<C-/>"] = "which_key",
          },
          ["n"] = {
            -- Create file/folder at current path (trailing path separator creates folder)
            ["c"] = fb_actions.create,
            -- Rename multi-selected files/folders
            ["r"] = fb_actions.rename,
            -- Move multi-selected files/folders to current path
            ["m"] = fb_actions.move,
            -- Copy (multi-)selected files/folders to current path
            ["y"] = fb_actions.copy,
            -- Delete (multi-)selected files/folders
            ["d"] = fb_actions.remove,
            -- Open file/folder with default system application
            ["o"] = fb_actions.open,
            -- Go to parent directory
            ["g"] = fb_actions.goto_parent_dir,
            -- Go to home directory
            ["e"] = fb_actions.goto_home_dir,
            -- Go to current working directory (cwd)
            ["w"] = fb_actions.goto_cwd,
            -- Change nvim's cwd to selected folder/file(parent)
            ["t"] = fb_actions.change_cwd,
            -- Toggle between file and folder browser
            ["f"] = fb_actions.toggle_browser,
            -- Toggle hidden files/folders
            ["h"] = fb_actions.toggle_hidden,
            -- Toggle all entries ignoring ./ and ../
            ["s"] = fb_actions.toggle_all,
            -- toggle whichkey help
            ["?"] = "which_key",
          },
        },
      },
      -- packer = {
      --   -- theme = "ivy",
      --   layout_config = {
      --     height = .5
      --   }
      -- }
    },
  }
  for _, extension in ipairs {
    -- "projects",
    "fzf",
    "file_browser",
    "media_files",
    "packer",
    "fzf_native",
    -- "frecency",
    "smart_history",
    -- "arecibo",
    -- "cheat",
    "gh",
  } do
    pcall(function()
      require("telescope").load_extension(extension)
    end)
  end
  -- telescope.load_extension("fzf")
  -- telescope.load_extension("media_files")
  -- telescope.load_extension("file_browser")
  -- telescope.load_extension("packer")
end

return M
