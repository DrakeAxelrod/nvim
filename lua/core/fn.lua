local M = {}
M.tbl = {}

-- vim.tbl_deep_extend
-- • "error": raise an error
-- • "keep": use value from the leftmost map
-- • "force": use value from the rightmost map

-- ---Merges two tables
-- ---@param a table
-- ---@param b table
-- function M.tbl.merge(a, b)
--  if type(a) == "table" and type(b) == "table" then
--    for k, v in pairs(b) do
--      if type(v) == "table" and type(a[k] or false) == "table" then
--        M.merge(a[k], v)
--      else
--        a[k] = v
--      end
--    end
--  end
--  return a
-- end

---@param group string
function M.augroup(group)
  -- local id = vim.api.nvim_create_augroup(group, { clear = true })
  vim.api.nvim_create_augroup(group, { clear = true })

  ---@param autocmds fun(autocmd: fun(event: table | string, opts: table, command: function | string))
  return function(autocmds)
    autocmds(function(event, opts, command)
      -- opts.group = id
      opts.group = group
      if type(command) == "function" then
        opts.callback = command
      else
        opts.command = command
      end
      vim.api.nvim_create_autocmd(event, opts)
    end)
  end
end

---create and autocommand on an already defined augroup
---@param group string
---@param cmds table
---@param clear boolean
---@param buffer boolean
function M.autocmd(group, cmds, clear, buffer)
  clear = clear == nil and false or clear
  buffer = buffer == nil and false or buffer
  if type(cmds) == "string" then
    cmds = { cmds }
  end
  vim.cmd("augroup " .. group)
  if clear and not buffer then
    vim.cmd "autocmd!"
  end
  if buffer and clear then
    vim.cmd "autocmd! * <buffer>"
  end
  if buffer and not clear then
    vim.cmd "autocmd * <buffer>"
  end
  for _, c in ipairs(cmds) do
    vim.cmd("autocmd " .. c)
  end
  vim.cmd "augroup END"
end

function M.wkbind(binds, opts)
  opts = opts or {}
  opts = vim.tbl_deep_extend("force", {
      prefix = "<leader>",
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
  }, opts)
  if not vim.tbl_contains(opts, "buffer") then
    opts.buffer = nil
  end
  local ok, wk = pcall(require, "which-key")
  if not ok then
    vim.notify("could not load which-key, is it installed?")
    return
  end
  local mappings = {
    normal = "n",
    insert = "i",
    visual = "v",
  }
  -- Remap using which_key
  for mode_name, mode_char in pairs(mappings) do
    opts.mode = mode_char
    wk.register(binds[mode_name], opts)
  end
end

-- function M.configs()
--  local configs = vim.tbl_deep_extend("force",
--    require("configs.global"),
--    require("configs.custom")
--  )
--  for _, func in pairs(configs) do
--    if type(func) == "function" then
--      func()
--    end
--  end
-- end

return M
