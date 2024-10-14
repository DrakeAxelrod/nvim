local M = {}

M.defaults = function()
  vim.g.do_filetype_lua = 1
  vim.opt.cmdheight = 1
  -- vim.pretty_print(lvim.builtin)

  vim.g.loaded_gzip = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  -- getscript
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_2html_plugin = 1
  -- matchit
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  --- netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
  -- dont use python2
  vim.g.loaded_python_provider = 0
  vim.g.python_host_prog = "/bin/python2"
  vim.g.python3_host_prog = "/bin/python"
  vim.g.node_host_prog = "/bin/neovim-node-host"

  vim.opt.hlsearch = true -- highlight all matches on previous search pattern
  -- vim.opt.iskeyword = "@,48-57,_,192-255" -- Keywords are used in searching and recognizing with many commands: "w", "*", "[i", etc.
  vim.opt.iskeyword = { "@", "48-57", "_", "192-255" }
  vim.opt.showmatch = true -- jump to correspond brace for matchtime
  vim.opt.matchtime = 2 -- default 5
  vim.opt.autochdir = true -- When on, Vim will change the current working directory whenever you open a file, switch buffers, delete a buffer or open/close a window.
  vim.opt.mouse = "nivc"
  vim.o.mousemoveevent = true
  -- Mouse support can be enabled for different modes:
  --  n       Normal mode
  --  v       Visual mode
  --  i       Insert mode
  --  c       Command-line mode
  --  h       all previous modes when editing a help file
  --  a       all previous modes
  --  r       for |hit-enter| and |more-prompt| prompt
  vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
  vim.opt.smarttab = true -- When on, a <Tab> in front of a line inserts blanks according to "shiftwidth".
  vim.opt.shiftround = true -- Round indent to multiple of "shiftwidth".
  vim.opt.textwidth = 100 -- Maximum width of text that is being inserted.  A longer line will be broken after white space to get this width.
  vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
  vim.opt.autoindent = true -- Copy indent from current line when starting a new line (typing <CR> in Insert mode or when using the "o" or "O" command).
  vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
  vim.opt.shiftwidth = 2 --  Returns the effective value of "shiftwidth". This is the "shiftwidth" value unless it is zero
  vim.opt.softtabstop = -1 -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
  vim.opt.timeout = true -- This option and "timeoutlen" determine the behavior when part of a mapped key sequence has been received.
  vim.opt.ttimeout = true
  vim.opt.timeoutlen = 500 -- time in ms to wait for mapped sequence to complete
  vim.opt.ttimeoutlen = 10 -- time in ms to wait for a key code sequence to complete
  vim.opt.updatetime = 100 -- if in this ms nothing writtin swap is written to disk
  vim.opt.ignorecase = true -- ignore case in search patterns
  vim.opt.smartcase = true -- smart case
  vim.opt.infercase = true -- When doing keyword completion in insert mode |ins-completion|, and "ignorecase" is also on, the case of the match is adjusted depending on the typed text.
  vim.opt.incsearch = true -- While typing a search command, show where the pattern, as it was typed so far, matches.
  vim.opt.wrapscan = true -- Searches wrap around the end of the file.
  vim.opt.splitbelow = true -- When on, splitting a window will put the new window below the current one.
  vim.opt.splitright = true -- When on, splitting a window will put the new window right of the current one.
  vim.opt.inccommand = "split" -- nosplit Shows the effects of a command incrementally in the buffer.
  -- Like "nosplit", but also shows partial off-screen results in a preview window.
  vim.opt.joinspaces = false -- dont add spaces to end of lines
  vim.opt.completeopt = { "menu", "menuone", "noselect" } -- A comma-separated list of options for Insert mode completion |ins-completion|.  The supported values are:

  -- Allow specified keys that move the cursor left/right to move to the previous/next
  -- vim.opt.whichwrap:append("h") -- not recommended
  -- vim.opt.whichwrap:append("l") -- not recommended
  vim.opt.whichwrap:append("<")
  vim.opt.whichwrap:append(">")
  vim.opt.whichwrap:append("[")
  vim.opt.whichwrap:append("]")
  vim.opt.whichwrap:append("~")
  -- vim.opt.shortmess:append "I" -- don't show the default intro message
  vim.opt.shortmess:remove("I") -- don't show the default intro message
  vim.opt.shortmess:remove("c") -- don't show redundant messages from ins-completion-menu
  vim.opt.formatoptions:append("j") -- join comments when it makes sense
  vim.opt.formatoptions:append("c") -- Auto-wrap comments using textwidth, inserting the current comment leader automatically.
  vim.opt.formatoptions:append("r") -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
  vim.opt.formatoptions:append("o") -- Automatically insert the current comment leader after hitting "o" or "O" in Normal mode.
  vim.opt.formatoptions:append("q") -- Allow formatting of comments with "gq".

  -- local exists = function(file)
  --   local ok, err, code = os.rename(file, file)
  --   if not ok then
  --     if code == 13 then
  --       -- Permission denied, but it exists
  --       return true
  --     end
  --   end
  --   return ok, err
  -- end

  --- Check if a directory exists in this path
  -- local isdir = function(path)
  --   -- "/" works on both Unix and Windows
  --   return exists(path .. "/")
  -- end

  local cache_path = vim.fn.stdpath("cache")
  local data_path = {
    path.join(cache_path, "backup"),
    path.join(cache_path, "session"),
    path.join(cache_path, "swap"),
    path.join(cache_path, "tags"),
    path.join(cache_path, "undo"),
  }

  -- if not exists(cache_path) then
  --   os.execute("mkdir -p " .. cache_path)
  -- end
  -- for _, v in pairs(data_path) do
  --   if isdir(v) then
  --     os.execute("mkdir -p " .. v)
  --   end
  -- end
  vim.opt.directory = path.join(cache_path, "swag")
  vim.opt.undodir = path.join(cache_path, "undo")
  vim.opt.backupdir = path.join(cache_path, "backup")
  vim.opt.viewdir = path.join(cache_path, "view")
  -- vim.opt.spellfile = path.join(cache_path, "/spell/en.uft-8.add")
  vim.opt.shadafile = path.join(cache_path, "shada")
  vim.opt.shada = [[!,'300,<50,@100,s10,h]]
  vim.opt.filetype = "plugin"
  vim.opt.fsync = true
  vim.opt.backup = false -- creates a backup file
  vim.opt.writebackup = false
  vim.opt.undofile = true
  vim.opt.swapfile = false -- Use a swapfile for the buffer.
  vim.opt.history = 2000 -- The command-lines that you enter are remembered in a history table.
  vim.opt.autoread = true -- When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
  vim.opt.backupskip = { "/tmp/*", "$TMPDIR/*", "$TMP/*", "$TEMP/*", "*/shm/*", "/private/var/*", ".vault.vim" }

  vim.opt.title = true -- set the title of window to the value of the titlestring
  vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
  vim.opt.background = "dark"
  vim.opt.guifont = "Victor Mono Nerd Font:h12"
  vim.opt.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
  vim.opt.termguicolors = true
  vim.opt.errorbells = false -- Ring the bell (beep or screen flash) for error messages.
  vim.opt.visualbell = false -- Use visual bell instead of beeping.
  -- vim.opt.lazyredraw = true -- Redraw only when needed.
  vim.opt.redrawtime = 1500
  vim.opt.signcolumn = "number" -- "yes:1"
  vim.opt.showtabline = 1 -- always show tabs 2 always, 1 more then 1 tab, 0 never
  vim.opt.winwidth = 30
  vim.opt.winminwidth = 10
  vim.opt.pumheight = 15 -- pop up menu height
  vim.opt.helpheight = 12
  vim.opt.previewheight = 12
  vim.opt.showcmd = true -- Show (partial) command in the last line of the screen.
  vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
  vim.opt.cmdwinheight = 5 -- Number of screen lines to use for the command-line window.
  vim.opt.equalalways = false -- When on, all the windows are automatically made the same size after splitting or closing a window.
  vim.opt.laststatus = 3 -- The value of this option influences when the last window will have a status linealways and ONLY the last window
  vim.opt.display = "lastline"
  vim.opt.cursorline = false --  Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
  vim.opt.cursorlineopt = "number" -- (line,screenline,number, both - line/number ) Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
  -- vim.opt.pumblend = 0
  -- vim.opt.winblend = 0
  vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
  vim.opt.number = true
  -- vim.opt.relativenumber = true,
  vim.opt.showmode = false -- shows modes like -- INSERT --
  vim.opt.scrolloff = 2
  vim.opt.sidescrolloff = 5

  -- vim.opt.syntax = "enable" -- Syntax highlighting enables Vim to show parts of the text in another font or color.
  vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
  -- vim.opt.fileformats = { "unix", "mac", "dos" }
  vim.opt.magic = true -- Some characters in the pattern, such as letters, are taken literally.
  vim.opt.virtualedit = "block" -- Allow virtual editing in Visual block mode.
  vim.opt.viewoptions = { "folds", "cursor", "curdir" }
  vim.opt.sessionoptions = { "curdir", "help", "tabpages", "winsize" } -- Changes the effect of the |:mksession| command.
  vim.opt.wildignorecase = true -- When set case is ignored when completing file names and directories.
  vim.opt.wildignore = { -- A file that matches with one of these patterns is ignored when expanding |wildcards|
    "*.pyc",
    "*.o",
    "*.out",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.gif",
    "*.zip",
    "**/tmp/**",
    "*.DS_Store",
    "**/node_modules/**",
    "**/bower_modules/**",
  }
  vim.opt.complete = { ".", "w", "b", "k" } -- set the matches for Insert mode completion.
  vim.opt.grepformat = "%f:%l:%c:%m" -- Format to recognize for the ":grep" command output.
  vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --" -- Program to use for the |:grep| command.
  vim.opt.startofline = false -- When "on" the commands listed below move the cursor to the first non-blank of the line.
  vim.opt.switchbuf = "useopen" -- This option controls the behavior when switching between buffers.
  vim.opt.backspace = { "indent", "eol", "start" }
  vim.opt.diffopt = { "filler", "iwhite", "internal", "algorithm:patience" } -- Option settings for diff mode.
  vim.opt.completeopt = { "menuone", "noselect" }
  vim.opt.jumpoptions = "stack" -- List of words that change the behavior of the |jumplist|.
  vim.opt.foldlevelstart = 99 -- Sets "foldlevel" when starting to edit another buffer in a window.
  vim.opt.foldmethod = "expr" -- folding set to "expr" for treesitter based folding
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  vim.opt.ruler = true --  Show the line and column number of the cursor position, separated by a comma.
  vim.opt.wrap = false -- When on, lines longer than the width of the window will wrap and displaying continues on the next line.
  vim.opt.synmaxcol = 500 -- Maximum column in which to search for syntax items.
  vim.opt.linebreak = false -- indext the linenumber (I hate this...) -- If on, Vim will wrap long lines at a character in "breakat" rather than at the last character that fits on the screen.
  vim.opt.breakat = [[\ \ ;:,!?]] -- his option lets you choose which characters might cause a line break if "linebreak" is on.
  vim.opt.breakindentopt = { -- Settings for "breakindent".
    shift = 2,
    min = 20,
  }
  vim.opt.foldenable = false -- When off, all folds are open.
  vim.opt.conceallevel = 2 -- set to 0 if `` is visible in markdown files
  vim.opt.concealcursor = "niv" -- Sets the modes in which text in the cursor line can also be concealed. When the current mode is listed then concealing happens just like in other lines.

  vim.opt.list = true
  vim.opt.listchars = {
    -- eol = "↲",
    tab = "⎵/",
    nbsp = "+",
    trail = "·",
    extends = "→",
    precedes = "←",
  }
  vim.opt.fillchars = {
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
  }
end

return M