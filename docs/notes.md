# Notes

## Links

- [nvim docs](https://neovim.io/doc/)
- [awesome nvim](https://github.com/rockerBOO/awesome-neovim)
- [nvim files](/usr/share/nvim)
- [lunarvim files](~/.local/share/lunarvim)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)

## References

- [lunarvim](https://github.com/lunarvim/lunarvim)
- [cozynim](https://github.com/glepnir/cosynvim)
- [tjdevris config](https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim)

## Packer Plugin Spec

```lua
{
  'myusername/example',             -- The plugin location string

                                    -- The following keys are all optional

  disable = boolean,                -- Mark a plugin as inactive
  as = string,                      -- Specifies an alias under which to install the plugin
  installer = function,             -- Specifies custom installer. See "custom installers" below.
  updater = function,               -- Specifies custom updater. See "custom installers" below.
  after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
  rtp = string,                     -- Specifies a subdirectory of the plugin to add to runtimepath.
  opt = boolean,                    -- Manually marks a plugin as optional.
  bufread = boolean,                -- Manually specifying if a plugin needs BufRead after being loaded
  branch = string,                  -- Specifies a git branch to use
  tag = string,                     -- Specifies a git tag to use. Supports '*' for "latest tag"
  commit = string,                  -- Specifies a git commit to use
  lock = boolean,                   -- Skip updating this plugin in updates/syncs. Still cleans.
  run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
  requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
  rocks = string or list,           -- Specifies Luarocks dependencies for the plugin
  config = string or function,      -- Specifies code to run after this plugin is loaded.
                                    -- The setup key implies opt = true
  setup = string or function,       -- Specifies code to run before this plugin is loaded. The code is ran even if
                                    -- the plugin is waiting for other conditions (ft, cond...) to be met.

                                    -- The following keys all imply lazy-loading and imply opt = true

  cmd = string or list,             -- Specifies commands which load this plugin. Can be an autocmd pattern.
  ft = string or list,              -- Specifies filetypes which load this plugin.
  keys = string or list,            -- Specifies maps which load this plugin. See "Keybindings".
  event = string or list,           -- Specifies autocommand events which load this plugin.
  fn = string or list               -- Specifies functions which load this plugin.
  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  module = string or list           -- Specifies Lua module names for require. When requiring a string which starts
                                    -- with one of these module names, the plugin will be loaded.
  module_pattern = string/list      -- Specifies Lua pattern of Lua module names for require. When
                                    -- requiring a string which matches one of these patterns, the plugin will be loaded.
}
```
## Might Use Material
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
