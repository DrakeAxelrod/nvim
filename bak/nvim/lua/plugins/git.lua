return {
  {
    "TimUntersberger/neogit",
    requires = {"nvim-lua/plenary.nvim"},
    function()
      require("neogit").setup {
        disable_signs = false,
        disable_hint = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
        -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
        auto_refresh = true,
        disable_builtin_notifications = false,
        use_magit_keybindings = false,
        commit_popup = {
          kind = "split",
        },
        -- Change the default way of opening neogit
        kind = "tab",
        -- customize displayed signs
        signs = {
          -- { CLOSED, OPENED }
          section = { ">", "v" },
          item = { ">", "v" },
          hunk = { "", "" },
        },
        integrations = {
          -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
          -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
          --
          -- Requires you to have `sindrets/diffview.nvim` installed.
          -- use {
          --   'TimUntersberger/neogit',
          --   requires = {
          --     'nvim-lua/plenary.nvim',
          --     'sindrets/diffview.nvim'
          --   }
          -- }
          --
          diffview = false,
        },
        -- Setting any section to `false` will make the section not render at all
        sections = {
          untracked = {
            folded = false,
          },
          unstaged = {
            folded = false,
          },
          staged = {
            folded = false,
          },
          stashes = {
            folded = true,
          },
          unpulled = {
            folded = true,
          },
          unmerged = {
            folded = false,
          },
          recent = {
            folded = true,
          },
        },
        -- override/add mappings
        mappings = {
          -- modify status buffer mappings
          status = {
            -- Adds a mapping with "B" as key that does the "BranchPopup" command
            ["B"] = "BranchPopup",
            -- Removes the default mapping of "s"
            -- ["s"] = "",
          },
        },
      }
    end,
  },
  {
		"lewis6991/gitsigns.nvim",
		function()
			require("gitsigns").setup {
				signs = {
					add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "~",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "-",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "‾",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "_",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				keymaps = {
					-- Default keymap options
					noremap = true,
					buffer = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter_opts = {
					relative_time = false,
				},
				max_file_length = 40000,
				preview_config = {
					-- Options passed to nvim_open_win
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				sign_priority = 6,
				update_debounce = 200,
				status_formatter = nil, -- Use default
			}
		end,
	}
}
