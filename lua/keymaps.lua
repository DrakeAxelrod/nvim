
local M = {}

-- vim.keymap.set({ "n" }, "<leader>", ":Whichkey<cr>", { desc = "LSP actions" })

M.lsp_attach = function(client, buf)
  vim.keymap.set({ "n" }, "K", ":lua vim.lsp.buf.hover()<cr>", { desc = "Show hover information", buffer = buf })
  vim.keymap.set({ "n" }, "gd", ":lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition", buffer = buf })
  vim.keymap.set({ "n" }, "gD", ":lua vim.lsp.buf.declaration()<cr>", { desc = "Go to declaration", buffer = buf })
  vim.keymap.set({ "n" }, "gi", ":lua vim.lsp.buf.implementation()<cr>", { desc = "Go to implementation", buffer = buf })
  vim.keymap.set({ "n" }, "gt", ":lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to type definition", buffer = buf })
  vim.keymap.set({ "n" }, "gR", ":lua vim.lsp.buf.references()<cr>", { desc = "Show references", buffer = buf })
  vim.keymap.set({ "n" }, "<C-k>", ":lua vim.lsp.buf.signature_help()<cr>", { desc = "Show signature help", buffer = buf })
  vim.keymap.set({ "n" }, "<F2>", ":lua vim.lsp.buf.rename()<cr>", { desc = "Rename", buffer = buf })
  vim.keymap.set({ "n", "x" }, "<F3>", ":lua vim.lsp.buf.format({async = true})<cr>", { desc = "Format", buffer = buf })
  vim.keymap.set({ "n" }, "<F4>", ":lua vim.lsp.buf.code_action()<cr>", { desc = "Code action", buffer = buf })

  vim.keymap.set({ "n" }, "[d", ":lua vim.diagnostic.goto_prev()<cr>", { desc = "LSP Goto Previous" })
  vim.keymap.set({ "n" }, "]d", ":lua vim.diagnostic.goto_next()<cr>", { desc = "LSP Goto Next" })
  vim.keymap.set({ "n" }, "gh", ":Lspsaga lsp_finder<cr>", { desc = "LSP Finder" })
  vim.keymap.set({ "n" }, "gp", ":Lspsaga peek_definition<cr>", { desc = "Peek", silent = true })
  vim.keymap.set({ "n" }, "<leader>l", "Language Server Protocol", { desc = "LSP" })
  vim.keymap.set({ "n" }, "<leader>ll", "Servers", { desc = "Servers" })
  vim.keymap.set({ "n" }, "<leader>lll", ":LspLog<cr>", { desc = "Log" })
  vim.keymap.set({ "n" }, "<leader>lli", ":LspInfo<cr>", { desc = "Info" })
  vim.keymap.set({ "n" }, "<leader>llR", ":LspRestart<cr>", { desc = "Restart" })
  -- vim.keymap.set({ "n" }, "<leader>lC", ":CopilotPanel<cr>", { desc = "Copilot Panel" })
  vim.keymap.set({ "n" }, "<leader>ls", ":Telescope lsp_document_symbols<cr>", { desc = "Find" })
  vim.keymap.set({ "n" }, "<leader>lS", ":Telescope lsp_workspace_symbols<cr>", { desc = "Find" })
  vim.keymap.set({ "n" }, "<leader>lr", ":Telescope lsp_references<cr>", { desc = "References" })
  vim.keymap.set({ "n" }, "<leader>ld", ":Telescope lsp_definitions<cr>", { desc = "Definitions" })
  vim.keymap.set({ "n" }, "<leader>li", ":Telescope lsp_implementations<cr>", { desc = "Implementations" })
  vim.keymap.set({ "n" }, "<leader>lc", ":Lspsaga code_action<cr>", { desc = "Code Action" })
  vim.keymap.set({ "n" }, "<leader>lR", ":Lspsaga rename<cr>", { desc = "Rename" })
  vim.keymap.set({ "n" }, "<leader>lf", ":lua vim.lsp.buf.format()<cr>", { desc = "Format" })
  vim.keymap.set({ "n" }, "<leader>lp", ":Lspsaga peek_definition<cr>", { desc = "Peek", silent = true })
  vim.keymap.set({ "n" }, "<leader>lm", "Mason", { desc = "Mason" })
  vim.keymap.set({ "n" }, "<leader>lmm", ":Mason<cr>", { desc = "Open" })
  vim.keymap.set({ "n" }, "<leader>lml", ":MasonLog<cr>", { desc = "Log" })
  -- vim.keymap.set({ "n" }, "<leader>l", ":lua vim.lsp.buf.hover()<cr>", { desc = "Show hover information", buffer = buf })
