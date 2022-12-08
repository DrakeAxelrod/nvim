return function()
  local copilot_cmp = require("copilot_cmp")
  local formats = require("copilot_cmp.format")
  copilot_cmp.setup {
    method = "getCompletionsCycling",
    formatters = {
      label = formats.format_label_text,
      insert_text = formats.format_insert_text,
      -- insert_text = formats.remove_existing,
      preview = formats.deindent,
    },
  }
end
