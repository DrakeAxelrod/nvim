local augroup = function(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  desc = "check if we need to reload the file when it changed",
  command = "checktime",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  desc = "highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  desc = "resize splits if window got resized",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  desc = "go to last loc when opening a buffer",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  desc = "close some filetypes with <q>",
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query", -- :InspectTree
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  desc = "wrap and check for spell in text filetypes",
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.wo.wrap = true
    vim.wo.spell = true
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("json_file"),
  desc = "Wrap on enter for json files",
  pattern = { "*.json", "*.jsonc" },
  callback = function()
    vim.wo.wrap = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = augroup("alpha_fix"),
  desc = "Fix alpha",
  pattern = "AlphaReady",
  callback = function()
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = augroup("alpha_fix"),
  desc = "Fix alpha",
  pattern = "AlphaClosed",
  callback = function()
    vim.opt.laststatus = 3
    vim.opt.showtabline = 2
  end,
})
