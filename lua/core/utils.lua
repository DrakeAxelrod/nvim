local M = {}

M.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.mapleader = c
end

M.localleader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.maplocalleader = c
end

M.options = function(options)
  for scope, settings in pairs(options) do
    for key, value in pairs(settings) do
      vim[scope][key] = value
    end
  end
end

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

--- Creates a new augroup
--- @param group string The name of the augroup
--- @return fun(autocmds: fun(event: table | string, opts: table, command: function | string))
M.augroup = function(group)
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

--- Creates a new autocmd
--- @param event string | table The event(s) to run the autocmd on
--- @param command function | string The command to run
--- @param opts table The options for the autocmd
M.autocmd = function(event, command, opts)
  if type(command) == "function" then
    opts.callback = command
  else
    opts.command = command
  end
  vim.api.nvim_create_autocmd(event, opts)
end

M.colorscheme = function(name)
  pcall(function()
    vim.cmd("colorscheme " .. name)
  end)
end

-- M.transparent_mode = function()
--   vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "*",
--     callback = function()
--       local hl_groups = {
--         "Normal",
--         "SignColumn",
--         "NormalNC",
--         "TelescopeBorder",
--         "NvimTreeNormal",
--         "NvimTreeNormalNC",
--         "EndOfBuffer",
--         "MsgArea",
--       }
--       for _, name in ipairs(hl_groups) do
--         vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
--       end
--     end,
--   })
--   vim.opt.fillchars = { eob = " " }
-- end

return M
