local M = {}

local function config(file)
  return require(("modules.lang.%s"):format(file))
end

M.nvim_lsp_installer = config("lsp_installer")
M.treesitter = config("treesitter")
M.fidget = config("fidget")
M.indent_blankline = config("indent-blankline")
M.copilot = config("copilot")
M.autopairs = config("autopairs")
M.aerial = config("aerial")
M.autotags = config("autotags")
M.lsp_signature = config("lsp_signature")
M.comment = config("comment")

return M
