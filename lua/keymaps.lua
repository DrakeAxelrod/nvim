local t = require "tools"
local nmap, imap, cmap, xmap, tmap, xmap, vmap = t.nmap, t.imap, t.cmap, t.xmap, t.tmap, t.xmap, t.vmap
local silent, noremap, nowait, expr, remap = t.silent, t.noremap, t.nowait, t.expr, t.remap
local cmd, cu, opts = t.kcmd, t.kcu, t.keymap_opts

nmap({
  { "<esc>", cmd "noh", opts(noremap, silent, "Remove search highlights in normal mode") },
  { "<leader>e", cmd "NvimTreeToggle", opts(noremap, silent, "Toggle NvimTree") },
  { "<leader>j", "<cmd>HopWord<cr>", opts(noremap, silent, "Hop!") },
  { "<leader>-", cmd "new", opts(noremap, silent, "Horizonal split") },
  { "<leader>\\", cmd "vnew", opts(noremap, silent, "Vertical split") },
  -- indentations
  { "<tab>", ">>_", opts(noremap, silent, "Shift left") },
  { "<s-tab>", "<<_", opts(noremap, silent, "Shift right") },
  -- move lines
  { "<a-j>", ":m .+1<cr>==", opts(noremap, silent, "Move line down") },
  { "<a-k>", ":m .-2<cr>==", opts(noremap, silent, "Move line up") },
  -- escape terminal
  { "<esc>", "<C-\\><C-N>", opts(noremap, silent, "Escape terminal") },
  -- move between tabs
  { "<a-h>", cmd "tabprevious", opts(noremap, silent, "Previous tab") },
  { "<a-l>", cmd "tabnext", opts(noremap, silent, "Next tab") },
  -- testing this
  { "<leader>cd", cmd "cd %:p:h<cr>:pwd", opts(noremap, silent, "cd to cwd of the open buffer") },
  -- smart-splits
  { "<c-h>", cmd "SmartCursorMoveLeft", opts(noremap, silent, "Move to left split") },
  { "<c-j>", cmd "SmartCursorMoveDown", opts(noremap, silent, "Move to bottom split") },
  { "<c-k>", cmd "SmartCursorMoveUp", opts(noremap, silent, "Move to top split") },
  { "<c-l>", cmd "SmartCursorMoveRight", opts(noremap, silent, "Move to right split") },
  { "<s-h>" , cmd "SmartResizeLeft", opts(noremap, silent, "Resize left") },
  { "<s-j>" , cmd "SmartResizeDown", opts(noremap, silent, "Resize down") },
  { "<s-k>" , cmd "SmartResizeUp", opts(noremap, silent, "Resize up") },
  { "<s-l>" , cmd "SmartResizeRight", opts(noremap, silent, "Resize right") },
  -- dep
  { "<leader>d", "Dep", opts(noremap, silent, "Package Manager") },
  { "<leader>ds", cmd "DepSync", opts(noremap, silent, "Sync") },
  { "<leader>dl", cmd "DepList", opts(noremap, silent, "List") },
  { "<leader>dr", cmd "DepReload", opts(noremap, silent, "Reload") },
  { "<leader>dc", cmd "DepClean", opts(noremap, silent, "Clean") },
  { "<leader>dC", cmd "DepConfig", opts(noremap, silent, "Config") },
  { "<leader>dL", cmd "DepLog", opts(noremap, silent, "Log") },
})

vmap({
  { ">", cmd ">gv", opts(noremap, silent, "Indent right") },
  { "<", cmd "<gv", opts(noremap, silent, "Indent left") },
  { "<tab>", cmd ">gv", opts(noremap, silent, "Indent right") },
  { "<s-tab>", cmd "<gv", opts(noremap, silent, "Indent left") },
  { "<a-j>", ":m '>+1<cr>gv=gv", opts(noremap, silent, "Move line down") },
  { "<a-k>", ":m '<-2<cr>gv=gv", opts(noremap, silent, "Move line up") },
})

imap({
  { "<s-tab>", "<c-d>", opts(noremap, silent, "Indent right") },
  { "<tab>", "<c-d>", opts(noremap, silent, "Indent right") },
})
xmap({

  { "<a-j>", ":m '>+1<cr>gv-gv", opts(noremap, silent, "Move line down") },
  { "<a-k>", ":m '<-2<cr>gv-gv", opts(noremap, silent, "Move line up") },
})
tmap({
  { "<esc>", "<C-\\><C-N><C-w>h", opts(noremap, silent, "Move to left window") },
  { "<esc>", "<C-\\><C-N><C-w>j", opts(noremap, silent, "Move to bottom window") },
  { "<esc>", "<C-\\><C-N><C-w>k", opts(noremap, silent, "Move to top window") },
  { "<esc>", "<C-\\><C-N><C-w>l", opts(noremap, silent, "Move to right window") },
})
cmap({
  { "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", opts(noremap, nowait, "search command history") },
  { "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', opts(expr, noremap, "Move to next item") },
  { "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', opts(expr, noremap, "Move to previous item") },
})
