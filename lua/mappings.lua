local core = require("core")
local km = core.utils.create.keymap
local uc = core.utils.create.user_command
-- local ac = utils.create.autocmd
local augroup = core.utils.create.augroup
local check_mod = core.utils.check_mod


--[[=============================[  Keymaps  ]=============================]]--
km({ "n" }, "<esc>", "<cmd>noh<cr>", { desc = "Remove search highlights in normal mode" })
km({ "n", "x" }, "<space>", "<nop>", { desc = "Dont move cursor on space" })
-- Quick Leader Key Mapping
if check_mod("nvim-tree") then
  km({ "n" }, "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
end
if check_mod("hop") then
  km({ "n" }, "<leader>j", "<cmd>HopWord<cr>", { desc = "Hop!" })
end
km({ "n" }, "<leader>-", "<cmd>new<cr>", { desc = "Horizonal split" })
km({ "n" }, "<leader>\\", "<cmd>vnew<cr>", { desc = "Vertical split" })
-- Indentation
km({ "v" }, "<", "<gv", { desc = "Indent left" })
km({ "v" }, ">", ">gv", { desc = "Indent right" })
km({ "n" }, "<tab>", ">>_", { desc = "Indent left" })
km({ "n" }, "<s-tab>", "<<_", { desc = "Indent right" })
km({ "i" }, "<s-tab>", "<c-d>", { desc = "Indent right" })
km({ "v" }, "<tab>", ">gv", { desc = "Indent left" })
km({ "v" }, "<s-tab>", "<gv", { desc = "Indent right" })
-- Move lines
km({ "n" }, "<a-j>", ":m .+1<cr>==", { desc = "Move line down" })
km({ "n" }, "<a-k>", ":m .-2<cr>==", { desc = "Move line up" })
km({ "v" }, "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
km({ "v" }, "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
km({ "x" }, "<a-j>", ":m '>+1<cr>gv-gv", { desc = "Move line down" })
km({ "x" }, "<a-k>", ":m '<-2<cr>gv-gv", { desc = "Move line up" })
if check_mod("smart_splits") then
-- Move between windows
  km({ "n" }, "<c-h>", ":SmartCursorMoveLeft", { desc = "Move to left window" })
  km({ "n" }, "<c-j>", ":SmartCursorMoveDown", { desc = "Move to bottom window" })
  km({ "n" }, "<c-k>", ":SmartCursorMoveUp", { desc = "Move to top window" })
  km({ "n" }, "<c-l>", ":SmartCursorMoveRight", { desc = "Move to right window" })
  -- Resize windows
  km({ "n" }, "<s-h>", ":SmartCursorMoveLeft", { desc = "Resize Left" })
  km({ "n" }, "<s-j>", ":SmartCursorMoveDown", { desc = "Resize Down" })
  km({ "n" }, "<s-k>", ":SmartCursorMoveUp", { desc = "Resize Up" })
  km({ "n" }, "<s-l>", ":SmartCursorMoveRight", { desc = "Resize Right" })
end
-- Move between tabs
km({ "n" }, "<a-h>", ":tabprevious<cr>", { desc = "Move to left tab" })
km({ "n" }, "<a-l>", ":tabnext<cr>", { desc = "Move to right tab" })
-- Terminal mode
km({ "n" }, "<esc>", "<C-\\><C-N>", { desc = "Escape Terminal" })
km({ "t" }, "<esc>", "<C-\\><C-N><C-w>h", { desc = "Move to left window" })
km({ "t" }, "<esc>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom window" })
km({ "t" }, "<esc>", "<C-\\><C-N><C-w>k", { desc = "Move to top window" })
km({ "t" }, "<esc>", "<C-\\><C-N><C-w>l", { desc = "Move to right window" })
-- Command mode
if check_mod("telescope") then
  km({ "c" }, "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true, desc = "search command history" })
end
km({ "c" }, "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true, desc = "Move to next item" })
km({ "c" }, "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true, desc = "Move to previous item" })
-- Dep (Package Manager)
km({ "n" }, "<leader>d", "Dep", { desc = "Package Manager" })
km({ "n" }, "<leader>ds", "<cmd>DepSync<cr>", { desc = "Sync" })
km({ "n" }, "<leader>dl", "<cmd>DepList<cr>", { desc = "List" })
km({ "n" }, "<leader>dr", "<cmd>DepReload<cr>", { desc = "Reload" })
km({ "n" }, "<leader>dc", "<cmd>DepClean<cr>", { desc = "Clean" })
km({ "n" }, "<leader>dC", "<cmd>DepConfig<cr>", { desc = "Config" })
km({ "n" }, "<leader>dL", "<cmd>DepLog<cr>", { desc = "Log" })

--[[=============================[  Commands  ]=============================]]--
uc("SayHello", "echo 'Hello World!'", { desc = "Say hello as a command" })
-- core.on_attach(function(client, bufnr)
--   local bufcmd = function(n, name, cmd, opts)
--     opts = opts or {}
--     vim.api.nvim_buf_create_user_command(n, name, cmd, opts)
--   end
--   -- commands
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   bufcmd(bufnr, "LspDeclaration", vim.lsp.buf.declaration)
--   bufcmd(bufnr, "LspDefinition", vim.lsp.buf.definition)
--   bufcmd(bufnr, "LspTypeDefinition", vim.lsp.buf.type_definition)
--   bufcmd(bufnr, "LspReferences", vim.lsp.buf.references)
--   bufcmd(bufnr, "LspRename", vim.lsp.buf.rename)
--   bufcmd(bufnr, "LspHover", vim.lsp.buf.hover)
--   bufcmd(bufnr, "LspSignatureHelp", vim.lsp.buf.signature_help)
--   bufcmd(bufnr, "LspImplementation", vim.lsp.buf.implementation)
--   bufcmd(bufnr, "LspCodeAction", vim.lsp.buf.code_action)
--   -- bufcmd(bufnr, "LspCodeLens", vim.lsp.buf.code_lens)
--   bufcmd(bufnr, "LspDiagnosticsFloat", vim.diagnostic.open_float)
--   bufcmd(bufnr, "LspDiagnosticGoToNext", function()
--     vim.diagnostic.goto_next({ border = "rounded" })
--   end)
--   bufcmd(bufnr, "LspDiagnosticGoToPrevious", function()
--     vim.diagnostic.goto_prev({ border = "rounded" })
--   end)
--   bufcmd(bufnr, "LspSetLoclist", vim.diagnostic.setloclist)
--   bufcmd(bufnr, "LspFormat", function()
--     vim.lsp.buf.format({ async = true })
--   end)
-- end)

--[[=============================[  Autocommands  ]=============================]]--
augroup("UserMisc")(function(ac)
  -- highlight on yank
  ac("TextYankPost", {
    pattern = "*",
  }, function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end)

  ac("BufEnter", {
      desc = "Wrap on enter for json files",
      pattern = { "*.json", "*.jsonc" }
    }, function()
      vim.wo.wrap = true
  end)

  ac("FileType", {
    desc = "Attach treesitter highlight for zsh files",
    pattern = "zsh"
  }, function()
      require("nvim-treesitter.highlight").attach(0, "bash")
  end)

  ac("FileType", {
    desc = "Disable miniindent for NvimTree, Telescope and startup",
    pattern = "NvimTree,Telescope,startup"
  }, function()
      vim.b.miniindentscope_disable = true
  end)

  ac("TermOpen", {
    pattern = "*"
  }, function()
    vim.cmd("setlocal statusline= listchars= nonumber norelativenumber")
    -- vim.cmd("startinsert")
  end)

  -- ac("TermClose", {
  --   pattern = "*"
  -- }, function()
  --   vim.cmd([[call feedkeys("\<cr>")"]])
  -- end)

  ac("VimResized", {
    desc = "Auto resize windows",
    pattern = "*"
  }, function()
      vim.cmd "wincmd ="
  end)

end)
