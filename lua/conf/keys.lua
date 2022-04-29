local M = {}

M.wk = require("which-key")

local function map(binds, opts)
  M.wk.register(binds, vim.tbl_extend("keep", opts or {}, {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
  }))
end
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

TelescopeMapArgs = TelescopeMapArgs or {}

local function telecmd(key, fn, options)
  TelescopeMapArgs[t(key .. fn)] = options or {}
  return ([[:lua R("modules.editor.telescope")["%s"](TelescopeMapArgs["%s"])<CR>]]):format(fn, t(key .. fn))
end

function M.terminal()
  vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true }, 0)
  vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true, silent = true }, 0)
  vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true, silent = true }, 0)
  vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true, silent = true }, 0)
  vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true, silent = true }, 0)
end

function M.common()
  M.terminal()
  map({ -- insert mode
    -- move text up and down
    ["<A-j>"] = { "<ESC>:m+<CR>==gi", "Shifts text up" },
    ["<A-k>"] = { "<ESC>:m-2<CR>==gi", "Shifts text down" }
  }, { prefix = "", mode = "i" })
  map({ -- visual Mode
    ["/"]     = { "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
    -- move text up and down
    ["<A-j>"] = { "m'>+<CR>gv=gv", "Shifts text up" },
    ["<A-k>"] = { "m-2<CR>gv=gv", "Shifts text down" },
    -- indent
    ["<"]     = { "<gv", "Indent left" },
    [">"]     = { ">gv", "Indent right" }
  }, { prefix = "", mode = "v" })
  map({ -- visual block mode
    -- move text up and down
    ["J"]     = { ":move '>+1<CR>gv-gv", "Shift text up" },
    ["K"]     = { ":move '<-2<CR>gv-gv", "Shift text down" },
    ["<A-j>"] = { ":move '>+1<CR>gv-gv", "Shift text" },
    ["<A-k>"] = { ":move '<-2<CR>gv-gv", "Indent right" }
  }, { prefix = "", mode = "x" })
  map({ -- normal mode
    ["k"]     = { [[v:count == 0 ? "gk" : "k"]], "remap for dealing with wordwrap"},
    ["j"]     = { [[v:count == 0 ? "gj" : "j"]], "remap for dealing with wordwrap"},
  }, { prefix = "", expr = true, mode = "n" })

  map({ -- normal mode
    ["<C-s>"] = { ":Telescope command_palette<CR>", "Command Palette" },
    ["<ESC>"] = {"<ESC><Cmd>noh<CR>", "No Highlight" },
    ["<C-/>"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
    -- move text up and down
    ["<A-j>"] = { ":m+<CR>==", "Shifts text up" },
    ["<A-k>"] = { ":m-2<CR>==", "Shifts text down" },
    -- navigation
    ["<C-h>"] = { "<C-w>h", "Move cursor left buffer" },
    ["<C-j>"] = { "<C-w>j", "Move cursor below buffer" },
    ["<C-k>"] = { "<C-w>k", "Move cursor above buffer" },
    ["<C-l>"] = { "<C-w>l", "Move cursor right buffer" },
     -- resize panes
    ["<S-h>"] = { ":CmdResizeLeft<CR>", "Resize buffer toward left" },
    ["<S-j>"] = { ":CmdResizeDown<CR>", "Resize buffer toward below" },
    ["<S-k>"] = { ":CmdResizeUp<CR>", "Resize buffer towards above" },
    ["<S-l>"] = { ":CmdResizeRight<CR>", "Resize buffer toward right" },
  }, { prefix = "", mode = "n" })
  map({ -- command mode
    ["<C-r><C-r>"] = { "<Plug>(TelescopeFuzzyCommandSearch)", " Command fzf search" },
  }, { prefix = "", mode = "c", nowait = true })
  map({ -- command mode
    ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', "" },
    ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', "" }
  }, { prefix = "", mode = "c", expr = true })
  map({ -- <leader> mappings
    [";"] = { ":lua require('mini.starter').open()<CR>", "MiniStartup" },
    ["j"] = { ":HopWord<CR>", "Jump!" },
    ["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
    ["\\"] = {":vnew<CR>", "Split Vertical" },
    ["-"] = { ":new<CR>", "Split Horizontal" },
    ["c"] = { ":lua MiniBufremove.delete(0, false)<CR>", "Close" },
    ["e"] = { ":Telescope file_browser<CR>", "File Explorer" },
    ["h"] = { ":Telescope command_palette<CR>", "Command Palette" },
    ["l"] = {
      name = "Language Server Protocol",
      ["i"] = { ":LspInfo", "Language installer info"},
      ["a"] = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      ["d"] = { ":lua vim.diagnostic.open_float()<CR>", "Hover Diagnostic" },
      ["f"] = { ":lua vim.lsp.buf.formatting_sync()<CR>", "Format" },
      ["I"] = { ":LspInstallInfo<CR>", "Installer Info" },
      ["r"] = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
      ["t"] = {
        name = "Telescope",
        ["d"] = { ":Telescope diagnostics<CR>", "Diagnostics" },
        ["D"] = { ":Telescope lsp_definitions<CR>", "Definitions" },
        ["t"] = { ":Telescope lsp_type_definitions<CR>", "Type Definitions" },
        ["i"] = { ":Telescope lsp_implementations<CR>", "Implementations" },
        ["r"] = { ":Telescope lsp_references<CR>", "References" },
        ["c"] = { ":Telescope lsp_code_actions<CR>", "Code Actions" },
        ["C"] = { ":Telescope lsp_range_code_actions<CR>", "Range Code Actions" },
        ["w"] = { ":Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
        ["W"] = { ":Telescope lsp_dynamic_workspace_symbols<CR>", "Dynamic Workspace Symbols" },
      },
      ["A"] = { ":AerialToggle right<CR>", "Toggle Aerial" }
    },
    ["s"] = {
      name = "Search", -- ":Telescope pickers<CR>"
      ["r"] = { ":Telescope resume<CR>", "Open Last" },
      ["a"] = { ":Telescope builtin<CR>", "Telescope Builtin's" },
      ["M"] = { ":Telescope man_pages<CR>", "Man Pages" },
      ["g"] = { ":Telescope grep_string<CR>", "Grep String" },
      ["l"] = { ":Telescope live_grep<CR>", "Live Grep" },
      ["n"] = { ":Telescope fzf_native<CR>", "FZF Native" },
      ["b"] = { ":Telescope current_buffer_fuzzy_find<CR>", "Buffer FZF Find" },
      ["R"] = { ":Telescope reloader<CR>", "Reloader" },
      ["L"] = { ":Telescope loclist<CR>", "Locations List" },
      ["B"] = { ":Telescope buffers<CR>", "Buffers" },
      -- ["F"] = { ":Telescope frecency<CR>", "Frecency" },
      ["j"] = { ":Telescope jumplist<CR>", "Jumplist" },
      ["S"] = { ":Telescope spell_suggest<CR>", "Spelling Suggestions" },
      ["H"] = { ":Telescope help_tags<CR>", "Help Tags" },
      ["m"] = { ":Telescope marks<CR>", "Marks" },
      ["t"] = { ":Telescope tags<CR>", "Tags" },
      ["<C-b>"] = { ":Telescope current_buffer_tags<CR>", "Current Buffer Tags" },
      ["T"] = { ":Telescope tagstack<CR>", "Tagstack" },
      ["s"] = { ":Telescope symbols<CR>", "Symbols" },
      ["q"] = { ":Telescope quickfix<CR>", "Quickfix" },
      ["<C-t>"] = { ":Telescope treesitter<CR>", "Treesitter" },
      ["f"] = {
        name = "Files",
        ["f"] = { ":Telescope find_files<CR>", "Files" },
        ["m"] = { ":Telescope media_files<CR>", "Media Files" },
        ["o"] = { ":Telescope oldfiles<CR>", "Old Files" },
      },
      ["h"] = {
        name = "History",
        ["h"] = { ":Telescope search_history<CR>", "History" },
        ["c"] = { ":Telescope command_history<CR>", "Command History" },
      },
      ["v"] = {
        name = "Vim",
        ["k"] = { ":Telescope keymaps<CR>", "Normal Mode Keymaps" },
        ["r"] = { ":Telescope registers<CR>", "Registers" },
        ["C"] = { ":Telescope colorscheme<CR>", "Colorschemes" },
        ["o"] = { ":Telescope vim_options<CR>", "Vim Options" },
        ["c"] = { ":Telescope commands<CR>", "Vim Commands" },
        ["a"] = { ":Telescope autocommands<CR>", "Vim Autocommands" },
      },
    },
    ["T"] = {
      name = "Terminal",
      ['h'] = { ":new | :term<CR>i", "Horizontal split" },
      ['v'] = { ":vnew | :term<CR>i", "Vertical split" },
      ['t'] = { ":vnew | :term htop<CR>i", "Htop" },
      ['n'] = { ":vnew | :term node<CR>i", "Node" },
      ['p'] = { ":vnew | :term python<CR>i", "Python" },
      ['g'] = { ":vnew | :term lazygit<CR>i", "LazyGit" },
    },
    ["p"] = {
      name = "Packer",
      ["c"] = { ":PackerCompile<cr>", "Compile" },
      ["i"] = { ":PackerInstall<cr>", "Install" },
      ["s"] = { ":PackerSync<cr>", "Sync" },
      ["S"] = { ":PackerStatus<cr>", "Status" },
      ["u"] = { ":PackerUpdate<cr>", "Update" },
      -- ["t"] = { ":Telescope packer<CR>", "Packer Telescope" },
    },
    ["G"] = {
      name = "Git",
      ["l"] = { ":vsplit | :term lazygit<CR>", "LazyGit" },
      -- ["b"] = { ":GitBlameToggle<CR>", "Git Blame Toggle" },
      ["f"] = {
        name = "Fugitive",
        ["s"] = { ":Git status", "Git Status" },
        ["l"] = { [[:Git log --graph --abbrev-commit --decorate --format=format:"%h - (%ar) %s - %an%d" --all<CR>]], "Git Log" },
        ["d"] = { ":Git diff<CR>", "Git Diff" },
        ["u"] = { ":Git diff --staged<CR>", "Git Diff Staged" },
      },
      ["s"] = {
        name = "GitSigns",
        ["d"] = { ":Gitsigns diffthis HEAD<CR>", "Git Diff" },
        ["j"] = { ":lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
        ["k"] = { ":lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
        ["l"] = { ":lua require 'gitsigns'.blame_line()<CR>", "Blame" },
        ["p"] = { ":lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
        ["r"] = { ":lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
        ["R"] = { ":lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
        ["s"] = { ":lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
        ["u"] = { ":lua require('gitsigns').undo_stage_hunk()<CR>", "Undo Stage Hunk" },
      },
      ["t"] = {
        name = "Telescope",
        ["s"] = { ":Telescope git_status<CR>", "Status" },
        ["S"] = { ":Telescope git_stash<CR>", "Stash" },
        ["b"] = { ":Telescope git_branches<CR>", "Branch's" },
        ["c"] = { ":Telescope git_commits<CR>", "Commis" },
        ["C"] = { ":Telescope git_bcommits<CR>", "Branch Commits" },
        ["f"] = { ":Telescope git_files<CR>", "Files" },
      },
    },
    ["S"] = {
      name = "Session",
      ["s"] = { function()
        local name = vim.fn.input("Session name: ")
        local input = vim.fn.input(("Save session %s? [Y/n] "):format(name))
        if input:lower() == "y" then
          MiniSessions.write(name)
        elseif input ~= nil then
           MiniSessions.write(name)
        else
          vim.notify(("Session %s not saved"):format(name))
        end
      end, "Save" },
      ["d"] = { function()
        local name = vim.fn.input("Session name: ")
        local input = vim.fn.input(("Delete session %s? [Y/n] "):format(name))
        if input:lower() ~= "y" then
          MiniSessions.delete(name)
        elseif input == nil then
          MiniSessions.delete(name)
        else
          vim.notify(("unable to delete the session %s"):format(name))
        end
      end, "Delete" },
    }
  })
end

function M.lsp(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  map({
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Goto next"},
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Goto prev"},
    ["<leader>"] = {
      name = "Diagnostics & Formatting",
      ["e"] = { ":lua vim.diagnostic.open_float()<CR>", "Open diagnostic float" },
      ["q"] = { ":lua vim.diagnostic.setloclist()<CR>", "Set loclist" },
      ["f"] = { ":lua vim.lsp.buf.formatting()<CR>", "Format"},
      ["c"] = { ":lua vim.lsp.buf.code_actions()<CR>", "Code Actions" },
      ["r"] = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
      ["w"] = {
        name = "Workspace",
        ["s"] = { ":lua vim.lsp.buf.workspace_symbols()<CR>", "Workspace Symbols" },
        ["a"] = { ":lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
        ["d"] = { ":lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
        ["p"] = { ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "Print Workspace Folders" },
      }
    },
    ["D"] = { ":lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    ["d"] = { ":lua vim.lsp.buf.definition()<CR>", "Definition" },
    ["T"] = { ":lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
    ["K"] = { ":lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["i"] = { ":lua vim.diagnostic.implementation()<CR>", "Implementation" },
    ["w"] = { ":lua vim.diagnostic.get_locations()<CR>", "Locations" },
    ["r"] = { ":lua vim.lsp.buf.references()<CR>", "References" },
    ["<C-k>"] = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    ["p"] = { ":lua vim.lsp.buf.document_highlight()<CR>", "Document Highlight" },
    ["a"] = { ":lua vim.lsp.buf.document_symbol()<CR>", "Document Symbol" },
  }, { prefix = "g", buffer = bufnr })
end

return M
