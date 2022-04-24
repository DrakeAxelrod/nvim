return {
  on_attach = function()
    require('clangd_extensions.inlay_hints').setup_autocmd()
    require('clangd_extensions.inlay_hints').set_inlay_hints()
    require('clangd_extensions').hint_aucmd_set_up = true
  end,
  prefer_null_ls = true,
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=bundled',
    '--header-insertion=iwyu',
    '--cross-file-rename',
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
}
