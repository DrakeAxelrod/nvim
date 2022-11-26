return {
  {
    "rafamadriz/neon",
    function()
      vim.g.neon_style = "default" -- There's three options to choose from, default, doom, dark and light
      vim.g.neon_italic_comment = true -- Italic text for comments
      vim.g.neon_italic_keyword = false -- Applies to conditionals and keywords like for, do, while, loops etc.
      vim.g.neon_italic_boolean = false -- true and false
      vim.g.neon_italic_function = false -- Applies to function (calls and definitions), method (calls and definitions) and built-in functions.
      vim.g.neon_italic_variable = false -- Applies to variable names that are defined by the languages, like this or self. And any variable name that does not have another highlight group.
      vim.g.neon_bold = false -- Applies to error and warning messages, functions (calls and definitions), lsp virtual text, etc.
      vim.g.neon_transparent = false -- Applies no background color to certain highlight groups.
      vim.cmd[[colorscheme neon]]
    end
  }
}
