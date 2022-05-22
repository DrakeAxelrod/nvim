local M = {}
local desc = function(description)
  return { silent = true, noremap = true, desc = description }
end
M.standard = {
  { { "n" }, "<esc>", "<Esc>:noh<CR>", desc "remove search highlights in normal mode" },
	{ { "n", "x" }, "<space>", "<nop>", desc "Dont move cursor on space" },
  --> Move current line / block with Alt-j/k a la vscode. <--
  { { "n" }, "<a-j>", ":m .+1<CR>==", desc "move text down" },
  { { "n" }, "<a-k>", ":m .-2<CR>==", desc "move text up" },
  { { "i" }, "<a-k>", "<esc>:m .-2<CR>==gi", desc "move text down" },
  { { "i" }, "<a-j>", "<esc>:m .+1<CR>==gi", desc "move text up" },
  { { "x" }, "<a-j>", ":m '>+1<CR>gv-gv",  desc "move text up" },
  { { "x" }, "<a-k>", ":m '<-2<CR>gv-gv", desc "move text down" },
	--> resize buffers <--
	{ { "n" }, "<s-h>", ":CmdResizeLeft<cr>", desc "Resize buffer left" },
	{ { "n" }, "<s-j>", ":CmdResizeDown<cr>", desc "Resize buffer down" },
	{ { "n" }, "<s-k>", ":CmdResizeUp<cr>", desc "Resize buffer up" },
	{ { "n" }, "<s-l>", ":CmdResizeRight<cr>", desc "Resize buffer right" },
	--> swap buffers <--
	{ { "n" }, "<c-h>", "<c-w>h", desc "Cursor to left buffer" },
	{ { "n" }, "<c-j>", "<c-w>j", desc "Cursor to bottom buffer" },
	{ { "n" }, "<c-k>", "<c-w>k", desc "Cursor to top buffer" },
	{ { "n" }, "<c-l>", "<c-w>l", desc "Cursor to right buffer" },
  --> quickfix <--
  { { "n" }, "]q", ":cnext<CR>", desc "Quickfix next" },
  { { "n" }, "[q", ":cprev<CR>", desc "Quickfix previous" },
  { { "n" }, "<c-q>", ":call QuickFixToggle()<CR>", desc "Quickfix toggle" },
  --> indentation <--
  { { "v" }, "<", "<gv", desc "Indent to the left" },
  { { "v" }, ">", ">gv", desc "Indent to the right" },
  --> command mode <--
  { { "c" }, "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true, desc = "search command history" } },
  { { "c" }, "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
  { { "c" }, "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
  --> terminal mode <--
  { { "t" }, "<esc>", "<C-\\><C-N>", desc "leave insert in terminal" },
  { { "t" }, "<C-h>", "<C-\\><C-N><C-w>h", desc "Terminal cursor to left buffer" },
  { { "t" }, "<C-j>", "<C-\\><C-N><C-w>j", desc "Terminal cursor to bottom buffer" },
  { { "t" }, "<C-k>", "<C-\\><C-N><C-w>k", desc "Terminal cursor to top buffer" },
  { { "t" }, "<C-l>", "<C-\\><C-N><C-w>l", desc "Terminal cursor to right buffer" },
  --> leader binds <--
  { { "n" }, "<leader>;", ":Alpha<cr>", desc "Dashboard" },
  { { "n" }, "<leader>w", ":w!<cr>", desc "Save" },
  { { "n" }, "<leader>:", ":Telescope command_center<cr>", desc "Command Palette" },
  { { "n" }, "<leader>e", ":Neotree toggle<cr>", desc "File Explorer" },
  { { "n" }, "<leader><s-e>", ":Telescope file_browser path=%:p:h<CR>", desc "Telescope File Browser" },
  { { "n" }, "<leader>-", ":new<CR>", desc "Horizonal Split" },
  { { "n" }, "<leader>\\", ":vnew<CR>", desc "Vertical Split" },
  { { "n" }, "<leader>j", ":HopWord<CR>", desc "Jump!" },
  { { "n" }, "<leader>?", ":Cheatsheet<cr>", desc "Cheatsheet" },
  --> packer <--
  { { "n" }, "<leader>p", "Packer", desc "Packer" },
  { { "n" }, "<leader>pc", ":PackerCompile<cr>", desc "Compile" },
  { { "n" }, "<leader>pi", ":PackerInstall<cr>", desc "Install" },
  { { "n" }, "<leader>ps", ":PackerSync<cr>", desc "Sync" },
  { { "n" }, "<leader>pS", ":PackerStatus<cr>", desc "Status" },
  { { "n" }, "<leader>pu", ":PackerUpdate<cr>", desc "Update" },
  --> lsp <--
  { { "n" }, "gK", vim.diagnostic.open_float, desc "Diagnostic float" },
  { { "n" }, "gK", vim.lsp.buf.hover, desc "Hover" },
  { { "n" }, "gD", vim.lsp.buf.declaration, desc "Declaration" },
  { { "n" }, "gd", vim.lsp.buf.definition, desc "Definition" },
  { { "n" }, "gi", vim.lsp.buf.implementation, desc "Implementation" },
  { { "n" }, "<c-k>", vim.lsp.buf.signature_help, desc "Signature help" },
  { { "n" }, "gr", vim.lsp.buf.references, desc "References" },
  { { "n" }, "grn", vim.lsp.buf.rename, desc "Rename" },
  { { "n" }, "<leader>l", "LSP", desc "Lsp" },
  { { "n" }, "<leader>li", ":LspInfo<cr>", desc "Info" },
  { { "n" }, "<leader>lf", ":LspFormat<cr>", desc "Format" },
  { { "n" }, "<leader>lC", ":LspCodeAction<cr>", desc "Code Action" },
  --> Git <--
  { { "n" }, "<leader>g", "Git", desc "Git" },
  { { "n" }, "<leader>gg", ":Neogit<cr>", desc "Neogit" },
  { { "n" },"<leader>gj", ":lua require 'gitsigns'.next_hunk()<CR>", desc "Next Hunk" },
  { { "n" },"<leader>gk",  ":lua require 'gitsigns'.prev_hunk()<CR>", desc "Prev Hunk" },
  { { "n" },"<leader>gl", ":lua require 'gitsigns'.blame_line()<CR>", desc "Blame" },
  { { "n" },"<leader>gp", ":lua require 'gitsigns'.preview_hunk()<CR>", desc "Preview Hunk" },
  { { "n" },"<leader>gr",  ":lua require 'gitsigns'.reset_hunk()<CR>", desc "Reset Hunk" },
  { { "n" },"<leader>gR", ":lua require 'gitsigns'.reset_buffer()<CR>", desc "Reset Buffer" },
  { { "n" },"<leader>gs",  ":lua require 'gitsigns'.stage_hunk()<CR>", desc "Stage Hunk" },
  { { "n" },"<leader>gu",
    ":lua require 'gitsigns'.undo_stage_hunk()<CR>",
    desc "Undo Stage Hunk",
  },
  { { "n" },"<leader>go",  ":Telescope git_status<CR>", desc "Open changed file" },
  { { "n" },"<leader>gb", ":Telescope git_branches<CR>", desc "Checkout branch" },
  { { "n" },"<leader>gc", ":Telescope git_commits<CR>", desc "Checkout commit" },
  { { "n" },"<leader>gC",
    ":Telescope git_bcommits<CR>",
    desc "Checkout commit(for current file)",
  },
  { { "n" },"<leader>gd",
    ":Gitsigns diffthis HEAD<CR>",
    desc "Git Diff",
  },
  --> Telescope <--
  { { "n" }, "<leader>t", "Telescope", desc "Telescope" },
  { { "n" }, "<leader>t?", ":Telescope<cr>", desc "Telescope builtins" },
  { { "n" }, "<leader>tE", ":Telescope file_browser path=%:p:h<CR>", desc "Telescope File Browser" },
  { { "n" }, "<leader>tF", ":Telescope frecency<cr>", desc "Frecency" },
  { { "n" }, "<leader>tB", ":Telescope buffers<cr>", desc "Buffers" },
  { { "n" }, "<leader>tb", ":Telescope git_branches<CR>", desc "Checkout branch" },
  { { "n" }, "<leader>tc", ":Telescope colorscheme<CR>", desc "Colorscheme" },
  { { "n" }, "<leader>tf", ":Telescope find_files<CR>", desc "Find File" },
  { { "n" }, "<leader>th", ":Telescope help_tags<CR>", desc "Find Help" },
  { { "n" }, "<leader>tM", ":Telescope man_pages<CR>", desc "Man Pages" },
  { { "n" }, "<leader>tr", ":Telescope oldfiles<CR>", desc "Open Recent File" },
  { { "n" }, "<leader>tR", ":Telescope registers<CR>", desc "Registers" },
  { { "n" }, "<leader>tt", ":Telescope live_grep<CR>", desc "Text" },
  { { "n" }, "<leader>tk", ":Telescope keymaps<CR>", desc "Keymaps" },
  { { "n" }, "<leader>tC", ":Telescope commands<CR>", desc "Commands" },
  { { "n" }, "<leader>tp",
    ":lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>",
    desc "Colorscheme with Preview",
  },
}

M.toggleterm = function(term)
  -- local gitui = term:new({
  --   cmd = "gitui",
  --   direction = "float",
  -- })
  -- vim.keymap.set({ "n" }, "<leader>gt", function() gitui:toggle() end, desc "Gitui")
end

M.telescope = function()
  local actions = require("telescope.actions")
  return {
    i = {
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,

      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,

      ["<C-c>"] = actions.close,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,

      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,

      ["<PageUp>"] = actions.results_scrolling_up,
      ["<PageDown>"] = actions.results_scrolling_down,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-l>"] = actions.complete_tag,
      ["<C-/>"] = "which_key",
    },
    n = {
      ["<esc>"] = actions.close,
      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,
      ["H"] = actions.move_to_top,
      ["M"] = actions.move_to_middle,
      ["L"] = actions.move_to_bottom,

      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,
      ["gg"] = actions.move_to_top,
      ["G"] = actions.move_to_bottom,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,

      ["<PageUp>"] = actions.results_scrolling_up,
      ["<PageDown>"] = actions.results_scrolling_down,
      ["?"] = "which_key",
    },
  }
end

M.telescope_fb_browser = function()
  local fb = require("telescope").extensions.file_browser
  return {
    ["i"] = {
      -- Create file/folder at current path (trailing path separator creates folder)
      ["<A-c>"] = fb.actions.create,
      -- Rename multi-selected files/folders
      ["<A-r>"] = fb.actions.rename,
      -- Move multi-selected files/folders to current path
      ["<A-m>"] = fb.actions.move,
      -- Copy (multi-)selected files/folders to current path
      ["<A-y>"] = fb.actions.copy,
      -- Delete (multi-)selected files/folders
      ["<A-d>"] = fb.actions.remove,
      -- Open file/folder with default system application
      ["<C-o>"] = fb.actions.open,
      -- Go to parent directory
      ["<A-g>"] = fb.actions.goto_parent_dir,
      -- Go to home directory
      ["<A-h>"] = fb.actions.goto_home_dir,
      -- Go to current working directory (cwd)
      ["<C-w>"] = fb.actions.goto_cwd,
      -- Change nvim's cwd to selected folder/file(parent)
      ["<C-t>"] = fb.actions.change_cwd,
      -- Toggle between file and folder browser
      ["<C-f>"] = fb.actions.toggle_browser,
      -- Toggle hidden files/folders
      ["<C-.>"] = fb.actions.toggle_hidden,
      -- Toggle all entries ignoring ./ and ../
      ["<C-s>"] = fb.actions.toggle_all,
      -- toggle whichkey help
      ["<C-/>"] = "which_key",
    },
    ["n"] = {
      -- Create file/folder at current path (trailing path separator creates folder)
      ["c"] = fb.actions.create,
      -- Rename multi-selected files/folders
      ["r"] = fb.actions.rename,
      -- Move multi-selected files/folders to current path
      ["m"] = fb.actions.move,
      -- Copy (multi-)selected files/folders to current path
      ["y"] = fb.actions.copy,
      -- Delete (multi-)selected files/folders
      ["d"] = fb.actions.remove,
      -- Open file/folder with default system application
      ["o"] = fb.actions.open,
      -- Go to parent directory
      ["g"] = fb.actions.goto_parent_dir,
      -- Go to home directory
      ["e"] = fb.actions.goto_home_dir,
      -- Go to current working directory (cwd)
      ["w"] = fb.actions.goto_cwd,
      -- Change nvim's cwd to selected folder/file(parent)
      ["t"] = fb.actions.change_cwd,
      -- Toggle between file and folder browser
      ["f"] = fb.actions.toggle_browser,
      -- Toggle hidden files/folders
      ["h"] = fb.actions.toggle_hidden,
      -- Toggle all entries ignoring ./ and ../
      ["s"] = fb.actions.toggle_all,
      -- toggle whichkey help
      ["?"] = "which_key",
    },
  }
end

M.command_palette = function()
  local command_center = require("command_center")
  local noremap = { noremap = true }
  local silent_noremap = { noremap = true, silent = true }
  local cmds = {
    { description = "View all Current Keybindinds with Telescope", cmd = ":Telescope keymaps<cr>" },
    { description = "View all Current Commands with Telescope", cmd = ":Telescope commands<cr>" },
    { description = "View a neovim cheatsheet in Telescope", cmd = ":Cheatsheet<cr>" }
  }
  command_center.add(cmds)
end

M.bind = function(binds)
	for _, m in ipairs(binds) do
		local mode, keys, cmd, opts = unpack(m)
		vim.keymap.set(mode, keys, cmd, opts)
	end
end

M.init = function(self)
	self.bind(self.standard)
  -- self.command_palette()
end

return M
