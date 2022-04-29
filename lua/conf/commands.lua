

-- vim.api.nvim_add_user_command("command! MiniStarter :lua require('mini.starter').open()")


-- [[BufWinEnter * checktime]], -- check time on buf enter
-- [[FileType qf,help,man nnoremap <silent> <buffer> q :close<CR>]],
-- [[TextYankPost * lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})]],
-- [[BufWinEnter alpha setlocal cursorline signcolumn=yes cursorcolumn number]],
-- -- [[TextYankPost * silent! lua vim.highlight.on_yank()]], -- highlight on yank
-- [[FileType qf set nobuflisted]],
-- -- [[ColorScheme * lua require'lightspeed'.init_highlight(true)]],
-- -- [[TermOpen * lua vim.b.miniindentscope_disable = true]],
-- -- [[Filetype neo-tree* lua vim.b.miniindentscope_disable = true]],
-- -- [[Filetype neo-tree-popup lua vim.b.miniindentscope_disable = true]],
-- [[TermOpen * setlocal listchars= nonumber norelativenumber]], -- trigger set_terminal_keymaps on open
-- [[TermOpen * startinsert]], -- start in insert mode
-- -- [[BufEnter,BufWinEnter,WinEnter term://* startinsert]],

-- autocmd("misc_aucmds", {
--   -- [[BufWinEnter * checktime]], -- check time on buf enter
--   [[FileType qf,help,man nnoremap <silent> <buffer> q :close<CR>]],
--   [[TextYankPost * lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})]],
--   [[BufWinEnter alpha setlocal cursorline signcolumn=yes cursorcolumn number]],
--   [[FileType qf set nobuflisted]],
--   [[TermOpen * setlocal statusline= listchars= nonumber norelativenumber]], -- trigger set_terminal_keymaps on open
--   [[TermOpen * startinsert]], -- start in insert mode
--   [[TermOpen term://* lua set_terminal_keymaps()]],
--   [[TermClose * call feedkeys("\<cr>")]],
-- }, true)
