require("core") -- load core

if is_vscode then return end -- exit if we are in vscode

-- Impatient
nvim.impatient() -- enable impatient

-- Leader
nvim.leader(" ") -- set leader to space

-- Options
local options = require("options") -- options spec
nvim.options(options) -- set options

-- Plugins
local pm = require("pm") -- load plugin manager
-- local plugins = require("plugins") -- plugin spec
pm.setup() -- setup plugins
