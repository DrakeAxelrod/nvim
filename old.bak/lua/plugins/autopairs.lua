return function()
  return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
		after = "nvim-treesitter",
    config = function()
      local autopairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")
      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = {
            "string", "source"
          },
          javascript = {
            "string", "template_string",
          },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0, -- Offset from pattern match
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })
      autopairs.add_rule(Rule("$$", "$$", "tex"))
      autopairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex_check("%%"))
          :with_pair(cond.not_before_regex_check("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex_check("xx"))
          :with_cr(cond.none()),
      })
      autopairs.add_rules({
        Rule("$$", "$$", "tex"):with_pair(function(opts)
          print(vim.inspect(opts))
          if opts.line == "aa $$" then
            return false
          end
        end),
      })
      local ts_conds = require("nvim-autopairs.ts-conds")
      autopairs.add_rules({
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
      })
    end
    }
end
