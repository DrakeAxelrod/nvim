vim.cmd([[
" resize.vim    resizing the screen
" Author:       Breuckelen (Benjamin Attal)
" Version:      1.0

" Globals
let g:resize_count = 2

"Is<direction>Most Boolean Functions
function! IsRightMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>l"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsBottomMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>j"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsTopMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>k"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsLeftMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>h"
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

"Resize<direction> functions and helpers
function! CacheResizeCount(n)
    if a:n
        return a:n
    else
        return g:resize_count
    endif
    echo ""
endfunction

function! s:ResizeUp(n)
    let g:resize_count = CacheResizeCount(a:n)
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal! " . g:resize_count . "\<c-w>-"
        else
            silent! exec "normal! " . g:resize_count . "\<c-w>+"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w>-"
    endif
    echo ""
endfunction

function! s:ResizeDown(n)
    let g:resize_count = CacheResizeCount(a:n)
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal! " . g:resize_count . "\<c-w>+"
        else
            silent! exec "normal! " . g:resize_count . "\<c-w>-"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w>+"
    endif
    echo ""
endfunction

function! s:ResizeLeft(n)
    let g:resize_count = CacheResizeCount(a:n)
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal! " . g:resize_count . "\<c-w>>"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w><"
    endif
    echo ""
endfunction

function! s:ResizeRight(n)
    let g:resize_count = CacheResizeCount(a:n)
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal! " . g:resize_count . "\<c-w><"
        endif
    else
        silent! exec "normal! " . g:resize_count . "\<c-w>>"
    endif
    echo ""
endfunction

command! CmdResizeLeft call <SID>ResizeLeft(v:count)
command! CmdResizeDown call <SID>ResizeDown(v:count)
command! CmdResizeUp call <SID>ResizeUp(v:count)
command! CmdResizeRight call <SID>ResizeRight(v:count)

"if get(g:, 'vim_resize_disable_auto_mappings') == 0
"    nnoremap <silent> <s-h> :CmdResizeLeft<cr>
"    nnoremap <silent> <s-j> :CmdResizeDown<cr>
"    nnoremap <silent> <s-k> :CmdResizeUp<cr>
"    nnoremap <silent> <s-l> :CmdResizeRight<cr>
"endif
]])
