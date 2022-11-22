local M = {}

local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

M.with_root_file = function(...)
	local files = { ... }
	return function(utils)
		return utils.root_has_file(files)
	end
end

-- code action sources
M.code_actions = null_ls.builtins.code_actions
-- diagnostic sources
M.diagnostics = null_ls.builtins.diagnostics
-- formatting sources
M.formatting = null_ls.builtins.formatting
-- hover sources
M.hover = null_ls.builtins.hover
-- completion sources
M.completion = null_ls.builtins.completion

M.setup = function()
  null_ls.setup({
    sources = {
      M.diagnostics.eslint_d.with({
        condition = M.with_root_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" }),
      }),
      M.diagnostics.markdownlint,
      M.formatting.black.with { extra_args = { "--fast" } },
      M.formatting.prettierd,
      M.formatting.stylua,
      M.formatting.gofmt,
      M.formatting.shfmt.with({
        filetypes = { "sh", "bash", "zsh" },
      }),
      M.code_actions.eslint_d.with({
        condition = M.with_root_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" }),
      }),
    },
  })
end

return M
