```lua
local a = f("a => a + 1")

Switch CWD to the directory of the open buffer
map({ "n", "v", "o" }, "<leader>cd", "<cmd>cd %:p:h<cr>:pwd<cr>", opt)

-- reload/source current file
map("n", "<leader>r", function()
  vim.cmd([[luafile %]])
  print("reloaded " .. vim.fn.expand("%"))
end)

reload a particular module
map("n", "<leader>rm", function()
  local module_name = vim.fn.input({
      prompt = "\nEnter the name of the module you want to reload\n:",
      completion = "file"
  })
  if module_name == "" then
      return
  else
      reload(module_name)
      vim.notify("!Reloaded Nvim Module " .. module_name .. ".lua!", vim.log.levels.INFO)
  end
end)

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
-- It seems that `checktime` does not work in command line. We need to check if we are in command
-- line before executing this command, see also https://vi.stackexchange.com/a/20397/15292 .
api.nvim_create_augroup("auto_read", { clear = true })

api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  group = "auto_read",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, { title = "nvim-config" })
  end,
})

api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
  pattern = "*",
  group = "auto_read",
  callback = function()
    if fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

-- Resize all windows when we resize the terminal
api.nvim_create_autocmd("VimResized", {
  group = api.nvim_create_augroup("win_autoresize", { clear = true }),
  desc = "autoresize windows on resizing operation",
  command = "wincmd =",
})
```
