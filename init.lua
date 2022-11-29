require "utils" .init {
  packages_dir = "packages",
  --- @usage Sets all keymaps
  --- @param check_mod fun(mod_name: string): boolean
  --- @param km fun(mode: string | table, lhs: string, rhs: string, opts: table)
  keymaps = function(check_mod, km)
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
  end,
  --- @usage sets commands
  --- @param check_mod fun(mod_name: string): boolean
  --- @param uc fun(name: string, fn: fun() | string, opts: table)
  commands = function(check_mod, uc)
    uc("SayHello", "echo 'Hello World!'", { desc = "Say hello as a command" })
  end,
  --- @usage sets autocommands
  --- @param check_mod fun(mod_name: string): boolean
  --- @param augroup fun(name: string): fun(autocmds: fun(event: table | string, opts: table, command: function | string))
  autocmds = function(check_mod, augroup)

    --- @param ac fun(event: table | string, opts: table, command: function | string)
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
  end,
  --- @usage sets options
  options = function()
    return {
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
        cmdheight = 1, -- hide command line unless entering command
        clipboard = "unnamedplus", -- use system clipboard
        autochdir = false, -- auto chdir
        foldlevelstart = 99, -- Sets "foldlevel" when starting to edit another buffer in a window.
        foldmethod = "expr", -- folding set to "expr" for treesitter based folding
        foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
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
  end,
}
