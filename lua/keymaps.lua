local t = require "tools"
local nmap, imap, cmap, xmap, tmap, xmap, vmap = t.nmap, t.imap, t.cmap, t.xmap, t.tmap, t.xmap, t.vmap
local silent, noremap, nowait, expr, remap = t.silent, t.noremap, t.nowait, t.expr, t.remap
local cmd, cu, opts = t.kcmd, t.kcu, t.keymap_opts

nmap({ "<leader>cd", cmd "cd %:p:h<cr>:pwd", opts(noremap, silent, "cd to cwd of the open buffer") })

-- vmap({
--   { "<leader>cd", cmd("cd %:p:h<cr>:pwd"), opts(noremap,silent,"Switch CWD to the directory of the open buffer") }
-- })
