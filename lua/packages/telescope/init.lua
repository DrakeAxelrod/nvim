local join = require("core").utils.fs.join
return {
  {
    "nvim-telescope/telescope.nvim",
    deps = {
      {
        "nvim-telescope/telescope-fzy-native.nvim",
        function()
          require("telescope").load_extension "fzy_native"
        end,
      },
      {
        "nvim-telescope/telescope-smart-history.nvim",
        requires = { "kkharji/sqlite.lua" },
        function()
          require("telescope").load_extension "smart_history"
        end,
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "kkharji/sqlite.lua" },
        function()
          require("telescope").load_extension "frecency"
        end,
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        function()
          require("telescope").load_extension "ui-select"
        end,
      },
    },
    function()
      local ok, telescope = pcall(require, "telescope")
      if not ok then
        return
      end
      local notify_present, _ = pcall(require, "notify")
      if notify_present then
        telescope.load_extension "notify"
      end
      -- local aerial_present, _ = pcall(require, "aerial")
      -- if aerial_present then
      --   telescope.load_extension "aerial"
      -- end
      -- local command_center = require "command_center"
      telescope.setup {
        defaults = {
          prompt_prefix = "  ",
          selection_caret = " ",
          entry_prefix = "  ",
          multi_icon = "",
          initial_mode = "insert",
          path_display = { "truncate" },
          -- path_display = { shorten = 5 },
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          border = true,
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
            limit = 100,
          },
          layout_config = {
            horizontal = {
              width = 0.95,
              height = 0.85,
              prompt_position = "top",
              results_width = 0.8,
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
          -- mappings = keys.telescope(),
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
          fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            },
          },
          frecency = {
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = { "*.git/*", "*/tmp/*" },
            disable_devicons = false,
            workspaces = {
              ["config"] = join(os.getenv "HOME", ".config"),
              ["data"] = join(os.getenv "HOME", ".local", "share"),
              ["project"] = join(os.getenv "HOME", "Documents"),
            },
          },
          hidden_files = true, -- default: false
          theme = "dropdown",
        },
      }
    end,
  },
}
