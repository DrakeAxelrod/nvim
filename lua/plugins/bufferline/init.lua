return function()
  local icons = require("theme.icons")
  local colors = require("theme.colors")

  local is_ft = function (b, ft)
    return vim.bo[b].filetype == ft
  end
  
  local diagnostics_indicator = function(num, _, diagnostics, _)
    local result = {}
    local symbols = {
      error = icons.diagnostics.Error,
      warning = icons.diagnostics.Warning,
      info = icons.diagnostics.Information,
    }

    for name, count in pairs(diagnostics) do
      if symbols[name] and count > 0 then
        table.insert(result, symbols[name] .. " " .. count)
      end
    end
    result = table.concat(result, " ")
    return #result > 0 and result or ""
  end
  
  local filter = function(buf, buf_nums)
    local logs = vim.tbl_filter(function(b)
      return is_ft(b, "log")
    end, buf_nums or {})
    if vim.tbl_isempty(logs) then
      return true
    end
    local tab_num = vim.fn.tabpagenr()
    local last_tab = vim.fn.tabpagenr "$"
    local is_log = is_ft(buf, "log")
    if last_tab == 1 then
      return true
    end
    -- only show log buffers in secondary tabs
    return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
  end

  require('bufferline').setup({
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = function(bufnr) -- can be a string | function, see "Mouse actions"
        buf_kill("bd", bufnr, false)
      end, -- can be a string | function, see "Mouse actions"
      right_mouse_command =  "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      indicator = {
        icon = icons.ui.BoldLineLeft, -- this should be omitted if indicator style is not 'icon'
        style = "icon", -- 'icon' | 'underline' | 'none',
      },
      buffer_close_icon = icons.ui.Close,
      modified_icon = icons.ui.SmallCircle,
      close_icon = icons.ui.BoldClose,
      left_trunc_marker = icons.ui.ArrowCircleLeft,
      right_trunc_marker = icons.ui.ArrowCircleRight,
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match "%.md" then
          return vim.fn.fnamemodify(buf.name, ":t:r")
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
      diagnostics_update_in_insert = false,
      -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
      diagnostics_indicator = diagnostics_indicator,
      -- NOTE: this will be called a lot so don't do any heavy processing here
      custom_filter = filter,
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        },
        {
          filetype = "packer",
          text = "Packer",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
      color_icons = true, -- true | false, -- whether or not to add the filetype icon highlights
      show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
      show_buffer_close_icons = false, -- true | false,
      show_buffer_default_icon = true, -- true | false, -- whether or not an unrecognised filetype should show a default icon
      show_close_icon = false, -- true | false,
      show_tab_indicators = false, -- true | false,
      show_duplicate_prefix = true, -- true | false, -- whether to show duplicate buffer prefix
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "slant", -- "slant" | "thick" | "thin" | "padded_slant" | { 'any', 'any' },
      enforce_regular_tabs = false, -- false | true,
      always_show_bufferline = true, -- true | false,
      hover = {
        enabled = false,
        delay = 200,
        reveal = { 'close' }
      },
      sort_by = "id",
      -- 'insert_after_current' |
      -- 'insert_at_end' |
      -- 'id' |
      -- 'extension' |
      -- 'relative_directory' |
      -- 'directory' |
      -- 'tabs' |
      -- function(buffer_a, buffer_b)
      -- add custom logic
      -- return buffer_a.modified > buffer_b.modified
      -- end
    },
    highlights = {
      fill = {
          fg = colors.bg_statusline,
          bg = colors.bg_statusline,
      },
      background = {
        fg = colors.fg,
        bg = colors.bg,
      },
      -- tab = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- tab_selected = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- tab_close = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- close_button = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- close_button_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- close_button_selected = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      buffer_visible = {
          fg = colors.white,
          bg = colors.bg
      },
      buffer_selected = {
          fg = colors.blue,
          bg = colors.bg,
          bold = true,
          italic = true,
      },
      -- numbers = {
      --     fg = "Red",
      --     bg = "Red",
      -- },
      -- numbers_visible = {
      --     fg = "Red",
      --     bg = "Red",
      -- },
      -- numbers_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- diagnostic = {
      --     fg = "Red",
      --     bg = "Red",
      -- },
      -- diagnostic_visible = {
      --     fg = "Red",
      --     bg = "Red",
      -- },
      -- diagnostic_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- hint = {
      --     fg = "Red",
      --     sp = "Red",
      --     bg = "Red"
      -- },
      -- hint_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- hint_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- hint_diagnostic = {
      --     fg = "Red",
      --     sp = "Red",
      --     bg = "Red"
      -- },
      -- hint_diagnostic_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- hint_diagnostic_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- info = {
      --     fg = "Red",
      --     sp = "Red",
      --     bg = "Red"
      -- },
      -- info_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- info_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- info_diagnostic = {
      --     fg = "Red",
      --     sp = "Red",
      --     bg = "Red"
      -- },
      -- info_diagnostic_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- info_diagnostic_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- warning = {
      --     fg = "Red",
      --     sp = "Red",
      --     bg = "Red"
      -- },
      -- warning_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- warning_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- warning_diagnostic = {
      --     fg = "Red",
      --     sp = "Red",
      --     bg = "Red"
      -- },
      -- warning_diagnostic_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- warning_diagnostic_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- error = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red"
      -- },
      -- error_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- error_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- error_diagnostic = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red"
      -- },
      -- error_diagnostic_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- error_diagnostic_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     sp = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- modified = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- modified_visible = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- modified_selected = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- duplicate_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     italic = true,
      -- },
      -- duplicate_visible = {
      --     fg = "Red",
      --     bg = "Red",
      --     italic = true
      -- },
      -- duplicate = {
      --     fg = "Red",
      --     bg = "Red",
      --     italic = true
      -- },
      separator_selected = {
        fg = colors.bg_statusline,
        -- bg = colors.bg,
      },
      separator_visible = {
        fg = colors.bg_statusline,
        -- bg = colors.bg_statusline,
      },
      separator = {
          fg = colors.bg_statusline,
          bg = colors.bg,
      },
      -- indicator_selected = {
      --     fg = "Red",
      --     bg = "Red"
      -- },
      -- pick_selected = {
      --     fg = "Red",
      --     bg = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- pick_visible = {
      --     fg = "Red",
      --     bg = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- pick = {
      --     fg = "Red",
      --     bg = "Red",
      --     bold = true,
      --     italic = true,
      -- },
      -- offset_separator = {
      --     fg = "Red",
      --     bg = "Red",
      -- },
    }
  })
end
