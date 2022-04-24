local M = {}

local opts = require("conf.global.opts")
-- local keymaps = require("conf.global.keys")
local group = vim.api.nvim_create_augroup("XYZ", {
	clear = true,
})

M["vim_global"] = function()
	opts.disables()
	opts.global()
	opts.set()
end

M["events_global"] = function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "dart", "ruby", "yaml", "c", "cpp", "objc", "objcpp" },
		command = "setlocal ts=2 sw=2",
		group = group,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"help",
			"Trouble",
			"Outline",
			"git",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"NeogitStatus",
		},
		command = "setlocal colorcolumn=0 nocursorcolumn",
		group = group,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "dashboard" },
		command = "setlocal nowrap",
		group = group,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "org" },
		command = "setlocal foldmethod=expr",
		group = group,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "org" },
		command = "setlocal foldexpr=nvim_treesitter#foldexpr()",
		group = group,
	})
end

-- M["languages_global"] = function()
-- 	vim.api.nvim_create_autocmd("BufWinEnter", {
-- 		pattern = "*",
-- 		command = [[lua require("languages.global").setup()]],
-- 		group = group,
-- 	})
-- end

M["commands_global"] = function()
	vim.cmd('command! SetGlobalPath lua require("core.globals").fn.set_global_path()')
	vim.cmd('command! SetWindowPath lua require("core.globals").fn.set_window_path()')
end

-- M["keymaps_global"] = function()
--   local function map(mode, opts, keymaps)
--     for _, keymap in ipairs(keymaps) do
--       vim.keymap.set(mode, keymap[1], keymap[2], opts)
--     end
--   end
-- 	map("n", { noremap = false, silent = true }, keymaps.normal)
-- 	map("x", { noremap = false, silent = true }, keymaps.visual)
-- end

M["common_global"] = function()
	vim.g.indent_blankline_char = "▏"
	vim.g.indentLine_char = "▏"
	vim.g.gitblame_enabled = 0
	vim.g.gitblame_highlight_group = "CursorLine"
end

-- M["ctrlspace_pre_config_global"] = function()
-- 	vim.g.ctrlspace_use_tablineend = 1
-- 	vim.g.CtrlSpaceLoadLastWorkspaceOnStart = 1
-- 	vim.g.CtrlSpaceSaveWorkspaceOnSwitch = 1
-- 	vim.g.CtrlSpaceSaveWorkspaceOnExit = 1
-- 	vim.g.CtrlSpaceUseTabline = 0
-- 	vim.g.CtrlSpaceUseArrowsInTerm = 1
-- 	vim.g.CtrlSpaceUseMouseAndArrowsInTerm = 1
-- 	vim.g.CtrlSpaceGlobCommand = "rg --files --follow --hidden -g '!{.git/*,node_modules/*,target/*,vendor/*}'"
-- 	vim.g.CtrlSpaceIgnoredFiles = "\v(tmp|temp)[\\/]"
-- 	vim.g.CtrlSpaceSymbols = {
-- 		CS = " ",
-- 		Sin = "",
-- 		All = "",
-- 		Vis = "★",
-- 		File = "",
-- 		Tabs = "ﱡ",
-- 		CTab = "ﱢ",
-- 		NTM = "⁺",
-- 		WLoad = "ﰬ",
-- 		WSave = "ﰵ",
-- 		Zoom = "",
-- 		SLeft = "",
-- 		SRight = "",
-- 		BM = "",
-- 		Help = "",
-- 		IV = "",
-- 		IA = "",
-- 		IM = " ",
-- 		Dots = "ﳁ",
-- 	}
-- end

return M
