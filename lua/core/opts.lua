local fn = require("lib").fn
local M = {}

M.options = {
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
	  autochdir = true, -- auto chdir
		foldlevelstart = 99, -- Sets "foldlevel" when starting to edit another buffer in a window.
		foldmethod = "expr", -- folding set to "expr" for treesitter based folding
		foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
		clipboard = "unnamedplus", -- Connection to the system clipboard
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
		guifont = "Victor Mono Nerd Font:h12",
		guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
		errorbells = false, -- Ring the bell (beep or screen flash) for error messages.
		visualbell = false, -- Use visual bell instead of beeping.
		timeoutlen = 300, -- Length of time to wait for a mapped sequence
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

M.init = function(self)
  fn.options(self.options)
end

return M
