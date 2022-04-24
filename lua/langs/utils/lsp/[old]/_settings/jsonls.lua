local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  return
end

local full_schemas = vim.tbl_deep_extend(
  "force",
  require("schemastore").json.schemas(),
  require("nlspsettings.jsonls").get_default_schemas()
)

return {
  init_options = {
    provideFormatter = false,
  },
  prefer_null_ls = true,
  cmd = { 'vscode-json-languageserver', '--stdio' },
  settings = {
    json = {
      schemas = full_schemas,
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}
