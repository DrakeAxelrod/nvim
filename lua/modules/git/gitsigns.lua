return function()
  local ok, gitsigns = pcall(require, "gitsigns")
  if not ok then
    return
  end

  local cfg = {
    signs = {
      add = {hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
      change = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"},
      delete = {hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
      topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
      changedelete = {hl = "GitSignsChange", text = "_", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}
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

  gitsigns.setup(cfg)
end
