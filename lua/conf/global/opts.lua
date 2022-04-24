local global = require("core.global")

local M = {}

function M.disables()
  local builtins = {
    -- zip
    ["loaded_gzip"] = 1,
    ["loaded_zip"] = 1,
    ["loaded_zipPlugin"] = 1,
    ["loaded_tar"] = 1,
    ["loaded_tarPlugin"] = 1,
    -- getscript
    ["loaded_getscript"] = 1,
    ["loaded_getscriptPlugin"] = 1,
    ["loaded_vimball"] = 1,
    ["loaded_vimballPlugin"] = 1,
    ["loaded_2html_plugin"] = 1,
    -- matchit
    ["loaded_matchit"] = 1,
    ["loaded_matchparen"] = 1,
    ["loaded_logiPat"] = 1,
    ["loaded_rrhelper"] = 1,
    --- netrw
    ["loaded_netrw"] = 1,
    ["loaded_netrwPlugin"] = 1,
    ["loaded_netrwSettings"] = 1,
    ["loaded_netrwFileHandlers"] = 1,
    -- dont use python2
    ["loaded_python_provider"] = 0,
    ["python_host_prog"] = "/bin/python2",
    ["python3_host_prog"] = "/bin/python",
    ["node_host_prog"] = "/bin/neovim-node-host",
  }
	for k, v in pairs(builtins) do
		vim.g[k] = v
	end
end

