local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

local builtins = null_ls.builtins

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    builtins.formatting.prettier,
    builtins.formatting.yapf,
    builtins.formatting.stylua,
    builtins.formatting.trim_whitespace,
    builtins.formatting.clang_format,
    builtins.formatting.cmake_format,
    builtins.formatting.gofmt,
    builtins.formatting.goimports,
    builtins.code_actions.gitsigns,
    builtins.diagnostics.gitlint,
    -- builtins.diagnostics.checkmake,
    builtins.diagnostics.cppcheck,
    builtins.diagnostics.eslint,
    builtins.diagnostics.golangci_lint,
    builtins.diagnostics.jsonlint,
    builtins.diagnostics.luacheck,
  },
}
