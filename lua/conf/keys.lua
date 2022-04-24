local M = {}

function M.terminal()
  vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { silent = true, noremap = true })
end

function M.command()
  local opts = { expr = true, noremap = true }
    -- search commands with telescope
    vim.keymap.set("c", "<C-r><C-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })
    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    vim.keymap.set("t", "<C-j>", [[pumvisible() ? "\\<C-n>" : "\\<C-j>"]], opts)
    vim.keymap.set("t", "<C-k>", [[pumvisible() ? "\\<C-p>" : "\\<C-k>"]], opts)
end

function M.insert()
  local opts = { silent = true, noremap = true }
  -- "jk" for quitting insert mode
  vim.keymap.set("i", "jk", "<ESC>", opts)
  -- "kj" for quitting insert mode
  vim.keymap.set("i", "kj", "<ESC>", opts)
  -- "jj" for quitting insert mode
  vim.keymap.set("i", "jj", "<ESC>", opts)
  -- Move current line / block with Alt-j/k ala vscode.
  vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
  vim.keymap.set("i", "<A-k>", "<Esc>:m .-1<CR>==gi", opts)
end

function M.visual()
  local opts = { silent = true, noremap = true }
  vim.keymap.set("v", "<", "<gv", opts)
  vim.keymap.set("v", ">", ">gv", opts)
  -- move text up and down
  vim.keymap.set("v", "<A-j>", "m'>+<CR>gv=gv")
  vim.keymap.set("v", "<A-k>", "m-2<CR>gv=gv")
end

function M.visual_block()
  local opts = { silent = true, noremap = true }
  -- Move selected line / block of text in visual mode
  vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
  vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
  -- Move current line / block with Alt-j/k ala vscode.
  vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)
  vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)
end

function M.normal()
  local opts = { silent = true, noremap = true }
  -- Move current line / block with Alt-j/k a la vscode.
  vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
  vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
  -- fuck off heightlighting
  vim.keymap.set("n", "<ESC>", "<ESC><cmd>noh<CR>", opts)
  -- file explorer
  vim.keymap.set("n", "<C-e>", ":Telescope file_browser<CR>", opts)
-- resizing splits
  vim.keymap.set("n", "<S-h>", require("smart-splits").resize_left)
  vim.keymap.set("n", "<S-j>", require("smart-splits").resize_down)
  vim.keymap.set("n", "<S-k>", require("smart-splits").resize_up)
  vim.keymap.set("n", "<S-l>", require("smart-splits").resize_right)
  -- moving between splits
  vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
  vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
  vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
  vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
end

function M.wk()
  return {
    visual = {
      -- ["/"] = { "<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" }
    },
    insert = {},
    normal = {
      [";"] = { ":Alpha<CR>", "Alpha" },
      ["\\"] = {
        ":vnew<CR>", "Vertical Split"
      },
      ["-"] = {
        ":new<CR>", "Horizontal Split"
      },
      ["e"] = { ":Telescope file_browser<CR>", "File Explorer" },
      -- ["/"] = { ":lua require("Comment.api").toggle_current_linewise()<CR>", "Comment" },
      ["W"] = { ":w<CR>", "Save" },
      ["Q"] = { ":q<CR>", "Quit" },
      ["c"] = { ":close<CR>", "Close" },
      ["p"] = {
        name = "Packer",
        ["c"] = { require("core.pack").compile, "Compile" },
        ["C"] = { require("core.pack").clean, "Clean" },
        ["i"] = { require("core.pack").install, "Install" },
        ["s"] = { require("core.pack").sync, "Sync" },
        ["S"] = { require("core.pack").status, "Status" },
        ["u"] = { require("core.pack").update, "Update" },
      },
      ["T"] = {
        name = "Terminal",
        ["h"] = { ":split | :term<CR>i", "Horizontal split" },
        ["v"] = { ":vsplit | :term<CR>i", "Vertical split" },
        ["t"] = { ":vsplit | :term htop<CR>i", "Htop" },
        ["n"] = { ":vsplit | :term node<CR>i", "Node" },
        ["p"] = { ":vsplit | :term python<CR>i", "Python" },
        ["g"] = { ":vsplit | :term lazygit<CR>i", "LazyGit" },
      },
      ["l"] = {
        name = "LSP",
        ["n"] = { ":LspGoToNext<CR>", "Go to next" },
        ["p"] = { ":LspGoToPrev<CR>", "Go to prev" },
        ["r"] = { ":LspRename<CR>", "Rename" },
        ["h"] = { ":LspHover<CR>", "Hover" },
        ["d"] = { ":LspDefinition<CR>", "Definition" },
        ["t"] = { ":LspTypeDefinition<CR>", "Type definition" },
        ["R"] = { ":LspReferences<CR>", "References" },
        ["a"] = { ":LspCodeAction<CR>", "Code action" },
        ["f"] = { ":LspFormatting<CR>", "Formatting" },
        ["F"] = { ":LspFormattingSync<CR>", "Sync formatting" },
        ["s"] = { ":SymbolsOutline<CR>", "Symbol Outline" },
        ["S"] = { ":LspDocumentSymbol<CR>", "Document symbol" },
        ["w"] = { ":LspWorkspaceSymbol<CR>", "Workspace symbol" },
      },
    }
  }
end

return M
