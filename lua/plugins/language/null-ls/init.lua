return function()
  local null_ls = require("null-ls")
  local sources = {
    -- null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.code_actions.refactoring,
    -- null_ls.builtins.code_actions.shellcheck,
    -- null_ls.builtins.completion.luasnip,
    -- -- diagnostics
    -- null_ls.builtins.diagnostics.clang_check,
    -- null_ls.builtins.diagnostics.cmake_lint,
    -- null_ls.builtins.diagnostics.commitlint,
    -- null_ls.builtins.diagnostics.cppcheck,
    -- null_ls.builtins.diagnostics.editorconfig_checker,
    -- -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.diagnostics.golangci_lint,
    -- null_ls.builtins.diagnostics.luacheck,
    -- null_ls.builtins.diagnostics.zsh,
    -- -- formatting
    -- null_ls.builtins.formatting.gofmt,
    -- null_ls.builtins.formatting.clang_format,
    -- null_ls.builtins.formatting.goimports,
    -- -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.rustfmt,
    -- null_ls.builtins.formatting.stylua,
  }
  null_ls.setup({
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    -- diagnostic_config = nil,
    diagnostics_format = "#{m}",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log_level = "warn",
    notify_format = "[null-ls] %s",
    -- on_attach = nil,
    -- on_init = nil,
    -- on_exit = nil,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
    sources = sources,
    -- temp_dir = nil,
    -- border = nil,
    update_in_insert = false,
  })
end
