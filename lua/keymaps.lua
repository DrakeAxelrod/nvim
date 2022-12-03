local t = require("tools")
local km, cmd, lua = t.keymap, t.keycmd, t.keyluacmd

local telecmd = function()

end

-- km({ "n" }, "<esc><esc>", cmd("noh"), { desc = "Remove Highlights" })
km({ "n", "x" }, "<space>", "<nop>", { desc = "Dont move cursor on space" })
--> splits <--
km({ "n" }, "<leader>-", cmd("new"), { desc = "Horizonal Split" })
km({ "n" }, "<leader>\\", cmd("vnew"), { desc = "Vertical Split" })
--> indentation <--
km({ "n" }, "<tab>", ">>_", { desc = "Indent Left" })
km({ "n" }, "<s-tab>", "<<_", { desc = "Indent Right" })
--> move lines <--
km({ "n" }, "<a-j>", ":m .+1<cr>==", { desc = "Move Line Down" })
km({ "n" }, "<a-k>", ":m .-2<cr>==", { desc = "Move Line Up" })
km({ "v" }, "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move Line Down" })
km({ "v" }, "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move Line Up" })
km({ "x" }, "<a-j>", ":m '>+1<cr>gv-gv", { desc = "Move Line Down" })
km({ "x" }, "<a-k>", ":m '<-2<cr>gv-gv", { desc = "Move Line Up" })
--> move between windows <--
km({ "n" }, "<c-h>", cmd("SmartCursorMoveLeft"), { desc = "Move to Left Window" })
km({ "n" }, "<c-j>", cmd("SmartCursorMoveDown"), { desc = "Move to Bottom Window" })
km({ "n" }, "<c-k>", cmd("SmartCursorMoveUp"), { desc = "Move to Top Window" })
km({ "n" }, "<c-l>", cmd("SmartCursorMoveRight"), { desc = "Move to Right Window" })
--> resize windows <--
km({ "n" }, "<s-h>", cmd("SmartResizeLeft"), { desc = "Resize Left" })
km({ "n" }, "<s-j>", cmd("SmartResizeDown"), { desc = "Resize Down" })
km({ "n" }, "<s-k>", cmd("SmartResizeUp"), { desc = "Resize Up" })
km({ "n" }, "<s-l>", cmd("SmartResizeRight"), { desc = "Resize Right" })
--> move between tabs <--
-- km({ "n" }, "<a-h>", cmd("tabprevious"), { desc = "Move to Left Tab" })
-- km({ "n" }, "<a-l>", cmd("tabnext"), { desc = "Move to Right Tab" })
--> terminal mode <--
km({ "t" }, "<esc>", "<c-\\><c-N>", { desc = "Escape Terminal" })
--> command mode <--
km({ "c" }, "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true, desc = "search command history" })
km({ "c" }, "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true, desc = "Move to next item" })
km({ "c" }, "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
  { expr = true, noremap = true, desc = "Move to previous item" })

-- ===========================[[ Leader ]]=========================== --

km({ "n" }, "<leader>e", cmd("NvimTreeToggle"), { desc = "Toggle NvimTree" })
km({ "n" }, "<leader>j", cmd("HopWord"), { desc = "Hop!" })
km({ "n" }, "<leader>w", cmd("w"), { desc = "Save" })
km({ "n" }, "<leader>;", cmd("Alpha"), { desc = "Dashboard" })
km({ "n" }, "<leader>Q", cmd("wq!"), { desc = "Save and quit" })
km({ "n" }, "<c-\\>", cmd("ToggleTerm"), { desc = "ToggleTerm" })

-- ===========================[[ Terminal ]]=========================== --

km({ "n" }, "<leader>T", "Terminal", { desc = "Terminal" })
km({ "n" }, "<leader>Tf", cmd("ToggleTerm direction=float size=40"), { desc = "Float" })
km({ "n" }, "<leader>Tt", cmd("ToggleTerm"), { desc = "Toggle" })
-- ===========================[[ Help ]]=========================== --

km({ "n" }, "<leader>?", "Help", { desc = "Help" })
km({ "n" }, "<leader>??", cmd("Telescope cheatsheet"), { desc = "Cheatsheet" })
km({ "n" }, "<leader>?c", cmd("Telescope commands"), { desc = "Commands" })
km({ "n" }, "<leader>?a", cmd("Telescope autocommands"), { desc = "Autocommands" })
km({ "n" }, "<leader>?k", cmd("Telescope keymaps"), { desc = "Keymaps" })
km({ "n" }, "<leader>?r", cmd("Telescope registers"), { desc = "Registers" })

-- ===========================[[ Buffers ]]=========================== --

km({ "n" }, "<leader>B", "Buffer", { desc = "Buffer" })
km({ "n" }, "<leader>Bc", cmd("close"), { desc = "Show open buffers" })
km({ "n" }, "<leader>Bt", cmd("Telescope buffers"), { desc = "Buffers" })
km({ "n" }, "<leader>Bf", cmd("Telescope current_buffer_fuzzy_find"), { desc = "Current Buffer Fuzzy Find" })
km({ "n" }, "<leader>Bt", cmd("Telescope current_buffer_tags"), { desc = "Current Buffer Tags" })

-- ===========================[[ Packer ]]=========================== --

km({ "n" }, "<leader>P", "Packer", { desc = "Packer" })
km({ "n" }, "<leader>Ps", cmd("PackerSync"), { desc = "Sync" })
km({ "n" }, "<leader>PS", cmd("PackerStatus"), { desc = "Status" })
km({ "n" }, "<leader>Pu", cmd("PackerUpdate"), { desc = "Update" })
km({ "n" }, "<leader>Pc", cmd("PackerClean"), { desc = "Clean" })
km({ "n" }, "<leader>PC", cmd("PackerCompile"), { desc = "Compile" })

-- ===========================[[ LSP ]]=========================== --

-- km({ "n" }, "gh", ":Lspsaga lsp_finder<cr>", { desc = "LSP Finder" })
-- km({ "n" }, "gD", ":lua vim.lsp.buf.declaration()<cr>", { desc = "LSP Declaration" })
-- km({ "n" }, "gd", ":lua vim.lsp.buf.definition()<cr>", { desc = "LSP Definition" })
-- km({ "n" }, "gt", ":lua vim.lsp.buf.type_definition()<cr>", { desc = "LSP Type Definition" })
-- km({ "n" }, "gi", ":lua vim.lsp.buf.implementation()<cr>", { desc = "LSP Implementation" })
-- km({ "n" }, "gR", ":lua vim.lsp.buf.references()<cr>", { desc = "LSP References" })
-- km({ "n" }, "K", ":lua vim.lsp.buf.hover()<cr>", { desc = "LSP Hover" })
-- km({ "n" }, "<C-k>", ":lua vim.lsp.buf.signature_help()<cr>", { desc = "LSP Signature Help" })
-- km({ "n" }, "[d", ":lua vim.diagnostic.goto_prev()<cr>", { desc = "LSP Goto Previous" })
-- km({ "n" }, "]d", ":lua vim.diagnostic.goto_next()<cr>", { desc = "LSP Goto Next" })
-- km({ "n" }, "gp", ":Lspsaga peek_definition<cr>", { desc = "Peek", silent = true })

km({ "n" }, "<leader>L", "LSP", { desc = "LSP" })
-- km({ "n" }, "<leader>lc", ":Lspsaga code_action<cr>", { desc = "Code Action" })
-- km({ "n" }, "<leader>lR", ":Lspsaga rename<cr>", { desc = "Rename" })
km({ "n" }, "<leader>lf", ":lua vim.lsp.buf.format()<cr>", { desc = "Format" })
-- km({ "n" }, "<leader>lp", ":Lspsaga peek_definition<cr>", { desc = "Peek", silent = true })

--> Info <--
km({ "n" }, "<leader>LI", "Info", { desc = "Info" })
km({ "n" }, "<leader>LIl", cmd("LspLog"), { desc = "Log" })
km({ "n" }, "<leader>LIi", cmd("LspInfo"), { desc = "Info" })
km({ "n" }, "<leader>LIR", cmd("LspRestart"), { desc = "Restart" })
km({ "n" }, "<leader>LIm", cmd("Mason"), { desc = "Mason" })
km({ "n" }, "<leader>LIL", cmd("MasonLog"), { desc = "Mason Log" })
--> Treesitter <--
km({ "n" }, "<leader>LT", "Treesitter", { desc = "Treesitter" })
km({ "n" }, "<leader>tTT", cmd("Telescope treesitter"), { desc = "Telescope" })
--> Copilot <--
km({ "n" }, "<leader>LC", "Copilot", { desc = "Copilot" })
km({ "n" }, "<leader>LCp", cmd("Copilot panel"), { desc = "Panel" })
km({ "n" }, "<leader>LCt", cmd("Copilot toggle"), { desc = "Toggle" })
km({ "n" }, "<leader>LCt", cmd("Copilot status"), { desc = "Status" })
km({ "n" }, "<leader>LCv", cmd("Copilot verson"), { desc = "Version" })
--> LSP Telescope <--
km({ "n" }, "<leader>LT", "Telescope", { desc = "Telescope" })
km({ "n" }, "<leader>LTd", cmd("Telescope diagnostics"), { desc = "Outgoing Calls" })
km({ "n" }, "<leader>LTs", cmd("Telescope lsp_document_symbols"), { desc = "Document Symbols" })
km({ "n" }, "<leader>LTw", cmd("Telescope lsp_workspace_symbols"), { desc = "Workspace Symbols" })
km({ "n" }, "<leader>LTW", cmd("Telescope lsp_workspace_symbols"), { desc = "Dynamic Workspace Symbols" })
km({ "n" }, "<leader>LTD", cmd("Telescope lsp_definitions"), { desc = "Definitions" })
km({ "n" }, "<leader>LTr", cmd("Telescope lsp_references"), { desc = "References" })
km({ "n" }, "<leader>LTi", cmd("Telescope lsp_implementations"), { desc = "Implementations" })
km({ "n" }, "<leader>LTt", cmd("Telescope lsp_type_definitions"), { desc = "Type Definitions" })
km({ "n" }, "<leader>LTI", cmd("Telescope lsp_incoming_calls"), { desc = "Incoming Calls" })
km({ "n" }, "<leader>LTO", cmd("Telescope lsp_incoming_calls"), { desc = "Outgoing Calls" })

-- ===========================[[ Git ]]=========================== --

km({ "n" }, "<leader>g", "Git", { desc = "Git" })
km({ "n" }, "<leader>gg", cmd("Neogit"), { desc = "Neogit" })
km({ "n" }, "<leader>gj", lua("require 'gitsigns'.next_hunk()"), { desc = "Next Hunk" })
km({ "n" }, "<leader>gk", lua("require 'gitsigns'.prev_hunk()"), { desc = "Prev Hunk" })
km({ "n" }, "<leader>gl", lua("require 'gitsigns'.blame_line()"), { desc = "Blame" })
km({ "n" }, "<leader>gp", lua("require 'gitsigns'.preview_hunk()"), { desc = "Preview Hunk" })
km({ "n" }, "<leader>gr", lua("require 'gitsigns'.reset_hunk()"), { desc = "Reset Hunk" })
km({ "n" }, "<leader>gR", lua("require 'gitsigns'.reset_buffer()"), { desc = "Reset Buffer" })
km({ "n" }, "<leader>gs", lua("require 'gitsigns'.stage_hunk()"), { desc = "Stage Hunk" })
km({ "n" }, "<leader>gu", lua("require 'gitsigns'.undo_stage_hunk()"), { desc = "Undo Stage Hunk" })
km({ "n" }, "<leader>gd", cmd("Gitsigns diffthis HEAD"), { desc = "Git Diff" })
--> Git Telescope <--
km({ "n" }, "<leader>gT", "Telescope", { desc = "Telescope" })
km({ "n" }, "<leader>GTf", cmd("Telescope git_files"), { desc = "Git Files" })
km({ "n" }, "<leader>gTs", cmd("Telescope git_status"), { desc = "Status" })
km({ "n" }, "<leader>gTS", cmd("Telescope git_stash"), { desc = "Stash" })
km({ "n" }, "<leader>gTb", cmd("Telescope git_branches"), { desc = "Branches" })
km({ "n" }, "<leader>gTc", cmd("Telescope git_commits"), { desc = "Commits" })
km({ "n" }, "<leader>gTC", cmd("Telescope git_bcommits"), { desc = "Current File Commits" })
km({ "n" }, "<leader>gTd", cmd("Gitsigns diffthis HEAD"), { desc = "Git Diff" })

-- ===========================[[ Telescope ]]=========================== --

km({ "n" }, "<leader>S", "Telescope", { desc = "Telescope" })
km({ "n" }, "<leader>S?", cmd("Telescope"), { desc = "Telescope builtins" })
km({ "n" }, "<leader>Sc", cmd("Telescope colorscheme"), { desc = "Colorscheme" })
km({ "n" }, "<leader>Sh", cmd("Telescope highlights"), { desc = "Highlights" })
km({ "n" }, "<leader>Sl", cmd("Telescope loclist"), { desc = "Locations List" })
km({ "n" }, "<leader>Sr", cmd("Telescope resume"), { desc = "Resume" })
km({ "n" }, "<leader>SR", cmd("Telescope reloader"), { desc = "Reloader" })
km({ "n" }, "<leader>Sp", cmd("Telescope pickers"), { desc = "Pickers" })
km({ "n" }, "<leader>SP", cmd("Telescope planets"), { desc = "Planets" })
km({ "n" }, "<leader>Sv", cmd("Telescope vim_options"), { desc = "Vim Options" })
km({ "n" }, "<leader>St", cmd("Telescope tagstack"), { desc = "Tag Stack" })
km({ "n" }, "<leader>Sq", cmd("Telescope quickfix"), { desc = "Quickfix" })
km({ "n" }, "<leader>Sm", cmd("Telescope marks"), { desc = "Marks" })
km({ "n" }, "<leader>St", cmd("Telescope filetypes"), { desc = "Filetypes" })
km({ "n" }, "<leader>Sb", cmd("Telescope builtin"), { desc = "Builtin" })
km({ "n" }, "<leader>Sj", cmd("Telescope jumplist"), { desc = "Jump List" })
km({ "n" }, "<leader>Ss", cmd("Telescope spell_suggest"), { desc = "Spell Suggest" })

km({ "n" }, "<leader>SH", "History", { desc = "History" })
km({ "n" }, "<leader>SHc", cmd("Telescope command_history"), { desc = "Command" })
km({ "n" }, "<leader>SHq", cmd("Telescope quickfixhistory"), { desc = "Quickfix History" })
km({ "n" }, "<leader>SHs", cmd("Telescope search_history"), { desc = "Search History" })

km({ "n" }, "<leader>SF", "Find", { desc = "Find" })
km({ "n" }, "<leader>SFf", cmd("Telescope find_files"), { desc = "File" })
km({ "n" }, "<leader>SFh", cmd("Telescope help_tags"), { desc = "Help Tags" })
km({ "n" }, "<leader>SFg", cmd("Telescope grep_string"), { desc = "Grep String" })
km({ "n" }, "<leader>SFt", cmd("Telescope tags"), { desc = "Tags" })
km({ "n" }, "<leader>SFF", cmd("Telescope fd"), { desc = "FD" })
km({ "n" }, "<leader>SFo", cmd("Telescope oldfiles"), { desc = "Old Files" })
km({ "n" }, "<leader>SFl", cmd("Telescope live_grep"), { desc = "Live Grep" })
km({ "n" }, "<leader>SFM", cmd("Telescope man_pages"), { desc = "Man Pages" })
km({ "n" }, "<leader>SFs", cmd("Telescope symbols"), { desc = "Symbols" })

--> extensions <--
km({ "n" }, "<leader>SE", "Extensions", { desc = "Extensions" })
km({ "n" }, "<leader>SEf", cmd("Telescope frecency"), { desc = "Frecency" })
km({ "n" }, "<leader>SEn", cmd("Telescope notify"), { desc = "Notify" })
km({ "n" }, "<leader>SEe", cmd("Telescope file_browser"), { desc = "File Browser" })
