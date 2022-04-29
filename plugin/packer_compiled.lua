-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\nß\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2Ä'\6\r\0X\a\1Ä'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireh\1\0\6\0\a\0\0146\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\6Ä9\2\3\0015\4\5\0003\5\4\0=\5\6\4B\2\2\1K\0\1\0K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\npcall\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "friendly-snippets" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    after = { "nvim-lsp-installer" },
    config = { "\27LJ\2\n¶\2\0\0\6\0\t\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\4B\2\2\1K\0\1\0\vguides\1\0\4\15nested_top\t‚îÇ \14last_item\v‚îî‚îÄ\rmid_item\v‚îú‚îÄ\15whitespace\a  \rbackends\1\3\0\0\15treesitter\rmarkdown\1\0\5\16show_guides\2\18update_events\28TextChanged,InsertLeave\14min_width\3\30\16filter_kind\1\14nerd_font\tauto\nsetup\vaerial\frequire\npcall\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lsp-installer" },
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/copilot-cmp/after/plugin/copilot_cmp.lua" },
    load_after = {
      ["copilot.lua"] = true,
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["doom-one.nvim"] = {
    config = { "\27LJ\2\nü\3\0\0\6\0\t\0\0166\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä+\2\1\0L\2\2\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\4B\2\2\1K\0\1\0\25plugins_integrations\1\0\14\14dashboard\1\nneorg\1\flspsaga\1\14nvim_tree\2\21indent_blankline\1\vbarbar\1\15bufferline\1\14gitgutter\1\vneogit\1\rwhichkey\2\19vim_illuminate\1\rstartify\1\rgitsigns\2\14telescope\2\rpumblend\1\0\2\venable\1\24transparency_amount\3\0\1\0\5\20italic_comments\2\22enable_treesitter\2\27transparent_background\1\20cursor_coloring\2\20terminal_colors\2\nsetup\rdoom-one\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0Ÿ\6\1\0\6\0$\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0033\4\b\0=\4\t\3=\3\v\0025\3\f\0005\4\r\0=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\0035\4\23\0005\5\24\0=\5\25\4=\4\26\0035\4\27\0005\5\28\0=\5\5\0045\5\29\0=\5\a\0045\5\30\0=\5\31\0043\5 \0=\5\t\4=\4!\0034\4\0\0=\4\"\3=\3#\2B\0\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\15min_height\1\3\0\0\3\n\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3(\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3å\1\4ö≥ÊÃ\tô≥¶ˇ\3\1\0\6\vborder\frounded\15max_height\4Õô≥Ê\fÃô≥ˇ\3\rrelative\veditor\17winhighlight\5\vanchor\aNW\rwinblend\3\n\bnui\vborder\1\0\1\nstyle\frounded\1\0\4\14max_width\3P\15max_height\3(\rposition\b50%\rrelative\veditor\ffzf_lua\fwinopts\1\0\0\1\0\2\nwidth\4\0ÄÄÄˇ\3\vheight\4ö≥ÊÃ\tô≥Ê˛\3\bfzf\vwindow\1\0\0\1\0\2\nwidth\4\0ÄÄÄˇ\3\vheight\4ö≥ÊÃ\tô≥Ê˛\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\1\fenabled\2\ninput\1\0\0\roverride\0\14min_width\1\3\0\0\3\20\4ö≥ÊÃ\tô≥¶˛\3\14max_width\1\3\0\0\3å\1\4Õô≥Ê\fÃô≥ˇ\3\1\0\n\rwinblend\3\n\17winhighlight\5\fenabled\2\vborder\frounded\17prefer_width\3(\19default_prompt\vInput:\17prompt_align\tleft\16insert_only\2\rrelative\vcursor\vanchor\aSW\nsetup\rdressing\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  fd = {
    after = { "telescope.nvim" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/fd",
    url = "https://github.com/sharkdp/fd"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n3\0\2\a\0\3\0\0066\2\0\0009\2\1\2'\4\2\0\18\5\1\0\18\6\0\0D\2\4\0\n%s %s\vformat\vstringh\0\3\v\0\5\0\0166\3\0\0009\3\1\3'\5\2\0\18\6\1\0\15\0\2\0X\a\aÄ6\a\0\0009\a\1\a'\t\3\0\18\n\2\0B\a\3\2\14\0\a\0X\b\1Ä'\a\4\0\18\b\0\0D\3\5\0\5\f (%s%%)\14%s%s [%s]\vformat\vstringﬁ\3\1\0\b\0\28\0&6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\30Ä6\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\t\0005\6\5\0009\a\6\0029\a\a\a=\a\b\6=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\0055\6\15\0=\6\16\0055\6\17\0003\a\18\0=\a\2\0063\a\19\0=\a\20\6=\6\21\0055\6\23\0005\a\22\0=\a\24\6=\6\25\0055\6\26\0=\6\27\5B\3\2\1K\0\1\0K\0\1\0\ndebug\1\0\2\flogging\1\vstrict\1\fsources\6*\1\0\0\1\0\1\vignore\1\bfmt\ttask\0\0\1\0\3\14max_width\3\0\fleftpad\2\18stack_upwards\2\vwindow\1\0\2\nblend\3\0\rrelative\bwin\ntimer\1\0\3\17fidget_decay\3–\15\15task_decay\3Ë\a\17spinner_rate\3}\nalign\1\0\2\vbottom\2\nright\2\ttext\1\0\0\tdone\aok\aui\1\0\3\14completed\14Completed\fspinner\tpipe\14commenced\fStarted\nsetup\14lib.icons\vfidget\frequire\npcall\0" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\nP\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\rfiletype\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzy-lua-native"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/fzy-lua-native",
    url = "https://github.com/romgrk/fzy-lua-native"
  },
  ["gitsigns.nvim"] = {
    load_after = {
      ["nvim-treesitter"] = true,
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopLine", "HopChar1" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["legendary.nvim"] = {
    config = { "\27LJ\2\nΩ\2\0\0\5\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\0034\4\0\0=\4\t\0034\4\0\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\15scratchpad\1\0\1\20display_results\nfloat\14which_key\15do_binding\topts\rmappings\1\0\0\rautocmds\rcommands\fkeymaps\1\0\4\28auto_register_which_key\2\20include_builtin\2\27include_legendary_cmds\2\28most_recent_item_at_top\2\nsetup\14legendary\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["lua-dev.nvim"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lush.nvim"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22modules.misc.mini\frequire\0" },
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\né\4\0\0\v\0\23\0\0306\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\0045\5\v\0=\5\f\0045\5\r\0005\6\14\0=\6\15\0056\6\16\0009\6\17\6'\b\18\0'\t\19\0'\n\20\0B\6\4\2=\6\21\5=\5\22\4B\2\2\1K\0\1\0\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\bmap\n<M-e>\14highlight\rPmenuSel\voffset\3\0\fend_key\6$\tkeys\31qwertyuiopzxcvbnmasdfghjkl\16check_comma\2\19highlight_grey\vLineNr\21disable_filetype\1\3\0\0\20TelescopePrompt\18spectre_panel\14ts_config\15javascript\1\3\0\0\vstring\20template_string\blua\1\0\1\tjava\1\1\3\0\0\vstring\vsource\1\0\2\rcheck_ts\2\30enable_check_bracket_line\1\nsetup\19nvim-autopairs\frequire\npcall\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "copilot-cmp", "cmp-path", "cmp-nvim-lsp-signature-help", "cmp-buffer", "cmp_luasnip" },
    config = { "\27LJ\2\nÜ\1\0\2\b\0\4\0\0249\2\0\0009\2\1\2\18\4\2\0009\2\2\2'\5\3\0B\2\3\0039\4\0\0019\4\1\4\18\6\4\0009\4\2\4'\a\3\0B\4\3\3\14\0\3\0X\6\1Ä)\3\0\0\14\0\5\0X\6\1Ä)\5\0\0\0\3\5\0X\6\2Ä+\6\1\0X\a\1Ä+\6\2\0L\6\2\0\b^_+\tfind\nlabel\20completion_itemó\1\0\0\6\0\b\2\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0F\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim=\0\2\a\1\3\0\t6\2\0\0009\2\1\0029\2\2\2-\4\0\0\18\6\0\0B\4\2\2\18\5\1\0B\2\3\1K\0\1\0\b¿\rfeedkeys\afn\bvimw\0\0\b\0\6\0\0176\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\3\0\18\3\0\0B\1\2\4H\4\5Ä9\6\4\5\a\6\5\0X\6\2Ä+\6\2\0L\6\2\0F\4\3\3R\4˘\127+\1\1\0L\1\2\0\remmet_ls\tname\npairs\20buf_get_clients\blsp\bvimÍ\1\0\0\6\3\6\1)-\0\0\0009\0\0\0009\0\1\0\14\0\0\0X\0\2Ä+\0\1\0L\0\2\0-\0\0\0009\0\0\0009\0\1\0-\1\1\0B\1\1\0028\0\1\0\14\0\0\0X\1\2Ä+\1\1\0L\1\2\0009\1\2\0009\1\3\0019\1\4\1\18\3\1\0009\1\5\1B\1\2\3-\3\2\0)\5\0\0B\3\2\2:\4\1\3\23\4\0\4>\4\1\3:\4\1\3:\5\1\1\3\5\4\0X\4\4Ä:\4\1\3:\5\1\2\2\4\5\0X\4\2Ä+\4\1\0X\5\1Ä+\4\2\0L\4\2\0\1\0\2¿\1¿\18pos_begin_end\tmark\fsnippet\vparent\18current_nodes\fsession\2ƒ\6\0\0\14\3\14\1´\1-\0\0\0009\0\0\0009\0\1\0\14\0\0\0X\0\2Ä+\0\1\0L\0\2\0-\0\1\0)\2\0\0B\0\2\2:\1\1\0\23\1\0\1>\1\1\0-\1\0\0009\1\0\0019\1\1\1-\2\2\0B\2\1\0028\1\2\1\14\0\1\0X\2\2Ä+\2\1\0L\2\2\0009\2\2\0019\2\3\0029\3\4\2:\3\0\3\15\0\3\0X\4\28Ä9\4\5\3\18\6\4\0009\4\6\4B\4\2\2:\5\1\0:\6\1\4\0\6\5\0X\5\bÄ:\5\1\0:\6\1\4\5\5\6\0X\5\16Ä:\5\2\0:\6\2\4\1\6\5\0X\5\fÄ\18\a\2\0009\5\a\2B\5\2\1-\5\0\0009\5\0\0059\5\1\5-\6\2\0B\6\1\2+\a\0\0<\a\6\5+\5\1\0L\5\2\0009\4\b\2\18\6\4\0009\4\t\4)\a\1\0+\b\2\0B\4\4\2\18\1\4\0\n\1\0\0X\4SÄ9\4\n\1\n\4\0\0X\4PÄ\4\1\2\0X\4NÄU\4MÄ9\4\n\1\r\5\4\0X\5\4Ä9\5\5\4\18\a\5\0009\5\v\5B\5\2\2\4\4\2\0X\6\6Ä\15\0\5\0X\6\4Ä:\6\1\0:\a\1\5\0\6\a\0X\6\nÄ:\6\1\0:\a\1\5\5\6\a\0X\6\4Ä:\6\2\0:\a\2\5\0\6\a\0X\6\2Ä+\6\1\0X\a\1Ä+\6\2\0\n\4\0\0X\a\3Ä9\a\n\2\5\4\a\0X\a\fÄ\18\t\2\0009\a\a\2B\a\2\1-\a\0\0009\a\0\a9\a\1\a-\b\2\0B\b\1\2+\t\0\0<\t\b\a+\a\1\0L\a\2\0\15\0\6\0X\a\bÄ-\a\0\0009\a\0\a9\a\1\a-\b\2\0B\b\1\2<\1\b\a+\a\2\0L\a\2\0+\a\0\0006\b\f\0009\n\r\1\18\v\1\0)\f\1\0+\r\2\0B\b\5\3\18\1\t\0\18\a\b\0\14\0\a\0X\b∏\127\18\n\2\0009\b\a\2B\b\2\1-\b\0\0009\b\0\b9\b\1\b-\t\2\0B\t\1\2+\n\0\0<\n\t\b+\b\1\0L\b\2\0X\4´\127\15\0\3\0X\4\bÄ-\4\0\0009\4\0\0049\4\1\4-\5\2\0B\5\1\2<\2\5\4+\4\2\0L\4\2\0\18\6\2\0009\4\a\2B\4\2\1-\4\0\0009\4\0\0049\4\1\4-\5\2\0B\5\1\2+\6\0\0<\6\5\4+\4\1\0L\4\2\0\1\0\1¿\2¿\14jump_from\npcall\14pos_begin\tnext\14jump_into\16inner_first\25remove_from_jumplist\fpos_end\tmark\17insert_nodes\fsnippet\vparent\18current_nodes\fsession\2¸\1\1\1\b\2\a\1,\14\0\0\0X\1\1Ä)\0\1\0-\1\0\0\14\0\1\0X\1\1Ä2\0$Ä6\1\0\0009\1\1\0019\1\2\0016\2\0\0009\2\1\0029\2\3\0023\3\4\0003\4\5\0\t\0\0\0X\5\vÄ\18\5\3\0B\5\1\2\15\0\5\0X\6\4Ä-\5\1\0009\5\6\5)\aˇˇB\5\2\0022\0\0ÄL\5\2\0X\5\rÄ\18\5\3\0B\5\1\2\15\0\5\0X\6\aÄ\18\5\4\0B\5\1\2\15\0\5\0X\6\3Ä-\5\1\0009\5\6\5B\5\1\0022\0\0ÄL\5\2\0002\0\0ÄK\0\1\0K\0\1\0\5¿\6¿\rjumpable\0\0\25nvim_get_current_buf\24nvim_win_get_cursor\bapi\bvim˛ˇˇˇ\31-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\6¿\tbody\15lsp_expandë\2\0\1\4\5\b\0/-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1%Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\28Ä-\1\2\0)\3\1\0B\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\4\1)\3\1\0B\1\2\1X\1\18Ä-\1\3\0B\1\1\2\15\0\1\0X\2\3Ä\18\1\0\0B\1\1\1X\1\vÄ-\1\4\0B\1\1\2\15\0\1\0X\2\5Ä6\1\5\0009\1\6\0019\1\a\1D\1\1\0X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\6¿\v¿\a¿\n¿\17cmp#complete\afn\bvim\tjump\vexpand\15expandable\21select_next_item\fvisibleÉ\1\0\1\4\3\3\0\22-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\fÄ-\1\1\0)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\2\0009\1\2\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\v¿\6¿\tjump\21select_prev_item\fvisibleˆ\1\0\1\5\3\a\0*-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\20Ä-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\2\15\0\1\0X\2\nÄ-\1\1\0)\3\1\0B\1\2\2\15\0\1\0X\2\4Ä-\1\2\0009\1\6\1)\3\1\0B\1\2\1K\0\1\0-\1\1\0)\3\1\0B\1\2\2\15\0\1\0X\2\tÄ-\1\2\0009\1\6\1)\3\1\0B\1\2\2\14\0\1\0X\1\5Ä\18\1\0\0B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\v¿\6¿\tjump\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\fvisible“\1\0\2\a\1\a\0\14'\2\1\0\18\4\2\0009\2\2\2-\5\0\0009\6\0\0018\5\6\5B\2\3\2=\2\0\0015\2\4\0009\3\5\0009\3\6\0038\2\3\2=\2\3\1L\1\2\0\f¿\tname\vsource\1\0\a\rnvim_lsp\n(lsp)\fluasnip\14(snippet)\flua-dev\v(ldev)\rnvim_lua\v(nvim)\fcopilot\14(copilot)\tpath\v(path)\vbuffer\r(buffer)\tmenu\vformat\a%s\tkind∏\14\1\0\23\0b\1Ÿ\0014\0\0\0004\1\0\0=\1\0\0006\1\1\0'\3\2\0B\1\2\0026\2\3\0006\4\1\0'\5\4\0B\2\3\3\14\0\2\0X\4\1Ä2\0ÀÄ3\4\5\0006\5\3\0006\a\1\0'\b\6\0B\5\3\3\15\0\5\0X\a*Ä6\a\1\0'\t\a\0B\a\2\0029\a\b\aB\a\1\0016\a\1\0'\t\t\0B\a\2\0029\a\b\a5\t\20\0004\n\3\0006\v\n\0009\v\v\v9\v\f\v6\r\r\0009\r\14\r9\r\15\r'\15\16\0B\r\2\2'\14\17\0&\r\14\rB\v\2\2>\v\1\n6\v\n\0009\v\v\v9\v\f\v6\r\r\0009\r\14\r9\r\15\r'\15\18\0B\r\2\2'\14\19\0&\r\14\rB\v\2\0?\v\0\0=\n\21\tB\a\2\0016\a\1\0'\t\22\0B\a\2\0029\a\b\aB\a\1\0013\a\23\0009\b\0\0=\a\24\b3\b\25\0003\t\26\0009\n\0\0=\t\27\n3\n\28\0009\v\0\0=\n\29\v3\v\30\0009\f\0\0=\v\31\f9\f \0019\r!\0035\15%\0005\16#\0003\17\"\0=\17$\16=\16&\0155\16)\0009\17\16\0039\17'\0179\17(\17B\17\1\2=\17*\0169\17\16\0039\17'\0179\17(\17B\17\1\2=\17+\16=\16'\0159\16,\0039\16-\0169\16.\0165\0180\0009\19,\0039\19/\19B\19\1\2=\0191\0189\19,\0039\0192\19B\19\1\2=\0193\0189\19,\0039\0194\19)\21¸ˇB\19\2\2=\0195\0189\19,\0039\0194\19)\21\4\0B\19\2\2=\0196\0189\19,\0033\0217\0005\0228\0B\19\3\2=\0199\0189\19,\0033\21:\0005\22;\0B\19\3\2=\19<\0189\19,\0039\19=\19B\19\1\2=\19>\0189\19,\0039\19?\19B\19\1\2=\19@\0189\19,\0033\21A\0B\19\2\2=\19B\18B\16\2\2=\16,\0155\16D\0005\17C\0=\17E\0163\17F\0=\17G\16=\16H\0155\16I\0004\17\v\0>\4\1\0179\18\16\0039\18J\0189\18K\18>\18\2\0179\18\16\0039\18J\0189\18L\18>\18\3\0179\18\16\0039\18J\0189\18M\18>\18\4\0179\18\16\0039\18J\0189\18N\18>\18\5\0179\18\16\0039\18J\0189\18O\18>\18\6\0179\18\16\0039\18J\0189\18P\18>\18\a\0179\18\16\0039\18J\0189\18 \18>\18\b\0179\18\16\0039\18J\0189\18Q\18>\18\t\0179\18\16\0039\18J\0189\18R\18>\18\n\17=\17S\16=\16T\0159\16\16\0039\16U\0164\18\b\0005\19V\0>\19\1\0185\19W\0>\19\2\0185\19X\0>\19\3\0185\19Y\0>\19\4\0185\19Z\0>\19\5\0185\19[\0>\19\6\0185\19\\\0>\19\a\0184\19\3\0005\20]\0>\20\1\19B\16\3\2=\16U\0155\16^\0=\16_\0155\16`\0=\16a\15B\r\2\0012\0\0ÄK\0\1\0K\0\1\0\17experimental\1\0\2\15ghost_text\1\16native_menu\1\15duplicates\1\0\4\rnvim_lsp\3\0\tpath\3\1\vbuffer\3\1\fluasnip\3\1\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\1\0\1\tname\flua-dev\1\0\1\tname\fcopilot\fsources\fsorting\16comparators\norder\14sort_text\rlocality\18recently_used\vlength\nscore\nexact\voffset\fcompare\1\0\1\20priority_weight\3\2\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\t<CR>\0\n<C-e>\nabort\14<C-Space>\rcomplete\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-f>\n<C-d>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\1\0\0\21select_prev_item\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\fsnippet\1\0\1\23duplicates_default\3\0\vexpand\1\0\0\0\nsetup\tkind\rjumpable\0\20is_emmet_active\0\rfeedkeys\0\0\20check_backspace\0\"luasnip.loaders.from_snipmate\npaths\1\0\0005/site/pack/packer/opt/friendly-snippets/snippets\tdata\14/snippets\vconfig\fstdpath\afn\bvim\tjoin\afs\bapi luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\fluasnip\0\bcmp\npcall\14lib.icons\frequire\fmethods\5ÄÄ¿ô\4\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-hardline"] = {
    config = { "\27LJ\2\n¯\5\0\0\b\0\28\0E6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\14\0005\4\6\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5=\5\t\4>\4\1\0035\4\n\0006\5\0\0'\a\v\0B\5\2\0029\5\b\5=\5\t\4>\4\2\0035\4\f\0006\5\0\0'\a\r\0B\5\2\0029\5\b\5=\5\t\4>\4\3\0035\4\15\0>\4\5\0035\4\16\0006\5\0\0'\a\17\0B\5\2\0029\5\b\5=\5\t\4>\4\6\0035\4\18\0006\5\0\0'\a\19\0B\5\2\0029\5\20\5=\5\t\4>\4\a\0035\4\21\0006\5\0\0'\a\19\0B\5\2\0029\5\22\5=\5\t\4>\4\b\0035\4\23\0006\5\0\0'\a\24\0B\5\2\0029\5\b\5=\5\t\4>\4\t\0035\4\25\0006\5\0\0'\a\26\0B\5\2\0029\5\b\5=\5\t\4>\4\n\3=\3\27\2B\0\2\1K\0\1\0\rsections\24hardline.parts.line\1\0\1\nclass\tmode\28hardline.parts.filetype\1\0\2\thide\3<\nclass\thigh\16get_warning\1\0\1\nclass\fwarning\14get_error\23hardline.parts.lsp\1\0\1\nclass\nerror&hardline.parts.treesitter-context\1\0\1\nclass\bmed\1\0\2\titem\a%=\nclass\bmed\1\5\0\0\0\0\0\a%<\28hardline.parts.filename\1\0\1\nclass\bmed\23hardline.parts.git\1\0\2\thide\3d\nclass\thigh\titem\rget_item\24hardline.parts.mode\1\0\1\nclass\tmode\24bufferline_settings\1\0\2\21exclude_terminal\1\15show_index\1\1\0\2\15bufferline\1\18custome_theme\fdefault\nsetup\rhardline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-hardline",
    url = "https://github.com/ojroques/nvim-hardline"
  },
  ["nvim-lsp-installer"] = {
    after = { "fidget.nvim" },
    config = { "\27LJ\2\nÅ\2\0\0\t\0\16\0\0276\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\15\0005\6\r\0005\a\a\0009\b\5\0029\b\6\b=\b\b\a9\b\5\0029\b\t\b=\b\n\a9\b\5\0029\b\v\b=\b\f\a=\a\14\6=\6\5\5B\3\2\1K\0\1\0\1\0\0\nicons\1\0\0\23server_uninstalled\ncross\19server_pending\npause\21server_installed\1\0\0\rdownload\aui\rsettings\14lib.icons\23nvim-lsp-installer\frequire\npcall\0" },
    load_after = {
      ["aerial.nvim"] = true,
      ["cmp-nvim-lsp"] = true,
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "cmp-nvim-lsp", "aerial.nvim", "nvim-lsp-installer" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nonicons"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-nonicons",
    url = "https://github.com/yamatsum/nvim-nonicons"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = { "\27LJ\2\nú\1\0\0\4\0\t\1\0246\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\16Ä6\0\0\0009\0\1\0009\0\4\0B\0\1\2'\1\5\0006\2\0\0009\2\1\0029\2\6\2B\2\1\2&\1\2\1\5\0\1\0X\0\4Ä6\0\0\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\tquit\bcmd\14tabpagenr\14NvimTree_\fbufname\6$\nwinnr\afn\bvim\2∞\28\1\0\14\0è\1\0Ñ\0026\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0˚Ä6\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1Ä2\0ıÄ9\4\4\0036\5\1\0'\a\5\0B\5\2\0024\6)\0005\a\a\0005\b\6\0=\b\b\a\18\b\4\0'\n\t\0B\b\2\2=\b\n\a>\a\1\0065\a\v\0\18\b\4\0'\n\f\0B\b\2\2=\b\n\a>\a\2\0065\a\r\0\18\b\4\0'\n\14\0B\b\2\2=\b\n\a>\a\3\0065\a\15\0>\a\4\0065\a\17\0005\b\16\0=\b\b\a>\a\5\0065\a\19\0005\b\18\0=\b\b\a>\a\6\0065\a\20\0>\a\a\0065\a\21\0>\a\b\0065\a\22\0>\a\t\0065\a\23\0>\a\n\0065\a\24\0>\a\v\0065\a\25\0>\a\f\0065\a\26\0>\a\r\0065\a\27\0>\a\14\0065\a\28\0>\a\15\0065\a\29\0>\a\16\0065\a\30\0>\a\17\0065\a\31\0>\a\18\0065\a \0>\a\19\0065\a!\0>\a\20\0065\a\"\0>\a\21\0065\a#\0>\a\22\0065\a$\0>\a\23\0065\a%\0>\a\24\0065\a&\0>\a\25\0065\a'\0>\a\26\0065\a(\0>\a\27\0065\a)\0>\a\28\0065\a*\0>\a\29\0065\a+\0>\a\30\0065\a,\0>\a\31\0065\a-\0>\a \0065\a.\0>\a!\0065\a/\0>\a\"\0065\a0\0>\a#\0065\a1\0>\a$\0065\a2\0>\a%\0065\a3\0>\a&\0065\a4\0>\a'\0065\a5\0>\a(\0065\a6\0005\b7\0=\b8\a5\b9\0005\t<\0009\n:\0059\n;\n=\n;\t9\n:\0059\n=\n=\n>\t9\n:\0059\n?\n=\n?\t9\n:\0059\n@\n=\n@\t=\tA\b=\b:\a5\bB\0004\t\0\0=\tC\b=\bD\a5\bE\0=\bF\a5\bG\0004\t\0\0=\tH\b4\t\0\0=\tI\b=\bJ\a5\bK\0=\bL\a5\bM\0005\tN\0=\tO\b5\tP\0005\nQ\0005\vS\0005\fR\0=\fT\v5\fU\0=\fV\v=\vI\n=\nW\t=\tX\b=\bY\a5\bZ\0005\t[\0=\6\\\t=\t]\b=\b^\a5\b_\0=\b`\a5\bc\0005\ta\0005\nb\0=\nA\t=\td\b5\te\0=\tA\b=\bf\a5\bg\0005\th\0=\ti\b=\bj\a9\bk\1\18\n\a\0B\b\2\0019\bl\0056\tm\0009\tn\t5\np\0=\no\t6\tm\0009\tn\t5\nt\0009\vr\b9\vs\v=\vs\n9\vr\b9\vu\v=\vu\n5\vw\0009\fL\b9\fv\f=\fv\v9\fL\b9\fx\f=\fx\v9\fL\b9\fy\f=\fy\v9\fL\b9\fz\f=\fz\v9\fL\b9\f{\f=\f{\v9\fL\b9\f|\f=\f|\v9\fL\b9\f}\f=\f}\v=\vL\n5\vÄ\0009\f~\b9\f\127\f=\fÅ\v9\f~\b9\fÇ\f=\fÉ\v9\fÑ\b9\fs\f=\fs\v9\fÑ\b9\f\127\f=\f\127\v9\fÑ\b9\fÖ\f=\fÖ\v9\fÑ\b9\fÜ\f=\fÜ\v9\fÑ\b9\fu\f=\fu\v=\vÑ\n=\nq\t6\tm\0009\tá\t9\tà\t5\vâ\0005\fã\0005\rä\0=\rå\f3\rç\0=\ré\fB\t\3\1K\0\1\0K\0\1\0K\0\1\0\rcallback\0\fpattern\1\0\0\1\2\0\0\6*\1\2\0\0\rBufEnter\24nvim_create_autocmd\bapi\15empty_open\nempty\vfolder\17arrow_closed\vclosed\15arrow_open\1\0\0\topen\narrow\fignored\14untracked\fdeleted\frenamed\runmerged\vstaged\1\0\0\runstaged\fsymlink\1\0\0\fdefault\tfile\20nvim_tree_icons\1\0\4\nfiles\3\1\18folder_arrows\3\1\ffolders\3\1\bgit\3\1\25nvim_tree_show_icons\6g\bvim\14documents\nsetup\blog\ntypes\1\0\5\ball\1\vconfig\1\fprofile\1\15copy_paste\1\bgit\1\1\0\2\rtruncate\1\venable\1\rrenderer\1\0\1\18webdev_colors\2\19indent_markers\1\0\0\1\0\3\tnone\a  \vcorner\t‚îî \tedge\t‚îÇ \1\0\1\venable\2\ntrash\1\0\2\20require_confirm\2\bcmd\ntrash\tview\rmappings\tlist\1\0\1\16custom_only\2\1\0\a\vnumber\1\tside\tleft\19relativenumber\1\21hide_root_folder\1\15signcolumn\byes\nwidth\3\25\vheight\3\30\factions\14open_file\18window_picker\fbuftype\1\5\0\0\vnofile\rterminal\thelp\fStartup\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\venable\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\1\0\1\18resize_window\1\15change_dir\1\0\3\venable\2\23restrict_above_cwd\1\vglobal\1\1\0\1\25use_system_clipboard\2\bgit\1\0\3\venable\2\ftimeout\3Ù\3\vignore\2\ffilters\fexclude\vcustom\1\0\1\rdotfiles\1\23hijack_directories\1\0\2\venable\2\14auto_open\2\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\2\nicons\nerror\fwarning\tinfo\16information\1\0\0\thint\16diagnostics\1\0\2\venable\2\17show_on_dirs\1\23ignore_ft_on_setup\1\4\0\0\rstartify\14dashboard\nalpha\1\0\t\15update_cwd\2\25auto_reload_on_write\2\fsort_by\22modification_time\18disable_netrw\2\17hijack_netrw\2\18hijack_cursor\2'hijack_unnamed_buffer_when_opening\2\16open_on_tab\1\23open_on_setup_file\1\1\0\2\bkey\6.\vaction\21run_file_command\1\0\2\bkey\n<C-k>\vaction\21toggle_file_info\1\0\2\bkey\6S\vaction\16search_node\1\0\2\bkey\6W\vaction\17collapse_all\1\0\2\bkey\ag?\vaction\16toggle_help\1\0\2\bkey\6q\vaction\nclose\1\0\2\bkey\6s\vaction\16system_open\1\0\2\bkey\6-\vaction\vdir_up\1\0\2\bkey\a]c\vaction\18next_git_item\1\0\2\bkey\a[c\vaction\18prev_git_item\1\0\2\bkey\agy\vaction\23copy_absolute_path\1\0\2\bkey\6Y\vaction\14copy_path\1\0\2\bkey\6y\vaction\14copy_name\1\0\2\bkey\6p\vaction\npaste\1\0\2\bkey\6c\vaction\tcopy\1\0\2\bkey\6x\vaction\bcut\1\0\2\bkey\n<C-r>\vaction\16full_rename\1\0\2\bkey\6r\vaction\vrename\1\0\2\bkey\6D\vaction\ntrash\1\0\2\bkey\6d\vaction\vremove\1\0\2\bkey\6a\vaction\vcreate\1\0\2\bkey\6R\vaction\frefresh\1\0\2\bkey\6H\vaction\20toggle_dotfiles\1\0\2\bkey\6I\vaction\23toggle_git_ignored\1\0\2\bkey\6J\vaction\17last_sibling\1\0\2\bkey\6K\vaction\18first_sibling\1\0\2\bkey\n<Tab>\vaction\fpreview\1\0\2\bkey\t<BS>\vaction\15close_node\1\0\2\bkey\6P\vaction\16parent_node\1\0\2\bkey\6>\vaction\17next_sibling\1\0\2\bkey\6<\vaction\17prev_sibling\1\0\2\bkey\n<C-t>\vaction\vtabnew\1\0\2\bkey\n<C-x>\vaction\nsplit\1\0\2\bkey\n<C-v>\vaction\vvsplit\1\0\1\vaction\acd\1\3\0\0\18<2-LeftMouse>\n<C-]>\1\0\1\vaction\19edit_no_picker\1\2\0\0\6O\1\0\2\bkey\n<C-p>\vaction\18edit_in_place\vvsplit\1\0\1\bkey\6v\15close_node\1\0\1\bkey\6h\acb\tedit\bkey\1\0\0\1\5\0\0\6l\t<CR>\6o\18<MiddleMouse>\14lib.icons\23nvim_tree_callback\21nvim-tree.config\14nvim-tree\frequire\npcall\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "gitsigns.nvim", "lush.nvim" },
    config = { "\27LJ\2\n€\n\0\0\b\0005\0K6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0005\6\n\0=\6\v\5=\5\f\0045\5\r\0004\6\0\0=\6\14\5=\5\15\0045\5\17\0005\6\16\0=\6\18\0055\6\19\0=\6\v\5=\5\20\0045\5\21\0004\6\0\0=\6\v\0055\6\22\0=\6\23\5=\5\24\0045\5\25\0=\5\26\0045\5\27\0005\6\28\0=\6\v\5=\5\29\0045\5\30\0005\6\31\0=\6 \0055\6!\0=\6\v\5=\5\"\0045\5#\0005\6$\0005\a%\0=\a&\6=\6'\5=\5(\0045\5*\0005\6)\0=\6+\0055\6,\0=\6-\5=\5.\0045\5/\0005\0060\0=\6\14\5=\0051\4B\2\2\0016\2\0\0006\4\1\0'\0052\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0009\4\3\0035\0063\0004\a\0\0=\a4\6B\4\2\1K\0\1\0\rpatterns\1\0\3\venable\1\rthrottle\2\14max_lines\3\0\23treesitter-context\17textsubjects\1\0\2\6.\23textsubjects-smart\6;\21textsubjects-big\1\0\1\venable\1\16textobjects\vselect\1\0\1\venable\1\tswap\1\0\0\1\0\1\venable\1\26context_commentstring\vconfig\20javascriptreact\1\0\1\18style_element\r{/*%s*/}\1\0\a\bcss\r/* %s */\tjson\5\15typescript\n// %s\tscss\r/* %s */\bvue\16<!-- %s -->\vsvelte\16<!-- %s -->\thtml\16<!-- %s -->\1\0\1\venable\2\frainbow\1\2\0\0\thtml\vcolors\1\t\0\0\f#f4468f\f#ECBE7B\f#de73ff\f#46D9FF\f#ff6c6b\f#51afef\f#a5e075\f#efefef\1\0\2\18extended_mode\1\venable\2\fautotag\1\2\0\0\bxml\1\0\1\venable\2\14autopairs\1\0\1\venable\2\15playground\16keybindings\1\0\n\27toggle_anonymous_nodes\6a\28toggle_language_display\6I\19focus_language\6f\vupdate\6R\21unfocus_language\6F\14goto_node\t<cr>\14show_help\6?\24toggle_query_editor\6o\21toggle_hl_groups\6i\30toggle_injected_languages\6t\1\0\3\20persist_queries\1\venable\2\15updatetime\3\25\vindent\1\3\0\0\bcss\tyaml\venable\1\0\0\1\2\0\0\20javascriptreact\26incremental_selection\fkeymaps\1\0\1\venable\2\14highlight\fdisable\1\3\0\0\bcss\nlatex\1\0\2\venable\2&additional_vim_regex_highlighting\2\19ignore_install\1\2\0\0\5\21ensure_installed\1\0\1\17sync_install\1\1\2\0\0\blua\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    after = { "Comment.nvim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    after = { "nvim-tree.lua", "cmp-nvim-lsp", "aerial.nvim", "telescope.nvim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    after = { "gitsigns.nvim" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ripgrep = {
    after = { "telescope.nvim" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["telescope-command-palette.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-command-palette.nvim",
    url = "https://github.com/LinArcX/telescope-command-palette.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-smart-history.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-smart-history.nvim",
    url = "https://github.com/nvim-telescope/telescope-smart-history.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nZ\0\3\6\0\2\2\r)\3»\0\1\3\1\0X\3\5Ä6\3\0\0009\3\1\3\24\5\0\1D\3\2\0X\3\4Ä6\3\0\0009\3\1\3\24\5\1\1D\3\2\0K\0\1\0\nfloor\tmathµÊÃô\19ô≥Ê˛\3ÁÃô≥\6≥Êåˇ\3ù=\1\0\f\0Ï\1\1ô\0036\0\0\0'\2\1\0B\0\2\0026\1\2\0006\3\0\0'\4\3\0B\1\3\3\14\0\1\0X\3\1Ä2\0éÅ6\3\0\0'\5\1\0B\3\2\0029\3\4\0039\3\5\0039\3\6\0039\4\a\0005\6C\0005\a\b\0005\b\f\0005\t\t\0003\n\n\0=\n\v\t=\t\r\b5\t\14\0=\t\15\b5\t\17\0005\n\16\0=\n\r\t=\t\18\b=\b\19\a5\b\20\0=\b\21\a6\b\0\0'\n\22\0B\b\2\0029\b\23\b=\b\24\a5\b\25\0=\b\26\a6\b\0\0'\n\22\0B\b\2\0029\b\27\b=\b\28\a5\b\29\0=\b\30\a5\b\31\0=\b \a5\b!\0=\b\"\a6\b\0\0'\n#\0B\b\2\0029\b$\b9\b%\b=\b&\a6\b\0\0'\n#\0B\b\2\0029\b'\b9\b%\b=\b(\a6\b\0\0'\n#\0B\b\2\0029\b)\b9\b%\b=\b*\a6\b\0\0'\n#\0B\b\2\0029\b+\b=\b+\a5\b,\0=\b-\a5\b>\0005\t/\0009\n.\2=\n0\t9\n1\2=\n2\t9\n3\2=\n4\t9\n5\2=\n6\t9\n7\2=\n8\t9\n9\2=\n:\t9\n;\0029\v<\2 \n\v\n=\n=\t=\t?\b5\t@\0009\n1\2=\n2\t9\n3\2=\n4\t9\n;\0029\v<\2 \n\v\n=\n=\t=\tA\b=\bB\a=\aD\0065\aF\0005\bE\0=\b\5\a5\bG\0005\tH\0=\tI\b=\bJ\a5\bK\0=\bL\a5\bO\0005\tN\0005\nM\0=\nA\t=\tB\b=\bP\a=\aQ\0065\aS\0005\bR\0=\bT\a5\bU\0=\bV\a4\b\3\0006\t\0\0'\vW\0B\t\2\0029\tX\t4\v\0\0B\t\2\0?\t\0\0=\bY\a5\b[\0005\tZ\0=\t\\\b=\b]\a5\b^\0005\ty\0005\n`\0009\v_\3=\va\n9\vb\3=\vc\n9\vd\3=\ve\n9\vf\3=\vg\n9\vh\3=\vi\n9\vj\3=\vk\n9\vl\3=\vm\n9\vn\3=\vo\n9\vp\3=\vq\n9\vr\3=\vs\n9\vt\3=\vu\n9\vv\3=\vw\n9\vx\3=\v0\n=\n?\t5\nz\0009\v_\3=\v{\n9\vb\3=\v|\n9\vd\3=\v}\n9\vf\3=\v~\n9\vh\3=\v\127\n9\vj\3=\vÄ\n9\vl\3=\vÅ\n9\vn\3=\vÇ\n9\vp\3=\vÉ\n9\vr\3=\vÑ\n9\vt\3=\vÖ\n9\vv\3=\vÜ\n9\vx\3=\vá\n=\nA\t=\tB\b=\b\5\a4\b\a\0005\tà\0005\nâ\0>\n\2\t5\nä\0>\n\3\t5\nã\0>\n\4\t5\nå\0>\n\5\t5\nç\0>\n\6\t5\né\0>\n\a\t5\nè\0>\n\b\t5\nê\0>\n\t\t>\t\1\b5\të\0005\ní\0>\n\2\t5\nì\0>\n\3\t5\nî\0>\n\4\t5\nï\0>\n\5\t5\nñ\0>\n\6\t5\nó\0>\n\a\t5\nò\0>\n\b\t>\t\2\b5\tô\0005\nö\0>\n\2\t5\nõ\0>\n\3\t5\nú\0>\n\4\t5\nù\0>\n\5\t5\nû\0>\n\6\t5\nü\0>\n\a\t5\n†\0>\n\b\t5\n°\0>\n\t\t5\n¢\0>\n\n\t5\n£\0>\n\v\t5\n§\0>\n\f\t5\n•\0>\n\r\t5\n¶\0>\n\14\t5\nß\0>\n\15\t5\n®\0>\n\16\t5\n©\0>\n\17\t5\n™\0>\n\18\t>\t\3\b5\t´\0005\n¨\0>\n\2\t5\n≠\0>\n\3\t5\nÆ\0>\n\4\t5\nØ\0>\n\5\t5\n∞\0>\n\6\t5\n±\0>\n\a\t5\n≤\0>\n\b\t5\n≥\0>\n\t\t5\n¥\0>\n\n\t5\nµ\0>\n\v\t5\n∂\0>\n\f\t5\n∑\0>\n\r\t5\n∏\0>\n\14\t5\nπ\0>\n\15\t5\n∫\0>\n\16\t5\nª\0>\n\17\t5\nº\0>\n\18\t5\nΩ\0>\n\19\t5\næ\0>\n\20\t5\nø\0>\n\21\t5\n¿\0>\n\22\t5\n¡\0>\n\23\t5\n¬\0>\n\24\t5\n√\0>\n\25\t5\nƒ\0>\n\26\t5\n≈\0>\n\27\t5\n∆\0>\n\28\t5\n«\0>\n\29\t5\n»\0>\n\30\t5\n…\0>\n\31\t5\n \0>\n \t>\t\4\b5\tÀ\0005\nÃ\0>\n\2\t5\nÕ\0>\n\3\t5\nŒ\0>\n\4\t5\nœ\0>\n\5\t5\n–\0>\n\6\t>\t\5\b5\t—\0005\n“\0>\n\2\t5\n”\0>\n\3\t5\n‘\0>\n\4\t5\n’\0>\n\5\t5\n÷\0>\n\6\t5\n◊\0>\n\a\t5\nÿ\0>\n\b\t5\nŸ\0>\n\t\t5\n⁄\0>\n\n\t5\n€\0>\n\v\t5\n‹\0>\n\f\t5\n›\0>\n\r\t5\nﬁ\0>\n\14\t5\nﬂ\0>\n\15\t5\n‡\0>\n\16\t5\n·\0>\n\17\t5\n‚\0>\n\18\t5\n„\0>\n\19\t5\n‰\0>\n\20\t>\t\6\b=\bÂ\a5\bÁ\0005\tÊ\0=\t\19\b=\bË\a=\a\4\6B\4\2\0016\4È\0005\6Í\0B\4\2\4X\a\6Ä6\t\0\0'\v\1\0B\t\2\0029\tÎ\t\18\v\b\0B\t\2\1E\a\3\3R\a¯\127K\0\1\0K\0\1\0\19load_extension\1\a\0\0\bfzf\17file_browser\16media_files\18smart_history\20command_palette\agh\vipairs\vpacker\1\0\0\1\0\1\vheight\4\0ÄÄÄˇ\3\20command_palette\1\3\0\0\20Telescope Files\29:Telescope git_files<CR>\1\3\0\0\29Telescope Branch Commits :Telescope git_bcommits<CR>\1\3\0\0\21Telescope Commis\31:Telescope git_commits<CR>\1\3\0\0\23Telescope Branch's :Telescope git_branches<CR>\1\3\0\0\20Telescope Stash\29:Telescope git_stash<CR>\1\3\0\0\21Telescope Status\30:Telescope git_status<CR>\1\3\0\0\20Undo Stage Hunk3:lua require('gitsigns').undo_stage_hunk()<CR>\1\3\0\0\15Stage Hunk-:lua require 'gitsigns'.stage_hunk()<CR>\1\3\0\0\17Reset Buffer/:lua require 'gitsigns'.reset_buffer()<CR>\1\3\0\0\15Reset Hunk-:lua require 'gitsigns'.reset_hunk()<CR>\1\3\0\0\17Preview Hunk/:lua require 'gitsigns'.preview_hunk()<CR>\1\3\0\0\nBlame-:lua require 'gitsigns'.blame_line()<CR>\1\3\0\0\14Prev Hunk,:lua require 'gitsigns'.prev_hunk()<CR>\1\3\0\0\14Next Hunk,:lua require 'gitsigns'.next_hunk()<CR>\1\3\0\0\rGit Diff :Gitsigns diffthis HEAD<CR>\1\3\0\0\20Git Diff Staged\27:Git diff --staged<CR>\1\3\0\0\rGit Diff\18:Git diff<CR>\1\3\0\0\fGit Logb:Git log --graph --abbrev-commit --decorate --format=format:\"%h - (%ar) %s - %an%d\" --all<CR>\1\3\0\0\15Git Status\16:Git status\1\2\0\0\bGit\1\3\0\0\vUpdate\22:PackerUpdate<cr>\1\3\0\0\vStatus\22:PackerStatus<cr>\1\3\0\0\tSync\20:PackerSync<cr>\1\3\0\0\fInstall\23:PackerInstall<cr>\1\3\0\0\fCompile\23:PackerCompile<cr>\1\2\0\0\vPacker\1\3\0\0\21Vim Autocommands :Telescope autocommands<CR>\1\3\0\0\17Vim Commands\28:Telescope commands<CR>\1\3\0\0\16Vim Options\31:Telescope vim_options<CR>\1\3\0\0\17Colorschemes\31:Telescope colorscheme<CR>\1\3\0\0\14Registers\29:Telescope registers<CR>\1\3\0\0\24Normal Mode Keymaps\27:Telescope keymaps<CR>\1\3\0\0\20Command History#:Telescope command_history<CR>\1\3\0\0\fHistory\":Telescope search_history<CR>\1\3\0\0\14Old Files\28:Telescope oldfiles<CR>\1\3\0\0\16Media Files\31:Telescope media_files<CR>\1\3\0\0\nFiles\30:Telescope find_files<CR>\1\3\0\0\15Treesitter\30:Telescope treesitter<CR>\1\3\0\0\rQuickfix\28:Telescope quickfix<CR>\1\3\0\0\fSymbols\27:Telescope symbols<CR>\1\3\0\0\rTagstack\28:Telescope tagstack<CR>\1\3\0\0\24Current Buffer Tags':Telescope current_buffer_tags<CR>\1\3\0\0\tTags\24:Telescope tags<CR>\1\3\0\0\nMarks\25:Telescope marks<CR>\1\3\0\0\14Help Tags\29:Telescope help_tags<CR>\1\3\0\0\25Spelling Suggestions!:Telescope spell_suggest<CR>\1\3\0\0\rJumplist\28:Telescope jumplist<CR>\1\3\0\0\fBuffers\27:Telescope buffers<CR>\1\3\0\0\19Locations List\27:Telescope loclist<CR>\1\3\0\0\rReloader\28:Telescope reloader<CR>\1\3\0\0\20Buffer FZF Find-:Telescope current_buffer_fuzzy_find<CR>\1\3\0\0\15FZF Native\30:Telescope fzf_native<CR>\1\3\0\0\14Live Grep\29:Telescope live_grep<CR>\1\3\0\0\16Grep String\31:Telescope grep_string<CR>\1\3\0\0\14Man Pages\29:Telescope man_pages<CR>\1\3\0\0\24Telescope Builtin's\27:Telescope builtin<CR>\1\3\0\0\14Open Last\26:Telescope resume<CR>\1\2\0\0\vSearch\1\3\0\0\30search highlighting (F12)\19:set hlsearch!\1\3\0\0\20relative number\25:set relativenumber!\1\3\0\0\18spell checker\16:set spell!\1\3\0\0\18cursor column\23:set cursorcolumn!\1\3\0\0\16cursor line\21:set cursorline!\1\3\0\0\15paste mode\16:set paste!\1\3\0\0\25search history (C-h)7:lua require('telescope.builtin').search_history()\1\3\0\0\fbuffers\23:Telescope buffers\1\3\0\0\fkeymaps0:lua require('telescope.builtin').keymaps()\1\3\0\0\16vim options4:lua require('telescope.builtin').vim_options()\1\4\0\0\16colorshceme4:lua require('telescope.builtin').colorscheme()\3\1\1\3\0\0\20registers (A-e)2:lua require('telescope.builtin').registers()\1\3\0\0\20command history8:lua require('telescope.builtin').command_history()\1\3\0\0\rcommands1:lua require('telescope.builtin').commands()\1\3\0\0\18jumps (Alt-j)1:lua require('telescope.builtin').jumplist()\1\3\0\0\17check health\17:checkhealth\1\3\0\0\17reload vimrc\21:source $MYVIMRC\1\2\0\0\bVim\1\4\0\0\20search help(F1)2:lua require('telescope.builtin').help_tags()\3\1\1\3\0\0\20quick reference\19:help quickref\1\3\0\0\fsummary\18:help summary\1\3\0\0\rtutorial\16:help tutor\1\3\0\0\15cheatsheet\16:help index\1\3\0\0\ttips\15:help tips\1\3\0\0\fkeymaps\15:Legendary\1\2\0\0\tHelp\1\4\0\0\16files (C-f)3:lua require('telescope.builtin').find_files()\3\1\1\4\0\0\20git files (A-f)2:lua require('telescope.builtin').git_files()\3\1\1\4\0\0\22search word (A-w)2:lua require('telescope.builtin').live_grep()\3\1\1\4\0\0\23file browser (C-i)C:lua require'telescope'.extensions.file_browser.file_browser()\3\1\1\3\0\0\15quit (C-q)\b:qa\1\3\0\0\27save all files (C-A-s)\b:wa\1\3\0\0\28save current file (C-s)\a:w\1\3\0\0\27entire selection (C-a)\27:call feedkeys(\"GVgg\")\1\2\0\0\tFile\6s\6h\6f\6t\6w\6e\6g\6o\6d\6y\6m\6r\6c\1\0\1\6?\14which_key\1\0\0\15toggle_all\n<C-.>\18toggle_hidden\n<C-f>\19toggle_browser\n<C-t>\15change_cwd\n<C-w>\rgoto_cwd\n<A-h>\18goto_home_dir\n<A-g>\20goto_parent_dir\n<C-o>\topen\n<A-d>\vremove\n<A-y>\tcopy\n<A-m>\tmove\n<A-r>\vrename\n<A-c>\1\0\1\n<C-/>\14which_key\vcreate\1\0\2\16cwd_to_path\2\fgrouped\2\16media_files\14filetypes\1\0\1\rfind_cmd\arg\1\5\0\0\bpng\twebp\bjpg\tjpeg\14ui-select\17get_dropdown\21telescope.themes\15fzy_native\1\0\2\28override_generic_sorter\2\25override_file_sorter\2\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\28override_generic_sorter\1\25override_file_sorter\2\fpickers\afd\1\0\0\1\0\0\1\0\1\akj\nclose\14live_grep\1\0\2\vhidden\2\19only_sort_text\2\15find_files\17find_command\1\5\0\0\afd\16--type=file\r--hidden\17--smart-case\1\0\1\vhidden\2\1\0\0\1\0\2\16cwd_to_path\2\vhidden\2\rdefaults\1\0\0\rmappings\6n\1\0\1\6?\14which_key\6i\1\0\0\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-p>\23cycle_history_prev\n<C-n>\23cycle_history_next\n<C-c>\nclose\n<C-k>\28move_selection_previous\n<C-j>\24move_selection_next\n<C-s>\1\0\1\n<C-/>\14which_key\22select_horizontal\fhistory\1\0\1\nlimit\3d\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\17path_display\1\0\1\fshorten\3\5\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\1\5\0\0\17node_modules\t.git\vtarget\vvendor\16file_sorter\19get_fuzzy_file\22telescope.sorters\22vimgrep_arguments\1\n\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\18--glob=!.git/\18layout_config\tflex\1\0\0\1\0\1\18preview_width\4Õô≥Ê\fÃô≥ˇ\3\rvertical\1\0\4\vmirror\1\nwidth\4Õô≥Ê\fÃô≥ˇ\3\19preview_height\4\0ÄÄÄˇ\3\vheight\4ÊÃô≥\6ÊÃπˇ\3\15horizontal\1\0\3\19preview_cutoff\3x\nwidth\4ÊÃô≥\6ÊÃπˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\18preview_width\0\1\0\4\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\20prompt_position\btop\nwidth\4ÊÃô≥\6ÊÃπˇ\3\vheight\4≥ÊÃô\3≥Ê¨ˇ\3\1\0\r\15treesitter\2\19color_devicons\2\26dynamic_preview_title\2\23selection_strategy\nreset\20layout_strategy\15horizontal\vborder\2\18prompt_prefix\a> \rwinblend\3\0\20selection_caret\a> \17entry_prefix\a  \15multi_icon\a<>\17initial_mode\vinsert\21sorting_strategy\14ascending\nsetup\factions\17file_browser\15extensions\22telescope.actions\npcall\14telescope\frequire\3ÄÄ¿ô\4\0" },
    load_after = {
      fd = true,
      ripgrep = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-wakatime"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n®\6\0\0\a\0'\0-6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\t\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\5=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0005\6\20\0=\6\21\0055\6\22\0=\6\23\5=\5\24\0045\5\26\0005\6\25\0=\6\27\0055\6\28\0=\6\29\5=\5\30\0045\5\31\0=\5 \0045\5\"\0005\6!\0=\6#\0055\6$\0=\6%\5=\5&\4B\2\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\vborder\vsingle\rposition\vbottom\rwinblend\3\0\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\nicons\1\0\3\14separator\6>\15breadcrumb\b‚Ä¶\ngroup\6+\15key_labels\1\0\2\b<M>\b<A>\f<space>\r<leader>\14operators\1\0\1\agc\rComments\fplugins\1\0\3\14show_help\2\19ignore_missing\1\rtriggers\tauto\rspelling\1\0\2\fenabled\2\16suggestions\3\20\fpresets\1\0\a\6z\2\6g\2\14operators\2\fmotions\2\17text_objects\2\fwindows\2\bnav\2\1\0\2\nmarks\2\14registers\2\nsetup\14which-key\frequire\npcall\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\nÕ\5\0\0\15\0%\2?6\0\0\0'\2\1\0B\0\2\2'\1\2\0009\2\3\0005\4\5\0005\5\4\0=\5\6\4B\2\2\0019\2\a\0'\4\b\0)\5\0\0B\2\3\0019\2\a\0'\4\t\0004\5\3\0009\6\n\0009\b\v\0005\n\f\0009\v\r\0B\v\1\2=\v\14\nB\b\2\0029\t\15\0B\t\1\0A\6\1\0?\6\0\0B\2\3\0019\2\a\0'\4\16\0009\5\17\0005\a\19\0009\b\18\0B\b\1\2=\b\20\a5\b\28\0009\t\21\0'\v\22\0'\f\23\0004\r\4\0005\14\24\0>\14\1\r5\14\25\0>\14\2\r5\14\26\0=\1\27\14>\14\3\rB\t\4\2=\t\29\b=\b\30\a5\b\31\0009\t \0B\t\1\0?\t\1\0=\b!\a5\b\"\0009\t#\0B\t\1\0?\t\1\0=\b$\aB\5\2\0A\2\1\1K\0\1\0\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\23popupmenu_devicons\1\2\0\0\6 \15highlights\vaccent\1\0\0\15foreground\1\0\0\1\0\1\6a\3\1\1\0\1\6a\3\1\nPmenu\17WilderAccent\fmake_hl\16highlighter\1\0\5\freverse\3\0\20prompt_position\btop\15max_height\b50%\15min_height\3\0\rpumblend\3\0\24lua_fzy_highlighter\23popupmenu_renderer\rrenderer\24vim_search_pipeline\17fuzzy_filter\19lua_fzy_filter\1\0\1\nfuzzy\3\1\21cmdline_pipeline\vbranch\rpipeline\29use_python_remote_plugin\15set_option\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\f#4aa5f0\vwilder\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^hop"] = "hop.nvim",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\nÕ\5\0\0\15\0%\2?6\0\0\0'\2\1\0B\0\2\2'\1\2\0009\2\3\0005\4\5\0005\5\4\0=\5\6\4B\2\2\0019\2\a\0'\4\b\0)\5\0\0B\2\3\0019\2\a\0'\4\t\0004\5\3\0009\6\n\0009\b\v\0005\n\f\0009\v\r\0B\v\1\2=\v\14\nB\b\2\0029\t\15\0B\t\1\0A\6\1\0?\6\0\0B\2\3\0019\2\a\0'\4\16\0009\5\17\0005\a\19\0009\b\18\0B\b\1\2=\b\20\a5\b\28\0009\t\21\0'\v\22\0'\f\23\0004\r\4\0005\14\24\0>\14\1\r5\14\25\0>\14\2\r5\14\26\0=\1\27\14>\14\3\rB\t\4\2=\t\29\b=\b\30\a5\b\31\0009\t \0B\t\1\0?\t\1\0=\b!\a5\b\"\0009\t#\0B\t\1\0?\t\1\0=\b$\aB\5\2\0A\2\1\1K\0\1\0\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\23popupmenu_devicons\1\2\0\0\6 \15highlights\vaccent\1\0\0\15foreground\1\0\0\1\0\1\6a\3\1\1\0\1\6a\3\1\nPmenu\17WilderAccent\fmake_hl\16highlighter\1\0\5\freverse\3\0\20prompt_position\btop\15max_height\b50%\15min_height\3\0\rpumblend\3\0\24lua_fzy_highlighter\23popupmenu_renderer\rrenderer\24vim_search_pipeline\17fuzzy_filter\19lua_fzy_filter\1\0\1\nfuzzy\3\1\21cmdline_pipeline\vbranch\rpipeline\29use_python_remote_plugin\15set_option\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\f#4aa5f0\vwilder\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22modules.misc.mini\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd impatient.nvim ]]
vim.cmd [[ packadd LuaSnip ]]
vim.cmd [[ packadd doom-one.nvim ]]

-- Config for: doom-one.nvim
try_loadstring("\27LJ\2\nü\3\0\0\6\0\t\0\0166\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä+\2\1\0L\2\2\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\4B\2\2\1K\0\1\0\25plugins_integrations\1\0\14\14dashboard\1\nneorg\1\flspsaga\1\14nvim_tree\2\21indent_blankline\1\vbarbar\1\15bufferline\1\14gitgutter\1\vneogit\1\rwhichkey\2\19vim_illuminate\1\rstartify\1\rgitsigns\2\14telescope\2\rpumblend\1\0\2\venable\1\24transparency_amount\3\0\1\0\5\20italic_comments\2\22enable_treesitter\2\27transparent_background\1\20cursor_coloring\2\20terminal_colors\2\nsetup\rdoom-one\frequire\npcall\0", "config", "doom-one.nvim")

vim.cmd [[ packadd dressing.nvim ]]

-- Config for: dressing.nvim
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0Ÿ\6\1\0\6\0$\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0033\4\b\0=\4\t\3=\3\v\0025\3\f\0005\4\r\0=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\0035\4\23\0005\5\24\0=\5\25\4=\4\26\0035\4\27\0005\5\28\0=\5\5\0045\5\29\0=\5\a\0045\5\30\0=\5\31\0043\5 \0=\5\t\4=\4!\0034\4\0\0=\4\"\3=\3#\2B\0\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\15min_height\1\3\0\0\3\n\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3(\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3å\1\4ö≥ÊÃ\tô≥¶ˇ\3\1\0\6\vborder\frounded\15max_height\4Õô≥Ê\fÃô≥ˇ\3\rrelative\veditor\17winhighlight\5\vanchor\aNW\rwinblend\3\n\bnui\vborder\1\0\1\nstyle\frounded\1\0\4\14max_width\3P\15max_height\3(\rposition\b50%\rrelative\veditor\ffzf_lua\fwinopts\1\0\0\1\0\2\nwidth\4\0ÄÄÄˇ\3\vheight\4ö≥ÊÃ\tô≥Ê˛\3\bfzf\vwindow\1\0\0\1\0\2\nwidth\4\0ÄÄÄˇ\3\vheight\4ö≥ÊÃ\tô≥Ê˛\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\1\fenabled\2\ninput\1\0\0\roverride\0\14min_width\1\3\0\0\3\20\4ö≥ÊÃ\tô≥¶˛\3\14max_width\1\3\0\0\3å\1\4Õô≥Ê\fÃô≥ˇ\3\1\0\n\rwinblend\3\n\17winhighlight\5\fenabled\2\vborder\frounded\17prefer_width\3(\19default_prompt\vInput:\17prompt_align\tleft\16insert_only\2\rrelative\vcursor\vanchor\aSW\nsetup\rdressing\frequire\0", "config", "dressing.nvim")

vim.cmd [[ packadd fzy-lua-native ]]
vim.cmd [[ packadd legendary.nvim ]]

-- Config for: legendary.nvim
try_loadstring("\27LJ\2\nΩ\2\0\0\5\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0004\4\0\0=\4\b\0034\4\0\0=\4\t\0034\4\0\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\15scratchpad\1\0\1\20display_results\nfloat\14which_key\15do_binding\topts\rmappings\1\0\0\rautocmds\rcommands\fkeymaps\1\0\4\28auto_register_which_key\2\20include_builtin\2\27include_legendary_cmds\2\28most_recent_item_at_top\2\nsetup\14legendary\frequire\0", "config", "legendary.nvim")

vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd nvim-nonicons ]]
vim.cmd [[ packadd filetype.nvim ]]

-- Config for: filetype.nvim
try_loadstring("\27LJ\2\nP\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\rfiletype\frequire\npcall\0", "config", "filetype.nvim")

vim.cmd [[ packadd telescope-command-palette.nvim ]]
vim.cmd [[ packadd telescope-file-browser.nvim ]]
vim.cmd [[ packadd telescope-fzf-native.nvim ]]
vim.cmd [[ packadd telescope-github.nvim ]]
vim.cmd [[ packadd telescope-media-files.nvim ]]
vim.cmd [[ packadd telescope-smart-history.nvim ]]
vim.cmd [[ packadd vim-fugitive ]]
vim.cmd [[ packadd nvim-hardline ]]

-- Config for: nvim-hardline
try_loadstring("\27LJ\2\n¯\5\0\0\b\0\28\0E6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\14\0005\4\6\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5=\5\t\4>\4\1\0035\4\n\0006\5\0\0'\a\v\0B\5\2\0029\5\b\5=\5\t\4>\4\2\0035\4\f\0006\5\0\0'\a\r\0B\5\2\0029\5\b\5=\5\t\4>\4\3\0035\4\15\0>\4\5\0035\4\16\0006\5\0\0'\a\17\0B\5\2\0029\5\b\5=\5\t\4>\4\6\0035\4\18\0006\5\0\0'\a\19\0B\5\2\0029\5\20\5=\5\t\4>\4\a\0035\4\21\0006\5\0\0'\a\19\0B\5\2\0029\5\22\5=\5\t\4>\4\b\0035\4\23\0006\5\0\0'\a\24\0B\5\2\0029\5\b\5=\5\t\4>\4\t\0035\4\25\0006\5\0\0'\a\26\0B\5\2\0029\5\b\5=\5\t\4>\4\n\3=\3\27\2B\0\2\1K\0\1\0\rsections\24hardline.parts.line\1\0\1\nclass\tmode\28hardline.parts.filetype\1\0\2\thide\3<\nclass\thigh\16get_warning\1\0\1\nclass\fwarning\14get_error\23hardline.parts.lsp\1\0\1\nclass\nerror&hardline.parts.treesitter-context\1\0\1\nclass\bmed\1\0\2\titem\a%=\nclass\bmed\1\5\0\0\0\0\0\a%<\28hardline.parts.filename\1\0\1\nclass\bmed\23hardline.parts.git\1\0\2\thide\3d\nclass\thigh\titem\rget_item\24hardline.parts.mode\1\0\1\nclass\tmode\24bufferline_settings\1\0\2\21exclude_terminal\1\15show_index\1\1\0\2\15bufferline\1\18custome_theme\fdefault\nsetup\rhardline\frequire\0", "config", "nvim-hardline")

vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd sqlite.lua ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1 lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'lua-dev.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'friendly-snippets'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'fidget.nvim', 'lua-dev.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-cmp', 'fidget.nvim', 'copilot-cmp', 'cmp-path', 'cmp-nvim-lsp-signature-help', 'cmp-buffer', 'lua-dev.nvim', 'cmp-nvim-lsp', 'cmp_luasnip', 'hop.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'Comment.nvim'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'which-key.nvim', 'vim-wakatime', 'vim-repeat', 'ripgrep', 'nvim-treesitter', 'nvim-cmp', 'nvim-lspconfig', 'fidget.nvim', 'copilot-cmp', 'cmp-path', 'cmp-nvim-lsp-signature-help', 'cmp-buffer', 'lua-dev.nvim', 'cmp-nvim-lsp', 'cmp_luasnip', 'fd', 'plenary.nvim', 'hop.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'copilot-cmp', 'cmp-path', 'cmp-nvim-lsp-signature-help', 'cmp-buffer', 'cmp-nvim-lsp', 'cmp_luasnip', 'nvim-ts-autotag', 'nvim-autopairs', 'friendly-snippets'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'which-key.nvim', 'vim-wakatime', 'vim-repeat', 'ripgrep', 'nvim-treesitter', 'nvim-lspconfig', 'fd', 'plenary.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
