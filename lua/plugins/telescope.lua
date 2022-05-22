return function()
  return {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    requires = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        after = "telescope.nvim",
        run = "make",
        config = function()
          require("telescope").load_extension "fzf"
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        after = "telescope.nvim",
        config = function()
          require("telescope").load_extension "file_browser"
        end,
      },
      {
        "nvim-telescope/telescope-smart-history.nvim",
        after = { "telescope.nvim" },
        requires = { { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } } },
        config = function()
          require("telescope").load_extension "smart_history"
        end,
      },
      {
        "nvim-telescope/telescope-github.nvim",
        after = { "plenary.nvim", "telescope.nvim" },
        config = function()
          require("telescope").load_extension "gh"
        end,
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        after = { "telescope.nvim" },
        requires = { { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } } },
        config = function()
          require("telescope").load_extension "frecency"
        end,
      },
      {
        "nvim-telescope/telescope-project.nvim",
        after = { "telescope.nvim" },
        config = function()
          require("telescope").load_extension "project"
        end,
      },
      -- {
      --   "FeiyouG/command_center.nvim",
      --   after = "telescope.nvim",
      --   config = function()
      --     require("telescope").load_extension "command_center"
      --   end,
      -- },
      {
        "nvim-telescope/telescope-packer.nvim",
        after = "telescope.nvim",
        config = function()
          require("telescope").load_extension "packer"
        end,
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        after = "telescope.nvim",
        config = function()
          require("telescope").load_extension "ui-select"
        end,
      },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if not ok then
        return
      end
      local notify_present, _ = pcall(require, "notify")
      if notify_present then
        telescope.load_extension "notify"
      end
      local aerial_present, _ = pcall(require, "aerial")
      if aerial_present then
        telescope.load_extension "aerial"
      end
      -- local command_center = require "command_center"
      local join = require("lib").fs.join
      local keys = require "core.keys"
      -- local fb_actions = require("telescope").extensions.file_browser.actions
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
          mappings = keys.telescope(),
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
          file_browser = {
            grouped = true,
            cwd_to_path = true,
            mappings = keys.telescope_fb_browser(),
          },
          project = {
            base_dirs = {
              -- { path = "~/.config/nvim/" },
              -- { path = "~/.config/lvim/" },
              -- { path = "~/.config/kitty/" },
              -- { path = "~/Documents/" },
              -- { path = "~/Documents/Rust/" },
              -- { path = "~/Documents/Go/" },
              -- { path = "~/Documents/Cpp/" },
              -- { path = "~/Documents/Python/" },
            },
            hidden_files = true, -- default: false
            theme = "dropdown"
          },
          -- command_center = {
          --   -- Below are default settings that can be overriden ...
          --   -- Change what to show on telescope prompt and in which order
          --   -- Currently support the following three components
          --   -- Components may repeat
          --   components = {
          --     command_center.component.KEYBINDINGS,
          --     command_center.component.DESCRIPTION,
          --   },
          --   -- Change the separator used to separate each component
          --   separator = " ",
          --   -- When set to false,
          --   -- The description compoenent will be empty if it is not specified
          --   auto_replace_desc_with_cmd = true,
          -- },
          packer = {
            layout_config = {
              height = 0.5,
            },
          },
        },
      }
    end,
  }
end
