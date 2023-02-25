-- vscode is true if we are running in vscode
local vscode = vim.fn.exists("g:vscode") == 1

local pm = require("pm")
local plugins = require("plugins")

-- Leader
vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = vim.api.nvim_replace_termcodes(" ", true, true, true)

-- Plugins
pm.setup(plugins)
