-- https://github.com/nvim-telescope/telescope.nvim
return function(telescope)
  local actions = require("telescope.actions")
  local fb_actions = require("telescope").extensions.file_browser.actions
  telescope.setup({
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
      file_ignore_patterns = { "node_modules", ".git", "target", "vendor" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { shorten = 5 },
      border = true,
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      treesitter = true,
      dynamic_preview_title = true,
      history = {
        -- path = api.fs.join(vim.fn.stdpath("cache").."/telescope_history.sqlite3"),
        limit = 100,
      },
      mappings = conf.keys.telescope(actions),
    },
    pickers = {
      file_browser = {
        cwd_to_path = true,
        hidden = true,
        mappings = conf.keys.telescope_file_browser(fb_actions),
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
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
        },
      },
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "rg",
      },
      file_browser ={
        grouped = true,
        cwd_to_path = true,
        mappings = conf.keys.telescope_file_browser(fb_actions)
      },
      command_palette = conf.cmds.command_palette(),
      packer = {
        layout_config = {
          height = .5
        }
      }
    },
  })
  local extensions = { "fzf", "file_browser", "media_files", "smart_history", "command_palette", "gh" }
  for _, extension in ipairs(extensions) do
    require("telescope").load_extension(extension)
  end
end
