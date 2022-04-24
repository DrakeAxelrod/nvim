local global = require "core.global"

local function disables()
  -- zip
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
end

local function ui()
  vim.opt.title = true -- set the title of window to the value of the titlestring
  vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
  vim.opt.background = "dark"
  vim.opt.termguicolors = true
  vim.opt.errorbells = true
  vim.opt.visualbell = true
  vim.opt.redrawtime = 1500
  vim.opt.signcolumn = "number" -- "yes:1"
  vim.opt.showtabline = 1
  vim.opt.winwidth = 30
  vim.opt.winminwidth = 10
  vim.opt.pumheight = 15
  vim.opt.helpheight = 12
  vim.opt.previewheight = 12
  vim.opt.showcmd = false
  vim.opt.cmdheight = 1
  vim.opt.cmdwinheight = 5
  vim.opt.equalalways = false
  vim.opt.laststatus = 3
  vim.opt.display = "lastline"
  vim.opt.cursorline = true
  -- vim.opt.pumblend = 0
  -- vim.opt.winblend = 0
  vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
  vim.opt.number = true
  -- vim.opt.relativenumber = true,
  vim.opt.showmode = false
  vim.opt.scrolloff = 2
  vim.opt.sidescrolloff = 5
end

local function behavior()
  vim.opt.autochdir = true
  vim.opt.mouse = "nv"
  vim.opt.clipboard = "unnamedplus"
  vim.opt.smarttab = true
  vim.opt.shiftround = true
  vim.opt.textwidth = 80
  vim.opt.expandtab = true
  vim.opt.autoindent = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = -1
  vim.opt.timeout = true
  vim.opt.ttimeout = true
  vim.opt.timeoutlen = 500
  vim.opt.ttimeoutlen = 10
  vim.opt.updatetime = 100
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.infercase = true
  vim.opt.incsearch = true
  vim.opt.wrapscan = true
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.inccommand = "split" -- "nosplit"
  vim.opt.joinspaces = false -- dont add spaces to end of lines
  vim.opt.completeopt = { "menuone", "noselect" }
  -- vim.opt.whichwrap:append("h")
  -- vim.opt.whichwrap:append("l")
  -- vim.opt.whichwrap:append("<")
  -- vim.opt.whichwrap:append(">")
  -- vim.opt.whichwrap:append("[")
  -- vim.opt.whichwrap:append("]")
  -- vim.opt.whichwrap:append("~")
  vim.opt.shortmess:append "a"
  vim.opt.shortmess:append "o"
  vim.opt.shortmess:append "T"
  -- vim.opt.shortmess:append("I")
  vim.opt.shortmess:append "c"
  vim.opt.shortmess:append "F"
  vim.opt.formatoptions:append "1"
  vim.opt.formatoptions:append "j"
  vim.opt.formatoptions:append "c"
  vim.opt.formatoptions:append "r"
  vim.opt.formatoptions:append "o"
  vim.opt.formatoptions:append "q"
  vim.opt.formatoptions:append "l"
end

local function files()
  vim.opt.fsync = true
  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.undofile = true
  vim.opt.swapfile = false
  vim.opt.directory = global.fs.join(global.fs.get_cache(), "swag")
  vim.opt.undodir = global.fs.join(global.fs.get_cache(), "undo")
  vim.opt.backupdir = global.fs.join(global.fs.get_cache(), "backup")
  vim.opt.viewdir = global.fs.join(global.fs.get_cache(), "view")
  vim.opt.spellfile = global.fs.join(global.fs.get_cache(), "spell", "en.uft-8.add")
  vim.opt.shadafile = global.fs.join(global.fs.get_cache(), "shada")
  vim.opt.history = 2000
  vim.opt.shada = [[!,'300,<50,@100,s10,h]]
  vim.opt.backupskip = { "/tmp/*", "$TMPDIR/*", "$TMP/*", "$TEMP/*", "*/shm/*", "/private/var/*", ".vault.vim" }
end

local function misc()
  vim.opt.hidden = true
  vim.opt.fileformats = { "unix", "mac", "dos" }
  vim.opt.magic = true
  vim.opt.virtualedit = "block"
  vim.opt.encoding = "utf-8"
  vim.opt.viewoptions = { "folds", "cursor", "curdir", "slash", "unix" }
  vim.opt.sessionoptions = { "curdir", "help", "tabpages", "winsize" }
  vim.opt.wildignorecase = true
  vim.opt.wildignore = {
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
  vim.opt.complete = { ".", "w", "b", "k" }
  vim.opt.grepformat = "%f:%l:%c:%m"
  vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"
  vim.opt.breakat = [[\ \ ;:,!?]]
  vim.opt.startofline = false
  vim.opt.switchbuf = "useopen"
  vim.opt.backspace = { "indent", "eol", "start" }
  vim.opt.diffopt = { "filler", "iwhite", "internal", "algorithm:patience" }
  vim.opt.completeopt = { "menuone", "noselect" }
  vim.opt.jumpoptions = "stack"
  vim.opt.foldlevelstart = 99
  vim.opt.foldmethod = "expr" -- folding set to "expr" for treesitter based folding
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  vim.opt.ruler = true
  vim.opt.wrap = false
  vim.opt.synmaxcol = 200
  vim.opt.breakindentopt = {
    shift = 2,
    min = 20,
  }
  vim.opt.linebreak = false -- indext the linenumber (I hate this...)
  vim.opt.foldenable = true
  vim.opt.conceallevel = 2
  vim.opt.concealcursor = "niv"
end

local function listopts()
  vim.opt.list = true
  vim.opt.listchars = {
    tab = "»·",
    nbsp = "+",
    trail = "·",
    extends = "→",
    precedes = "←",
  }
  vim.opt.fillchars = {
    --    item            default         Used for ~
    stl = " ", -- ' ' or '^' statusline of the current window
    stlnc = " ", -- ' ' or '=' statusline of the non-current windows
    horiz = "─", -- '─' or '-' horizontal separators |:split|
    horizup = "┴", -- '┴' or '-' upwards facing horizontal separator
    horizdown = "┬", -- '┬' or '-' downwards facing horizontal separator
    vert = "│", -- '│' or '|' vertical separators |:vsplit|
    vertleft = "┤", -- '┤' or '|' left facing vertical separator
    vertright = "├", -- '├' or '|' right facing vertical separator
    verthoriz = "┼", -- '┼' or '+' overlapping vertical and horizontal separator
    fold = "-", -- '·' or '-' filling 'foldtext'
    foldopen = "-", -- '-' mark the beginning of a fold
    foldclose = "+", -- '+' show a closed fold
    foldsep = "│", -- '│' or '|' open fold middle marker
    diff = "-", -- '-' deleted lines of the 'diff' option
    msgsep = " ", -- ' ' message separator 'display'
    eob = " ", -- '~' empty lines at the end of a buffer
  }
end

local function highlight_on_yank()
  local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
  })
end

return function()
  disables()
  ui()
  files()
  behavior()
  misc()
  listopts()
  highlight_on_yank()
end
