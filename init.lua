-- vscode is true if we are running in vscode
local vscode = vim.fn.exists("g:vscode") == 1

-- libs
local pm = require("pm")
local fn = require("fn")

-- dicts
local plugins = require("plugins")
local settings = require("settings")

-- Leader
vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = vim.api.nvim_replace_termcodes(" ", true, true, true)

-- Options
fn.options(settings)

-- Plugins
pm.setup(plugins)
