local global = require("core.global")
local fn = require("core.fn")

local M = {}

M.global = function()
    local global_opt = {
        background = "dark",
        termguicolors = true,
        mouse = "nv",
        errorbells = true,
        visualbell = true,
        hidden = true,
        fileformats = "unix,mac,dos",
        magic = true,
        virtualedit = "block",
        encoding = "utf-8",
        viewoptions = "folds,cursor,curdir,slash,unix",
        sessionoptions = "curdir,help,tabpages,winsize",
        clipboard = "unnamedplus",
        wildignorecase = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,"
            .. "**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        backup = false,
        writebackup = false,
        undofile = true,
        swapfile = false,
        directory = global.path.cache .. "swag/",
        undodir = global.path.cache .. "undo/",
        backupdir = global.path.cache .. "backup/",
        viewdir = global.path.cache .. "view/",
        spellfile = global.path.cache .. "spell/en.uft-8.add",
        history = 2000,
        shada = "!,'300,<50,@100,s10,h",
        backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
        smarttab = true,
        shiftround = true,
        timeout = true,
        ttimeout = true,
        timeoutlen = 500,
        ttimeoutlen = 10,
        updatetime = 100,
        redrawtime = 1500,
        ignorecase = true,
        smartcase = true,
        infercase = true,
        incsearch = true,
        wrapscan = true,
        complete = ".,w,b,k",
        inccommand = "nosplit",
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --hidden --vimgrep --smart-case --",
        breakat = [[\ \	;:,!?]],
        startofline = false,
        whichwrap = "h,l,<,>,[,],~",
        splitbelow = true,
        splitright = true,
        switchbuf = "useopen",
        backspace = "indent,eol,start",
        diffopt = "filler,iwhite,internal,algorithm:patience",
        completeopt = "menuone,noselect",
        jumpoptions = "stack",
        showmode = false,
        shortmess = "aoOTIcF",
        scrolloff = 2,
        sidescrolloff = 5,
        foldlevelstart = 99,
        ruler = true,
        list = true,
        showtabline = 1,
        winwidth = 30,
        winminwidth = 10,
        pumheight = 15,
        helpheight = 12,
        previewheight = 12,
        showcmd = false,
        cmdheight = 2,
        cmdwinheight = 5,
        equalalways = false,
        laststatus = 2,
        display = "lastline",
        foldmethod = "indent",
        cursorline = true,
        listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
        pumblend = 0,
        winblend = 0,
    }
    fn.options_global(global_opt)
end

M.set = function()
    local set_opt = {
        number = true,
        relativenumber = true,
        nocompatible = true,
        wrap = true,
        cmdheight = 1,
        synmaxcol = 2500,
        formatoptions = "1jcroql",
        textwidth = 80,
        expandtab = true,
        autoindent = true,
        signcolumn = "yes",
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = -1,
        breakindentopt = "shift:2,min:20",
        linebreak = true,
        foldenable = true,
        conceallevel = 2,
        concealcursor = "niv",
    }
    fn.options_set(set_opt)
end

return M