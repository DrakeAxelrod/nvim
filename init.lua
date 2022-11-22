local core = require "core"

core.options {
  g = {
    mapleader = " ", -- set leader key
    do_filetype_lua = 1, -- use filetype.lua
    did_load_filetypes = 0, -- don't use filetype.vim
    cursorhold_updatetime = 100, -- cursorhold updatetime
    highlighturl_enabled = true, -- highlight URLs by default
    zipPlugin = false, -- disable zip
    load_black = false, -- disable black
    loaded_2html_plugin = true, -- disable 2html
    loaded_getscript = true, -- disable getscript
    loaded_getscriptPlugin = true, -- disable getscript
    loaded_gzip = true, -- disable gzip
    loaded_logipat = true, -- disable logipat
    loaded_matchit = true, -- disable matchit
    loaded_netrw = true, -- disable netrw
    loaded_netrwFileHandlers = true, -- disable netrw
    loaded_netrwPlugin = true, -- disable netrw
    loaded_netrwSettngs = true, -- disable netrw
    loaded_remote_plugins = true, -- disable remote plugins
    loaded_tar = true, -- disable tar
    loaded_tarPlugin = true, -- disable tar
    loaded_zip = true, -- disable zip
    loaded_zipPlugin = true, -- disable zip
    loaded_vimball = true, -- disable vimball
    loaded_vimballPlugin = true, -- disable vimball
    loaded_python_provider = 0, -- dont use python2
    python_host_prog = "/bin/python2",
    python3_host_prog = "/bin/python",
    node_host_prog = "/bin/neovim-node-host",
  },
  opt = {
    cmdheight = 0, -- hide command line unless entering command
    clipboard = "unnamedplus", -- use system clipboard
    autochdir = true, -- auto chdir
    foldlevelstart = 99, -- Sets "foldlevel" when starting to edit another buffer in a window.
    foldmethod = "expr", -- folding set to "expr" for treesitter based folding
    foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    -- clipboard = "unnamedplus", -- Connection to the system clipboard
    completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
    copyindent = true, -- Copy the previous indentation on autoindenting
    cursorline = true, -- Highlight the text line of the cursor
    cursorlineopt = "number", -- (line,screenline,number, both - line/number ) Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
    concealcursor = "niv", -- Sets the modes in which text in the cursor line can also be concealed. When the current mode is listed then concealing happens just like in other lines.
    expandtab = true, -- Enable the use of space in tab
    fileencoding = "utf-8", -- File content encoding for the buffer
    history = 100, -- Number of commands to remember in a history table
    ignorecase = true, -- Case insensitive searching
    mouse = "nivc", -- Enable mouse support
    number = true, -- Show numberline
    numberwidth = 4, -- set number column width to 2 {default 4}
    relativenumber = false, -- Show relative numberline
    preserveindent = true, -- Preserve indent structure as much as possible
    pumheight = 10, -- Height of the pop up menu
    scrolloff = 2, -- Number of lines to keep above and below the cursor
    shiftwidth = 2, -- Number of space inserted for indentation
    showmode = false, -- Disable showing modes in command line
    sidescrolloff = 5, -- Number of columns to keep at the sides of the cursor
    signcolumn = "yes:1", -- Always show the sign column
    smartcase = true, -- Case sensitivie searching
    splitbelow = true, -- Splitting a new window below the current one
    splitright = true, -- Splitting a new window at the right of the current one
    swapfile = false, -- Disable use of swapfile for the buffer
    tabstop = 2, -- Number of space in a tab
    termguicolors = true, -- Enable 24-bit RGB color in the TUI
    title = true, -- set the title of window to the value of the titlestring
    titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
    background = "dark", -- background color of the window
    guifont = "JetBrainsMono Nerd Font:h12",
    guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
    errorbells = false, -- Ring the bell (beep or screen flash) for error messages.
    visualbell = false, -- Use visual bell instead of beeping.
    timeoutlen = 100, -- Length of time to wait for a mapped sequence
    undofile = true, -- Enable persistent undo
    updatetime = 300, -- Length of time to wait before triggering the plugin
    wrap = false, -- Disable wrapping of lines longer than the width of window
    writebackup = false, -- Disable making a backup before overwriting a file
    grepformat = "%f:%l:%c:%m", -- Format to recognize for the ":grep" command output.
    grepprg = "rg --hidden --vimgrep --smart-case --", -- Program to use for the |:grep| command.
    backspace = { "indent", "eol", "start" }, -- backspace behavior
    listchars = {
      -- eol = "↲",
      tab = "⎵/",
      nbsp = "+",
      trail = "·",
      extends = "→",
      precedes = "←",
    },
    fillchars = {
      --    item            default         Used for ~
      stl = " ", -- " " or "^" statusline of the current window
      stlnc = " ", -- " " or "=" statusline of the non-current windows
      horiz = "─", -- "─" or "-" horizontal separators |:split|
      horizup = "┴", -- "┴" or "-" upwards facing horizontal separator
      horizdown = "┬", -- "┬" or "-" downwards facing horizontal separator
      vert = "│", -- "│" or "|" vertical separators |:vsplit|
      vertleft = "┤", -- "┤" or "|" left facing vertical separator
      vertright = "├", -- "├" or "|" right facing vertical separator
      verthoriz = "┼", -- "┼" or "+" overlapping vertical and horizontal separator
      fold = "-", -- "·" or "-" filling "foldtext"
      foldopen = "-", -- "-" mark the beginning of a fold
      foldclose = "+", -- "+" show a closed fold
      foldsep = "│", -- "│" or "|" open fold middle marker
      diff = "-", -- "-" deleted lines of the "diff" option
      msgsep = " ", -- " " message separator "display"
      eob = " ", -- "~" empty lines at the end of a buffer
    },
  },
}

