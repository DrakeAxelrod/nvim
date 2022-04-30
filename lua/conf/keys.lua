if not conf.ok.legendary then return end
conf.keys = {}
local legendary = require("legendary")
local helpers = require("legendary.helpers")

--[[----------------------------------------------------------------------]]
---Keybinds that need to be made quickly
---@type function
--[[----------------------------------------------------------------------]]
conf.keys.quick = function()
  legendary.bind_keymap({"<space>", "<Nop>", { noremap = true }, { "n", "v" }})
  -- vim.api.nvim_set_var("mapleader", t"<space>")
  -- vim.api.nvim_set_var("maplocalleader", t"<space>")
end

--[[----------------------------------------------------------------------]]
---Standard keybinds
---@type function
--[[----------------------------------------------------------------------]]
conf.keys.standard = function()
  local opts = { noremap = true, silent = true }
  legendary.bind_keymaps({
    { "<space>s", ":Telescope command_palette<cr>", opts = opts, mode = { "n" } },
    { "<space>e", ":Telescope file_browser<cr>", opts = opts, mode = { "n" } }
  })
end




--[[----------------------------------------------------------------------]]
---@class Plugins keybinds that have to do with plugins
--[[----------------------------------------------------------------------]]
conf.keys.telescope = function(actions)
  return {
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
    }
  }
end
conf.keys.telescope_file_browser = function(fb_actions)
  return {
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
    }
   }
end