function M.global()
  local options = {
      ["title"] = true, -- set the title of window to the value of the titlestring
      ["titlestring"] = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
      ["fsync"] = true,
      ["background"] = "dark",
      ["termguicolors"] = true,
      ["mouse"] = "nv",
      ["errorbells"] = true,
      ["visualbell"] = true,
      ["hidden"] = true,
      ["fileformats"] = "unix,mac,dos",
      ["magic"] = true,
      ["virtualedit"] = "block",
      ["encoding"] = "utf-8",
      ["viewoptions"] = "folds,cursor,curdir,slash,unix",
      ["sessionoptions"] = "curdir,help,tabpages,winsize",
      ["clipboard"] = "unnamedplus",
      ["wildignorecase"] = true,
      ["wildignore"] = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,"
          .. "**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
      ["backup"] = false,
      ["writebackup"] = false,
      ["undofile"] = true,
      ["swapfile"] = false,
      ["directory"] = global.fs.join(global.fs.get_cache(), "swag"),
      ["undodir"] = global.fs.join(global.fs.get_cache(), "undo"),
      ["backupdir"] = global.fs.join(global.fs.get_cache(), "backup"),
      ["viewdir"] = global.fs.join(global.fs.get_cache(), "view"),
      ["spellfile"] = global.fs.join(global.fs.get_cache(), "spell", "en.uft-8.add"),
      ["history"] = 2000,
      ["shada"] = "!,'300,<50,@100,s10,h",
      ["backupskip"] = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
      ["smarttab"] = true,
      ["shiftround"] = true,
      ["timeout"] = true,
      ["ttimeout"] = true,
      ["timeoutlen"] = 500,
      ["ttimeoutlen"] = 10,
      ["updatetime"] = 100,
      ["redrawtime"] = 1500,
      ["ignorecase"] = true,
      ["smartcase"] = true,
      ["infercase"] = true,
      ["incsearch"] = true,
      ["wrapscan"] = true,
      ["complete"] = ".,w,b,k",
      -- inccommand = "nosplit",
      ["inccommand"] = "split",
      ["grepformat"] = "%f:%l:%c:%m",
      ["grepprg"] = "rg --hidden --vimgrep --smart-case --",
      ["breakat"] = [[\ \	;:,!?]],
      ["startofline"] = false,
      ["whichwrap"] = "h,l,<,>,[,],~",
      ["splitbelow"] = true,
      ["splitright"] = true,
      ["switchbuf"] = "useopen",
      ["backspace"] = "indent,eol,start",
      ["diffopt"] = "filler,iwhite,internal,algorithm:patience",
      ["completeopt"] = { "menuone", "noselect" },
      ["jumpoptions"] = "stack",
      ["showmode"] = false,
      ["shortmess"] = "aoOTIcF",
      ["scrolloff"] = 2,
      ["sidescrolloff"] = 5,
      ["foldlevelstart"] = 99,
      ["foldmethod"] = "expr", -- folding set to "expr" for treesitter based folding
      ["foldexpr"] = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
      ["ruler"] = true,
      ["list"] = true,
      ["showtabline"] = 1,
      ["winwidth"] = 30,
      ["winminwidth"] = 10,
      ["pumheight"] = 15,
      ["helpheight"] = 12,
      ["previewheight"] = 12,
      ["showcmd"] = false,
      ["cmdheight"] = 1,
      ["cmdwinheight"] = 5,
      ["equalalways"] = false,
      ["laststatus"] = 3,
      ["display"] = "lastline",
      ["joinspaces"] = false, -- dont add spaces to end of lines
      -- foldmethod = "indent",
      ["cursorline"] = true,
      ["listchars"] = {
        ["tab"] = "»·",
        ["nbsp"] = "+",
        ["trail"] = "·",
        ["extends"] = "→",
        ["precedes"] = "←"
      },
      ["fillchars"] = {
        --    item            default         Used for ~
        ["stl"] = " ", -- ' ' or '^' statusline of the current window
        ["stlnc"] = " ", -- ' ' or '=' statusline of the non-current windows
        ["horiz"] = "─", -- '─' or '-' horizontal separators |:split|
        ["horizup"] = "┴", -- '┴' or '-' upwards facing horizontal separator
        ["horizdown"] = "┬", -- '┬' or '-' downwards facing horizontal separator
        ["vert"] = "│", -- '│' or '|' vertical separators |:vsplit|
        ["vertleft"] = "┤", -- '┤' or '|' left facing vertical separator
        ["vertright"] = "├", -- '├' or '|' right facing vertical separator
        ["verthoriz"] = "┼", -- '┼' or '+' overlapping vertical and horizontal separator
        ["fold"] = "-", -- '·' or '-' filling 'foldtext'
        ["foldopen"] = "-", -- '-' mark the beginning of a fold
        ["foldclose"] = "+", -- '+' show a closed fold
        ["foldsep"] = "│", -- '│' or '|' open fold middle marker
        ["diff"] = "-", -- '-' deleted lines of the 'diff' option
        ["msgsep"] = " ", -- ' ' message separator 'display'
        ["eob"] = " ", -- '~' empty lines at the end of a buffer
      },
      -- ["pumblend"] = 0,
      -- ["winblend"] = 0,
  }
	for name, value in pairs(options) do
		vim.opt[name] = value
	end
end

function M.set()
  local options = {
    ["numberwidth"] = 4, -- set number column width to 2 {default 4}
    ["number"] = true,
    -- ["relativenumber"] = true,
    ["nocompatible"] = true,
    ["wrap"] = false,
    -- ["cmdheight"] = 1,
    ["synmaxcol"] = 2500,
    -- ["synmaxcol"] = 200,
    ["formatoptions"] = "1jcroql",
    ["textwidth"] = 80,
    ["expandtab"] = true,
    ["autoindent"] = true,
    ["signcolumn"] = "number",
    -- signcolumn = "yes:1",
    ["tabstop"] = 2,
    ["shiftwidth"] = 2,
    ["softtabstop"] = -1,
    ["breakindentopt"] = "shift:2,min:20",
    ["linebreak"] = false, -- indext the linenumber (I hate this...)
    ["foldenable"] = true,
    ["conceallevel"] = 2,
    ["concealcursor"] = "niv",
  }

	for k, v in pairs(options) do
		if v == true or v == false then
			vim.cmd("set " .. k)
		else
			vim.cmd("set " .. k .. "=" .. v)
		end
	end

  -- Highlight on yank
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })

end

return M