-- package manager - https://github.com/chiyadev/dep
-- arg = the directory your plugins are in inside lua directory
core.packages "packages"


local desc = function(description)
  return { silent = true, noremap = true, desc = description }
end

local smart_splits = require('smart-splits')
core.keys({
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
	{ { "n" }, "<s-h>", smart_splits.resize_left, desc "Resize buffer left" },
	{ { "n" }, "<s-j>", smart_splits.resize_down, desc "Resize buffer down" },
	{ { "n" }, "<s-k>", smart_splits.resize_up, desc "Resize buffer up" },
	{ { "n" }, "<s-l>", smart_splits.resize_right, desc "Resize buffer right" },
	--> swap buffers <--
	{ { "n" }, "<c-h>", smart_splits.move_cursor_left, desc "Cursor to left buffer" },
	{ { "n" }, "<c-j>", smart_splits.move_cursor_down, desc "Cursor to bottom buffer" },
	{ { "n" }, "<c-k>", smart_splits.move_cursor_up, desc "Cursor to top buffer" },
	{ { "n" }, "<c-l>", smart_splits.move_cursor_right, desc "Cursor to right buffer" },
  --> general buffers <--
  { { "n" }, "<leader>B", "Buffer", desc "Buffer Control" },
  { { "n" }, "<leader>Br", smart_splits.start_resize_mode, desc "Resize Mode" },
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
  --> leader binds <--
  { { "n" }, "<leader>W", ":w!<cr>", desc "Save" },
  { { "n" }, "<leader>Q", ":q!<cr>", desc "Quit" },
  { { "n" }, "<leader>e", ":Neotree toggle<cr>", desc "File Explorer" },
  { { "n" }, "<leader>-", ":new<CR>", desc "Horizonal Split" },
  { { "n" }, "<leader>\\", ":vnew<CR>", desc "Vertical Split" },
  { { "n" }, "<leader>j", ":HopWord<CR>", desc "Jump!" },
  { { "n" }, "<leader>?", ":Cheatsheet<cr>", desc "Cheatsheet" },
  --> dep package manager <--
  { { "n" }, "<leader>d", "Dep", desc "Package Manager" },
  { { "n" }, "<leader>dC", ":DepClean<cr>", desc "Clean" },
  { { "n" }, "<leader>dc", ":DepConfig<cr>", desc "Config" },
  { { "n" }, "<leader>ds", ":DepSync<cr>", desc "Sync" },
  { { "n" }, "<leader>dl", ":DepList<cr>", desc "List" },
  { { "n" }, "<leader>dr", ":DepReload<cr>", desc "Reload" },
  --> lsp <--
  { { "n" }, "gK", vim.diagnostic.open_float, desc "Diagnostic float" },
  { { "n" }, "gD", vim.lsp.buf.declaration, desc "Declaration" },
  { { "n" }, "gt", vim.lsp.buf.type_definition, desc "Type Definition" },
  { { "n" }, "gd", vim.lsp.buf.definition, desc "Definition" },
  { { "n" }, "gi", vim.lsp.buf.implementation, desc "Implementation" },
  { { "n" }, "gr", vim.lsp.buf.references, desc "References" },
  { { "n" }, "[d", vim.diagnostic.goto_prev, desc "References" },
  { { "n" }, "]d", vim.diagnostic.goto_next, desc "References" },
  { { "n" }, "<leader>rn", vim.lsp.buf.rename, desc "Rename" },
  { { "n" }, "<leader>l", "LSP", desc "Lsp" },
  { { "n" }, "<leader>lk", vim.lsp.buf.signature_help, desc "Signature help" },
  { { "n" }, "<leader>lK", vim.lsp.buf.hover, desc "Hover" },
  { { "n" }, "<leader>li", ":LspInfo<cr>", desc "Info" },
  { { "n" }, "<leader>lf", vim.lsp.buf.format, desc "Format" },
  { { "n" }, "<leader>lC", vim.lsp.buf.code_action, desc "Code Action" },
  --> Git <--
  { { "n" }, "<leader>g", "Git", desc "Git" },
  { { "n" }, "<leader>gg", ":Neogit<cr>", desc "Neogit" },
  { { "n" }, "<leader>gj", ":lua require 'gitsigns'.next_hunk()<CR>", desc "Next Hunk" },
  { { "n" }, "<leader>gk",  ":lua require 'gitsigns'.prev_hunk()<CR>", desc "Prev Hunk" },
  { { "n" }, "<leader>gl", ":lua require 'gitsigns'.blame_line()<CR>", desc "Blame" },
  { { "n" }, "<leader>gp", ":lua require 'gitsigns'.preview_hunk()<CR>", desc "Preview Hunk" },
  { { "n" }, "<leader>gr",  ":lua require 'gitsigns'.reset_hunk()<CR>", desc "Reset Hunk" },
  { { "n" }, "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<CR>", desc "Reset Buffer" },
  { { "n" }, "<leader>gs",  ":lua require 'gitsigns'.stage_hunk()<CR>", desc "Stage Hunk" },
  { { "n" }, "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<CR>", desc "Undo Stage Hunk" },
  { { "n" }, "<leader>go",  ":Telescope git_status<CR>", desc "Open changed file" },
  { { "n" }, "<leader>gb", ":Telescope git_branches<CR>", desc "Checkout branch" },
  { { "n" }, "<leader>gc", ":Telescope git_commits<CR>", desc "Checkout commit" },
  { { "n" }, "<leader>gC", ":Telescope git_bcommits<CR>", desc "Checkout commit(for current file)" },
  { { "n" }, "<leader>gd", ":Gitsigns diffthis HEAD<CR>", desc "Git Diff" },
  --> Telescope <--
  { { "n" }, "<leader>t", "Telescope", desc "Telescope" },
  { { "n" }, "<leader>t?", ":Telescope<cr>", desc "Telescope builtins" },
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
})


-- language servers setup - https://github.com/junnplus/lsp-setup.nvim
core.lsp({
  prefix = "servers", -- directory name for lsp servers configs
  default_mappings = false,
  -- Global on_attach
  on_attach = function(client, bufnr)
    -- Support custom the on_attach function for global
    -- Formatting on save as default
    require("lsp-setup.utils").format_on_save(client)
  end,
  -- Global capabilities
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})
