-- icons = {
--   -- Heirline-components - tabline
--   TabClose = "󰅙",
--   BufferClose = "󰅖",
--   ArrowLeft = "",
--   ArrowRight = "",
--   FileModified = "",
--   FileReadOnly = "",

--   -- Heirline-components - winbar
--   CompilerPlay = "",
--   CompilerStop = "",
--   CompilerRedo = "",
--   NeoTree = "",
--   Aerial = "",
--   ZenMode = "󰰶",
--   BufWrite = "",
--   BufWriteAll = "",
--   Ellipsis = "…",
--   BreadcrumbSeparator = "",

--   -- Heirline-components - statuscolumn
--   FoldClosed = "",
--   FoldOpened = "",
--   FoldSeparator = " ",

--   -- Heirline-components - statusline components
--   ActiveLSP = "",
--   ActiveTS = "",
--   Environment = "",
--   DiagnosticError = "",
--   DiagnosticHint = "󰌵",
--   DiagnosticInfo = "󰋼",
--   DiagnosticWarn = "",
--   LSPLoading1 = "",
--   LSPLoading2 = "󰀚",
--   LSPLoading3 = "",
--   SearchCount = "",
--   MacroRecording = "",
--   ToggleResults = "󰑮",

--   -- Heirline-components - misc
--   Paste = "󰅌",
--   PathSeparator = "",

--   -- Git
--   GitBranch = "",
--   GitAdd = "",
--   GitChange = "",
--   GitDelete = "",
-- }

local ViMode = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
      self.mode = vim.fn.mode(1) -- :h mode()
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
      mode_names = { -- change the strings if you like it vvvvverbose!
          n = "N",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "I",
          ic = "Ic",
          ix = "Ix",
          R = "R",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
      },
      mode_colors = {
          n = "red" ,
          i = "green",
          v = "cyan",
          V =  "cyan",
          ["\22"] =  "cyan",
          c =  "orange",
          s =  "purple",
          S =  "purple",
          ["\19"] =  "purple",
          R =  "orange",
          r =  "orange",
          ["!"] =  "red",
          t =  "red",
      }
  },
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self)
      return " %2("..self.mode_names[self.mode].."%)"
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
      local mode = self.mode:sub(1, 1) -- get only the first mode character
      return { fg = self.mode_colors[mode], bold = true, }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- Also allows the statusline to be re-evaluated when entering operator-pending mode
  update = {
      "ModeChanged",
      pattern = "*:*",
      callback = vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
      end),
  },
}



return {
  "rebelot/heirline.nvim",
  dependencies = { "zeioth/heirline-components.nvim" },
  opts = function()
    local lib = require "heirline-components.all"
    return {
      opts = {
        disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
          local is_disabled = not require("heirline-components.buffer").is_valid(args.buf) or
              lib.condition.buffer_matches({
                buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
              }, args.buf)
          return is_disabled
        end,
      },
      tabline = { -- UI upper bar
        lib.component.tabline_conditional_padding(),
        lib.component.tabline_buffers(),
        lib.component.fill { hl = { bg = "tabline_bg" } },
        lib.component.tabline_tabpages()
      },
      winbar = { -- UI breadcrumbs bar
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false,
        -- Winbar for terminal, neotree, and aerial.
        {
          condition = function() return not lib.condition.is_active() end,
          {
            lib.component.neotree(),
            lib.component.compiler_play(),
            lib.component.fill(),
            lib.component.compiler_build_type(),
            lib.component.compiler_redo(),
            lib.component.aerial(),
          },
        },
        -- Regular winbar
        {
          lib.component.neotree(),
          lib.component.compiler_play(),
          lib.component.fill(),
          lib.component.breadcrumbs(),
          lib.component.fill(),
          lib.component.compiler_redo(),
          lib.component.aerial(),
        }
      },
      statuscolumn = { -- UI left column
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        lib.component.foldcolumn(),
        lib.component.numbercolumn(),
        lib.component.signcolumn(),
      } or nil,
      statusline = { -- UI statusbar
        hl = { fg = "fg", bg = "bg" },
        lib.component.mode({
          mode_text = {
            -- pad_text = "center",
            hl = { fg = "#282c34" },
          },
          hl = { fg = "fg" },
          paste =  { str = "", icon = { kind = "Paste" }, show_empty = true },    -- if set, displays if paste is enabled.
          spell = { str = "", icon = { kind = "Spellcheck" }, show_empty = true },  -- if set, displays if spellcheck is on
          surround = {
            separator = "left",                              -- where to add the separator.
            -- color = hl.mode_bg,                              -- you can set a custom background color, for example "#444444".
            update = {  "ModeChanged", pattern = "*:*" }     -- events that make the surround provider refresh.
          },
          -- hl = hl.get_attributes "mode",                     -- you can specify your own highlight group here.
          update = {
            "ModeChanged",                                   -- events that make this component refresh.
            pattern = "*:*",
            callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
          },
        }),
        -- ViMode,
        lib.component.git_branch(),
        lib.component.file_info({ filetype = false, filename = {}, file_modified = false }),
        lib.component.git_diff(),
        lib.component.diagnostics({
          ERROR = {icon = { kind = "DiagnosticError", padding = { left = 1, right = 1 } },}, -- if set, it will display icon+number of errors.
          WARN = {icon = { kind = "DiagnosticWarn", padding = { left = 1, right = 1 } },}, -- if set, it will display icon+number of warnings.
          INFO = {icon = { kind = "DiagnosticInfo", padding = { left = 1, right = 1 } },}, -- if set, it will display icon+number of info.
          HINT = {icon = { kind = "DiagnosticHint", padding = { left = 1, right = 1 } },}, -- if set, it will display icon+number of hints.
          surround = {
            separator = "left",                                                        -- where to add the separator.
            color = "diagnostics_bg",                                                  -- you can set a custom background color, for example "#444444".
            condition = require("heirline-components.all").condition.has_diagnostics   -- a function that determines when to display the component.
          },
          -- hl = hl.get_attributes "diagnostics",                                        -- you can specify your own highlight group here.
          -- on_click = { name = "<your_event_name", callback = function() end }          -- what happens when you click the component.
          update = { "DiagnosticChanged", "BufEnter" },                                -- events that make the component refresh.
        }),
        lib.component.fill(),
        lib.component.cmd_info(),
        lib.component.fill(),
        lib.component.lsp({
          lsp_client_names = {
            str = "LSP",
            update = {
              "LspAttach",
              "LspDetach",
              "BufEnter",
              "VimResized",
              callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end),
            },
            icon = {
              kind = "ActiveLSP",
              -- kind = "",
              padding = { right = 2 }
            },
          }
        }),
        lib.component.compiler_state(),
        lib.component.virtual_env(),
        lib.component.nav(),
        -- lib.component.mode { surround = { separator = "right" } },
      },
    }
  end,
  config = function(_, opts)
    local heirline = require("heirline")
    local heirline_components = require "heirline-components.all"

    -- Setup
    heirline_components.init.subscribe_to_events()
    heirline.load_colors(heirline_components.hl.get_colors())
    heirline.setup(opts)
  end,
}