end


vim.keymap.set({ "n" }, "<esc>", ":noh<cr>", { desc = "Remove search highlights in normal mode" })
vim.keymap.set({ "n", "x" }, "<space>", "<nop>", { desc = "Dont move cursor on space" })

--> splits <--
vim.keymap.set({ "n" }, "<leader>-", ":new<cr>", { desc = "Horizonal split" })
vim.keymap.set({ "n" }, "<leader>\\", ":vnew<cr>", { desc = "Vertical split" })

--> top-level leader <--
vim.keymap.set({ "n" }, "<leader>e", ":Neotree toggle<cr>", { desc = "NeoTree" })
vim.keymap.set({ "n" }, "<leader>h", ":HopWord<cr>", { desc = "Hop!" })

--> indentation <--
vim.keymap.set({ "v" }, "<", "<gv", { desc = "Indent left" })
vim.keymap.set({ "v" }, ">", ">gv", { desc = "Indent right" })
vim.keymap.set({ "n" }, "<tab>", ">>_", { desc = "Indent left" })
vim.keymap.set({ "n" }, "<s-tab>", "<<_", { desc = "Indent right" })
vim.keymap.set({ "i" }, "<s-tab>", "<c-d>", { desc = "Indent right" })
vim.keymap.set({ "v" }, "<tab>", ">gv", { desc = "Indent left" })
vim.keymap.set({ "v" }, "<s-tab>", "<gv", { desc = "Indent right" })

--> move lines <--
vim.keymap.set({ "n" }, "<a-j>", ":m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set({ "n" }, "<a-k>", ":m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set({ "v" }, "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
vim.keymap.set({ "v" }, "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
vim.keymap.set({ "x" }, "<a-j>", ":m '>+1<cr>gv-gv", { desc = "Move line down" })
vim.keymap.set({ "x" }, "<a-k>", ":m '<-2<cr>gv-gv", { desc = "Move line up" })

--> SmartSplits <--
--> move between windows <--
vim.keymap.set({ "n" }, "<c-h>", ":SmartCursorMoveLeft<cr>", { desc = "Move to left window", noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-j>", ":SmartCursorMoveDown<cr>", { desc = "Move to bottom window", noremap = true, silent = true  })
vim.keymap.set({ "n" }, "<c-k>", ":SmartCursorMoveUp<cr>", { desc = "Move to top window", noremap = true, silent = true  })
vim.keymap.set({ "n" }, "<c-l>", ":SmartCursorMoveRight<cr>", { desc = "Move to right window", noremap = true, silent = true  })

--> resize windows <--
vim.keymap.set({ "n" }, "<s-h>", ":SmartCursorMoveLeft<cr>", { desc = "Resize Left", noremap = true, silent = true  })
vim.keymap.set({ "n" }, "<s-j>", ":SmartCursorMoveDown<cr>", { desc = "Resize Down", noremap = true, silent = true  })
vim.keymap.set({ "n" }, "<s-k>", ":SmartCursorMoveUp<cr>", { desc = "Resize Up", noremap = true, silent = true  })
vim.keymap.set({ "n" }, "<s-l>", ":SmartCursorMoveRight<cr>", { desc = "Resize Right", noremap = true, silent = true  })

--> move between tabs <--
vim.keymap.set({ "n" }, "<a-h>", ":tabprevious<cr>", { desc = "Move to left tab" })
vim.keymap.set({ "n" }, "<a-l>", ":tabnext<cr>", { desc = "Move to right tab" })
--> terminal mode <--
vim.keymap.set({ "n" }, "<esc>", "<C-\\><C-N>", { desc = "Escape Terminal" })
vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>h", { desc = "Move to left window" })
vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom window" })
vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>k", { desc = "Move to top window" })
vim.keymap.set({ "t" }, "<esc>", "<C-\\><C-N><C-w>l", { desc = "Move to right window" })
--> command mode <--
vim.keymap.set({ "c" }, "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true, desc = "Search command history" })
vim.keymap.set({ "c" }, "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true, desc = "Move to next item" })
vim.keymap.set({ "c" }, "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true, desc = "Move to previous item" })
--> Lazy.nvim <--
vim.keymap.set({ "n" }, "<leader>L", ":Lazy<cr>", { desc = "Lazy" })

--> buffers <--
vim.keymap.set({ "n" }, "<leader>b", "Buffer", { desc = "Buffer" })
vim.keymap.set({ "n" }, "<leader>bs", ":Neotree buffers<cr>", { desc = "Show open buffers" })
-- vim.keymap.set({ "n" }, "<leader>l", "LSP", { desc = "LSP" })

--> git <--
vim.keymap.set({ "n" }, "<leader>g", "Git", { desc = "Git" })
vim.keymap.set({ "n" }, "<leader>gg", ":Neogit<cr>", { desc = "Neogit" })
vim.keymap.set({ "n" }, "<leader>gn", ":Neotree git_status<CR>", { desc = "Neotree git status" })
vim.keymap.set({ "n" }, "<leader>gj", ":lua require 'gitsigns'.next_hunk()<CR>", { desc = "Next Hunk" })
vim.keymap.set({ "n" }, "<leader>gk", ":lua require 'gitsigns'.prev_hunk()<CR>", { desc = "Prev Hunk" })
vim.keymap.set({ "n" }, "<leader>gl", ":lua require 'gitsigns'.blame_line()<CR>", { desc = "Blame" })
vim.keymap.set({ "n" }, "<leader>gp", ":lua require 'gitsigns'.preview_hunk()<CR>", { desc = "Preview Hunk" })
vim.keymap.set({ "n" }, "<leader>gr", ":lua require 'gitsigns'.reset_hunk()<CR>", { desc = "Reset Hunk" })
vim.keymap.set({ "n" }, "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<CR>", { desc = "Reset Buffer" })
vim.keymap.set({ "n" }, "<leader>gs", ":lua require 'gitsigns'.stage_hunk()<CR>", { desc = "Stage Hunk" })
vim.keymap.set({ "n" }, "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<CR>", { desc = "Undo Stage Hunk" })
vim.keymap.set({ "n" }, "<leader>go", ":Telescope git_status<CR>", { desc = "Open changed file" })
vim.keymap.set({ "n" }, "<leader>gb", ":Telescope git_branches<CR>", { desc = "Checkout branch" })
vim.keymap.set({ "n" }, "<leader>gc", ":Telescope git_commits<CR>", { desc = "Checkout commit" })
vim.keymap.set({ "n" }, "<leader>gC", ":Telescope git_bcommits<CR>", { desc = "Checkout commit(for current file)" })
vim.keymap.set({ "n" }, "<leader>gd", ":Gitsigns diffthis HEAD<CR>", { desc = "Git Diff" })

--> Telescope <--
vim.keymap.set("n", "<leader>S", "Telescope", { desc = "Telescope" })
-- vim.keymap.set("n", "<leader>Sp", ":Telescope<cr>", { desc = "Pickers" })
vim.keymap.set("n", "<leader>Se", function()
	require("telescope").extensions.file_browser.file_browser()
end, { desc = "Open file browser" })
vim.keymap.set({ "n" }, "<leader>S", "Telescope", { desc = "Telescope" })
vim.keymap.set({ "n" }, "<leader>S?", ":Telescope<cr>", { desc = "Telescope builtins" })
vim.keymap.set({ "n" }, "<leader>SF", ":Telescope frecency<cr>", { desc = "Frecency" })
vim.keymap.set({ "n" }, "<leader>SB", ":Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set({ "n" }, "<leader>SN", ":Telescope notify<cr>", { desc = "Notify" })
vim.keymap.set({ "n" }, "<leader>Sb", ":Telescope git_branches<CR>", { desc = "Checkout branch" })
vim.keymap.set({ "n" }, "<leader>Sc", ":Telescope colorscheme<CR>", { desc = "Colorscheme" })
vim.keymap.set({ "n" }, "<leader>Sf", ":Telescope find_files<CR>", { desc = "Find File" })
vim.keymap.set({ "n" }, "<leader>Sh", ":Telescope help_tags<CR>", { desc = "Find Help" })
vim.keymap.set({ "n" }, "<leader>SM", ":Telescope man_pages<cr>", { desc = "Man Pages"})
vim.keymap.set({ "n" }, "<leader>Sm", ":Telescope oldfiles<cr>", { desc = "Old files" })
vim.keymap.set({ "n" }, "<leader>Sr", ":Telescope registers<cr>", { desc = "Registers" })
vim.keymap.set({ "n" }, "<leader>St", ":Telescope live_grep<cr>", { desc = "Text" })
vim.keymap.set({ "n" }, "<leader>Sk", ":Telescope keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set({ "n" }, "<leader>SC", ":Telescope commands<cr>", { desc = "Commands" })


return M