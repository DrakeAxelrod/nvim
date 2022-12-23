-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\nˇ\2\0\0\a\0\16\0\28+\0\0\0006\1\0\0006\3\1\0'\4\2\0B\1\3\3\15\0\1\0X\3\5Ä\15\0\2\0X\3\3Ä9\3\3\2B\3\1\2\18\0\3\0006\3\1\0'\5\4\0B\3\2\0029\3\5\0035\5\6\0005\6\a\0=\6\b\0055\6\t\0=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\5=\0\15\5B\3\2\1K\0\1\0\rpre_hook\nextra\1\0\3\nbelow\bgco\beol\bgcA\nabove\bgcO\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\rmappings\1\0\2\nbasic\2\nextra\2\1\0\4\vactive\2\vsticky\2\fpadding\2\vignore\a^$\nsetup\fComment\20create_pre_hook7ts_context_commentstring.integrations.comment_nvim\frequire\npcall\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nÉ\1\0\0\a\2\a\0\15-\0\0\0009\0\0\0B\0\1\2'\1\1\0\18\3\1\0009\1\2\0019\4\3\0009\5\4\0-\6\1\0009\6\5\0069\6\6\6B\1\5\0024\2\3\0>\1\1\2L\2\2\0\3¿\4¿\fPackage\aui\ntotal\nstart\vformat\21Loaded %s/%s %s \17plugin_countö\a\1\0\r\0000\1p6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0hÄ6\2\1\0'\4\3\0B\2\2\0026\3\1\0'\5\4\0B\3\2\0026\4\1\0'\6\5\0B\4\2\0026\5\1\0'\a\6\0B\5\2\0029\6\a\0059\6\b\0069\a\n\2=\a\t\0069\6\a\0059\6\v\0064\a\a\0009\b\f\5'\n\r\0009\v\14\0049\v\15\v'\f\16\0&\v\f\v'\f\17\0B\b\4\2>\b\1\a9\b\f\5'\n\18\0009\v\14\0049\v\15\v'\f\19\0&\v\f\v'\f\20\0B\b\4\2>\b\2\a9\b\f\5'\n\21\0009\v\22\0049\v\23\v'\f\24\0&\v\f\v'\f\25\0B\b\4\2>\b\3\a9\b\f\5'\n\26\0009\v\14\0049\v\27\v'\f\28\0&\v\f\v'\f\29\0B\b\4\2>\b\4\a9\b\f\5'\n\30\0009\v\14\0049\v\31\v'\f \0&\v\f\v'\f!\0B\b\4\2>\b\5\a9\b\f\5'\n\"\0009\v#\0049\v$\v'\f%\0&\v\f\v'\f&\0B\b\4\0?\b\0\0=\a\t\0063\6'\0009\a\a\0059\a(\a\18\b\6\0B\b\1\2=\b\t\a9\a\a\0059\a(\a9\a)\a'\b+\0=\b*\a9\a\a\0059\a\b\a9\a)\a'\b,\0=\b*\a9\a\a\0059\a\v\a9\a)\a'\b-\0=\b*\a9\a)\0059\a)\a+\b\2\0=\b.\a9\a/\0019\t)\5B\a\2\0012\0\0ÄK\0\1\0K\0\1\0\nsetup\14noautocmd\fKeyword\14Directory\tType\ahl\topts\vfooter\0\f:qa<CR>\v  Quit\nError\16diagnostics\6q :e $MYVIMRC | :cd %:p:h<cr>\r  Config\tGear\6c\23:PackerCompile<CR>\21  Packer Compile\vTarget\6C\20:PackerSync<CR>\18  Packer Sync\fWorking\14installer\6S :Telescope file_browser<CR>\19  File Browser\6f\28:Telescope frecency<CR>\19  Recent files\14Telescope\aui\6r\vbutton\fbuttons\15lighthouse\bval\vheader\fsection\27alpha.themes.dashboard\16theme.icons\15utils.pack\26plugins.alpha.banners\nalpha\frequire\npcall\rÄÄ¿ô\4\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["autoclose.nvim"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n?\0\2\3\0\3\0\n6\2\0\0009\2\1\0028\2\0\0029\2\2\2\4\2\1\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\rfiletype\abo\bvim¢\2\0\4\17\1\14\00004\4\0\0005\5\2\0-\6\0\0009\6\0\0069\6\1\6=\6\3\5-\6\0\0009\6\0\0069\6\4\6=\6\5\5-\6\0\0009\6\0\0069\6\6\6=\6\a\0056\6\b\0\18\b\2\0B\6\2\4H\t\14Ä8\v\t\5\15\0\v\0X\f\vÄ)\v\0\0\1\v\n\0X\v\bÄ6\v\t\0009\v\n\v\18\r\4\0008\14\t\5'\15\v\0\18\16\n\0&\14\16\14B\v\3\1F\t\3\3R\t\1276\6\t\0009\6\f\6\18\b\4\0'\t\v\0B\6\3\2\18\4\6\0\21\6\4\0)\a\0\0\1\a\6\0X\6\2Ä\f\6\4\0X\6\1Ä'\6\r\0L\6\2\0\0¿\5\vconcat\6 \vinsert\ntable\npairs\tinfo\16Information\fwarning\fWarning\nerror\1\0\0\nError\16diagnostics\29\0\1\5\1\1\0\4-\1\0\0\18\3\0\0'\4\0\0D\1\3\0\0\0\blogı\1\1\2\t\1\b\1/6\2\0\0009\2\1\0023\4\2\0\f\5\1\0X\5\1Ä4\5\0\0B\2\3\0026\3\0\0009\3\3\3\18\5\2\0B\3\2\2\15\0\3\0X\4\3Ä+\3\2\0002\0\0ÄL\3\2\0006\3\0\0009\3\4\0039\3\5\3B\3\1\0026\4\0\0009\4\4\0049\4\5\4'\6\6\0B\4\2\2-\5\0\0\18\a\0\0'\b\a\0B\5\3\2\t\4\0\0X\6\3Ä+\6\2\0002\0\0ÄL\6\2\0\5\3\4\0X\6\2Ä\f\6\5\0X\6\aÄ\4\3\4\0X\6\2Ä\19\6\5\0X\a\3Ä+\6\1\0X\a\1Ä+\6\2\0002\0\0ÄL\6\2\0\2¿\blog\6$\14tabpagenr\afn\16tbl_isempty\0\15tbl_filter\bvim\2+\0\1\6\0\2\0\0066\1\0\0'\3\1\0\18\4\0\0+\5\1\0B\1\4\1K\0\1\0\abd\rbuf_killg\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameˇ\r\1\0\v\0?\0e6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0003\3\4\0003\4\5\0006\5\0\0'\a\6\0B\5\2\0029\5\a\0055\a(\0005\b\b\0003\t\t\0=\t\n\b5\t\r\0009\n\v\0009\n\f\n=\n\14\t=\t\15\b9\t\v\0009\t\16\t=\t\17\b9\t\v\0009\t\18\t=\t\19\b9\t\v\0009\t\20\t=\t\21\b9\t\v\0009\t\22\t=\t\23\b9\t\v\0009\t\24\t=\t\25\b3\t\26\0=\t\27\b=\3\28\b=\4\29\b4\t\6\0005\n\30\0>\n\1\t5\n\31\0>\n\2\t5\n \0>\n\3\t5\n!\0>\n\4\t5\n\"\0>\n\5\t=\t#\b5\t$\0005\n%\0=\n&\t=\t'\b=\b)\a5\b.\0005\t+\0009\n*\1=\n,\t9\n*\1=\n-\t=\t/\b5\t0\0009\n,\1=\n,\t9\n-\1=\n-\t=\t1\b5\t3\0009\n2\1=\n,\t9\n-\1=\n-\t=\t4\b5\t6\0009\n5\1=\n,\t9\n-\1=\n-\t=\t7\b5\t8\0009\n*\1=\n,\t=\t9\b5\t:\0009\n*\1=\n,\t=\t;\b5\t<\0009\n*\1=\n,\t9\n-\1=\n-\t=\t=\b=\b>\aB\5\2\0012\0\0ÄK\0\1\0\15highlights\14separator\1\0\0\22separator_visible\1\0\0\23separator_selected\1\0\0\20buffer_selected\1\0\2\vitalic\2\tbold\2\tblue\19buffer_visible\1\0\0\nwhite\15background\1\0\0\tfill\1\0\0\abg\afg\1\0\0\18bg_statusline\foptions\1\0\0\nhover\vreveal\1\2\0\0\nclose\1\0\2\ndelay\3»\1\fenabled\1\foffsets\1\0\4\fpadding\3\1\ttext\vPacker\14highlight\17PanelHeading\rfiletype\vpacker\1\0\3\rfiletype\24flutterToolsOutline\ttext\20Flutter Outline\14highlight\17PanelHeading\1\0\4\fpadding\3\1\ttext\14Diff View\14highlight\17PanelHeading\rfiletype\18DiffviewFiles\1\0\4\fpadding\3\1\ttext\rExplorer\14highlight\17PanelHeading\rfiletype\rNvimTree\1\0\4\fpadding\3\1\ttext\rUndotree\14highlight\17PanelHeading\rfiletype\rundotree\18custom_filter\26diagnostics_indicator\19name_formatter\0\23right_trunc_marker\21ArrowCircleRight\22left_trunc_marker\20ArrowCircleLeft\15close_icon\14BoldClose\18modified_icon\16SmallCircle\22buffer_close_icon\nClose\14indicator\ticon\1\0\1\nstyle\ticon\17BoldLineLeft\aui\18close_command\0\1\0\23\20show_close_icon\1\24show_tab_indicators\1\26show_duplicate_prefix\2\24persist_buffer_sort\2\rtab_size\3\18\20separator_style\nslant\16diagnostics\rnvim_lsp\27always_show_bufferline\2\fsort_by\aid\fnumbers\tnone\24right_mouse_command\20vert sbuffer %d\23left_mouse_command\14buffer %d\25middle_mouse_command\16bdelete! %d\25enforce_regular_tabs\1\20max_name_length\3\18\22max_prefix_length\3\15\19truncate_names\2\tmode\fbuffers!diagnostics_update_in_insert\1\16color_icons\2\22show_buffer_icons\2\28show_buffer_close_icons\1\29show_buffer_default_icon\2\nsetup\15bufferline\0\0\0\17theme.colors\16theme.icons\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\nÚ\1\0\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0009\6\5\1=\6\a\0059\6\b\1=\6\t\0059\6\n\1=\6\v\5=\5\f\4B\2\2\1K\0\1\0\15formatters\fpreview\rdeindent\16insert_text\23format_insert_text\nlabel\1\0\0\22format_label_text\1\0\1\vmethod\26getCompletionsCycling\nsetup\23copilot_cmp.format\16copilot_cmp\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    config = { "\27LJ\2\n∑\3\0\0\5\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\5\3=\3\n\0025\3\v\0=\3\f\0024\3\0\0=\3\r\2B\0\2\1K\0\1\0\26server_opts_overrides\14filetypes\1\0\t\bsvn\1\bcvs\1\6.\1\tyaml\1\rmarkdown\1\thelp\1\14gitcommit\1\14gitrebase\1\rhgcommit\1\15suggestion\1\0\4\tprev\n<M-[>\fdismiss\n<C-]>\vaccept\n<M-l>\tnext\n<M-]>\1\0\3\17auto_trigger\2\fenabled\2\rdebounce\3K\npanel\1\0\1\25copilot_node_command\tnode\vkeymap\1\0\5\topen\v<M-CR>\14jump_prev\a[[\14jump_next\a]]\vaccept\t<CR>\frefresh\agr\1\0\2\17auto_refresh\2\fenabled\2\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n÷\a\0\0\5\0\26\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\19preview_config\1\0\5\bcol\3\1\vborder\frounded\brow\3\0\nstyle\fminimal\rrelative\vcursor&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\ndelay\3Ë\a\22ignore_whitespace\1\14virt_text\2\18virt_text_pos\beol\fkeymaps\1\0\2\vbuffer\2\fnoremap\2\nsigns\1\0\t\15signcolumn\2\nnumhl\1\24attach_to_untracked\2\23current_line_blame\1\20update_debounce\3»\1\18sign_priority\3\6\20max_file_length\3¿∏\2\14word_diff\1\vlinehl\1\17changedelete\1\0\4\ahl\19GitSignsChange\ttext\6_\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\14topdelete\1\0\4\ahl\19GitSignsDelete\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vdelete\1\0\4\ahl\19GitSignsDelete\ttext\6-\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\vchange\1\0\4\ahl\19GitSignsChange\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\ttext\6+\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lsp-setup.nvim"] = {
    config = { "\27LJ\2\nc\0\2\v\2\3\0\15-\2\0\0009\2\0\2B\2\1\0016\2\1\0-\4\1\0009\4\2\4B\2\2\4X\5\4Ä\18\a\6\0\18\t\0\0\18\n\1\0B\a\3\1E\5\3\3R\5˙\127K\0\1\0\0¿\1¿\19on_attach_list\vipairs\nsetup·\1\1\0\a\0\v\0\0246\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\5\0004\5\0\0=\5\6\0043\5\a\0=\5\b\0049\5\t\0B\5\1\2=\5\t\0049\5\n\1B\5\1\2=\5\n\4B\2\2\0012\0\0ÄK\0\1\0\fservers\17capabilities\14on_attach\0\rmappings\1\0\1\21default_mappings\1\nsetup\14lsp-setup\14utils.lsp\30plugins.language.handlers\frequire\0" },
    load_after = {
      ["neodev.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/lsp-setup.nvim",
    url = "https://github.com/junnplus/lsp-setup.nvim"
  },
  ["lspsaga.nvim"] = {
    after = { "lsp-setup.nvim" },
    config = { "\27LJ\2\n \n\0\0\t\0001\0P6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\5\0=\5\6\0044\5\5\0009\6\a\0019\6\b\6'\a\t\0&\6\a\6>\6\1\0059\6\a\0019\6\n\6'\a\t\0&\6\a\6>\6\2\0059\6\a\0019\6\v\6'\a\t\0&\6\a\6>\6\3\0059\6\a\0019\6\f\6'\a\t\0&\6\a\6>\6\4\5=\5\r\0049\5\a\0019\5\14\5=\5\15\0045\5\16\0=\5\17\0045\5\20\0009\6\18\0019\6\19\6=\6\21\0059\6\18\0019\6\22\6=\6\23\0059\6\18\0019\6\24\6=\6\25\5=\5\26\0045\5\28\0005\6\27\0=\6\29\0055\6\30\0=\6\31\5=\5 \0045\5!\0=\5\"\0045\5#\0=\5$\0045\5%\0'\6\t\0009\a\18\0019\a&\a'\b\t\0&\6\b\6=\6'\5=\5(\0045\5)\0009\6\18\0019\6*\6=\6+\0059\6\18\0019\6,\6=\6-\5=\5.\0044\5\0\0=\5/\0044\5\0\0=\0050\4B\2\2\1K\0\1\0\24server_filetype_map\16custom_kind\17show_outline\rjump_key\21SmallEmptyCircle\14virt_text\19BoldLineMiddle\1\0\5\15auto_enter\2\17auto_preview\2\17auto_refresh\2\17win_position\nright\14win_width\3\30\21symbol_in_winbar\14separator\22ChevronShortRight\1\0\5\19file_formatter\5\18click_support\1\14in_custom\1\14show_file\2\venable\2\27definition_action_keys\1\0\5\tquit\6q\nsplit\v<C-c>i\tedit\v<C-c>o\vvsplit\v<C-c>v\ttabe\v<C-c>t\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\tquit\1\3\0\0\6q\n<ESC>\topen\1\0\3\vvsplit\6s\nsplit\6i\ttabe\6t\1\3\0\0\6o\t<CR>\17finder_icons\tlink\tLink\bref\fForward\bdef\1\0\0\20MagnifyingGlass\aui\26code_action_lightbulb\1\0\a\18sign_priority\3\20\16update_time\3ñ\1\17virtual_text\2\venable\2\tsign\2\21enable_in_insert\2\22cache_code_action\2\21code_action_icon\rBoldHint\22diagnostic_header\17AltLightning\20BoldInformation\16BoldWarning\6 \14BoldError\16diagnostics\17move_in_saga\1\0\2\tprev\n<C-p>\tnext\n<C-n>\1\0\b\23rename_action_quit\n<C-c>\21rename_in_select\2\17border_style\frounded\18saga_winblend\3\0\24preview_lines_above\3\0\22max_preview_lines\3\n\29code_action_num_shortcut\2\27finder_request_timeout\3‹\v\18init_lsp_saga\16theme.icons\flspsaga\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nü\a\0\0\a\0*\0f6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\17\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\n\0005\6\t\0=\6\v\0054\6\0\0=\6\f\5=\5\r\0044\5\0\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0035\4\20\0004\5\3\0009\6\19\0>\6\1\5=\5\21\0044\5\3\0009\6\22\0>\6\1\5=\5\23\0044\5\3\0009\6\24\0>\6\1\0059\6\25\0>\6\2\5=\5\26\0044\5\5\0009\6\27\0>\6\1\0059\6\28\0>\6\2\0059\6\29\0>\6\3\0059\6\30\0>\6\4\5=\5\31\0044\5\3\0009\6 \0>\6\1\5=\5!\0044\5\3\0009\6\"\0>\6\1\5=\5#\4=\4$\0035\4%\0004\5\3\0009\6\19\0>\6\1\5=\5\21\0044\5\3\0009\6\22\0>\6\1\5=\5\23\0044\5\3\0009\6\24\0>\6\1\0059\6\25\0>\6\2\5=\5\26\0044\5\5\0009\6\27\0>\6\1\0059\6\28\0>\6\2\0059\6\29\0>\6\3\0059\6\30\0>\6\4\5=\5\31\0044\5\3\0009\6 \0>\6\1\5=\5!\0044\5\3\0009\6\"\0>\6\1\5=\5#\4=\4&\0034\4\0\0=\4'\0034\4\0\0=\4\f\0034\4\0\0=\4(\0034\4\0\0=\4)\3B\1\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\0\0\rsections\14lualine_z\rprogress\14lualine_y\rlocation\14lualine_x\rfiletype\vspaces\blsp\16diagnostics\14lualine_c\15python_env\tdiff\14lualine_b\vbranch\14lualine_a\1\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\15statusline\3Ë\a\vwinbar\3Ë\a\ftabline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\1\2\0\0\nalpha\23section_separators\1\0\2\tleft\5\nright\5\25component_separators\1\0\2\tleft\5\nright\5\1\0\4\ntheme\tauto\17globalstatus\2\25always_divide_middle\2\18icons_enabled\2\nsetup\flualine\31plugins.lualine.components\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nu\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\27automatic_installation\2\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n˘\6\0\0\v\0$\00036\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0016\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\n\0\18\6\2\0006\b\6\0009\b\a\b9\b\b\b'\n\t\0B\b\2\2'\t\4\0B\6\3\2=\6\v\0055\6\f\0004\a\0\0=\a\r\6=\6\14\0056\6\6\0009\6\15\0069\6\16\0069\6\17\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0055\6\23\0005\a\26\0009\b\24\0009\b\25\b=\b\27\a9\b\24\0009\b\28\b=\b\29\a9\b\24\0009\b\30\b=\b\31\a=\a \0065\a!\0=\a\"\6=\6#\5B\3\2\1K\0\1\0\aui\fkeymaps\1\0\t\24update_all_packages\6U\28check_outdated_packages\6C\22uninstall_package\6X\24cancel_installation\n<C-c>\26apply_language_filter\n<C-f>\26toggle_package_expand\t<CR>\20install_package\6i\19update_package\6u\26check_package_version\6c\nicons\24package_uninstalled\fRemoved\20package_pending\fWorking\22package_installed\1\0\0\fSuccess\14installer\1\0\2\vborder\tnone$check_outdated_packages_on_open\2\14providers\1\2\0\0!mason.providers.registry-api\vgithub\1\0\1\26download_url_template2https://github.com/%s/releases/download/%s/%s\14log_level\tINFO\vlevels\blog\bpip\17install_args\1\0\1\16upgrade_pip\1\21install_root_dir\1\0\2\tPATH\fprepend\30max_concurrent_installers\3\4\tdata\fstdpath\afn\bvim\nsetup\nmason\rjoinpath\rutils.fn\16theme.icons\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    after = { "lsp-setup.nvim" },
    config = { "\27LJ\2\n\v\0\2\2\0\0\0\1K\0\1\0õ\1\1\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\roverride\0\flibrary\1\0\2\14lspconfig\2\17setup_jsonls\2\1\0\4\fruntime\2\fenabled\2\ntypes\2\fplugins\2\nsetup\vneodev\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n˛\4\0\0\5\0$\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\0025\3\17\0005\4\16\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\3=\3\31\0025\3!\0005\4 \0=\4\"\3=\3#\2B\0\2\1K\0\1\0\rmappings\vstatus\1\0\0\1\0\1\6B\16BranchPopup\rsections\vrecent\1\0\1\vfolded\2\runmerged\1\0\1\vfolded\1\runpulled\1\0\1\vfolded\2\fstashes\1\0\1\vfolded\2\vstaged\1\0\1\vfolded\1\runstaged\1\0\1\vfolded\1\14untracked\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\1\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\6>\6v\fsection\1\0\0\1\3\0\0\6>\6v\17commit_popup\1\0\1\tkind\nsplit\1\0\b\"disable_builtin_notifications\1\26use_magit_keybindings\1!disable_context_highlighting\1\tkind\btab\17auto_refresh\2\18disable_signs\1\17disable_hint\1 disable_commit_confirmation\1\nsetup\vneogit\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\nì\17\0\0\a\0T\0s6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0044\5\0\0=\5\16\4=\4\17\3=\3\a\0025\3\19\0=\3\20\0025\3\21\0=\3\22\0025\3\23\0=\3\24\0025\3\25\0=\3\26\0024\3\3\0005\4\28\0005\5\27\0=\5\v\4>\4\1\3=\3\29\0025\3#\0005\4\31\0005\5\30\0=\5 \0045\5!\0=\5\"\4=\4$\0035\4%\0005\5&\0=\5 \0045\5'\0=\5(\0045\5)\0005\6*\0=\6+\5=\5,\4=\4-\0035\4.\0005\5/\0=\5 \0045\0050\0=\5\"\0045\0051\0005\0062\0=\0063\5=\5(\0045\0055\0005\0064\0=\6+\5=\5,\4=\4\22\0035\0046\0005\0057\0=\5\17\0045\0058\0=\5 \0045\0059\0005\6:\0=\0063\0055\6;\0=\6<\5=\5(\0045\5>\0005\6=\0=\6+\5=\5,\4=\4?\3=\3@\0025\3B\0005\4A\0=\4C\0035\4D\0=\4E\0035\4F\0004\5\0\0=\5\4\4=\4G\0035\4H\0005\5I\0=\5J\0044\5\0\0=\5\4\4=\4K\0035\4L\0004\5\0\0=\5\4\4=\4M\0035\4N\0005\5O\0005\6P\0=\6\17\0055\6Q\0=\6,\5=\5\4\4=\4R\3=\3S\2B\0\2\1K\0\1\0\blsp\18documentation\1\0\2\18concealcursor\6n\17conceallevel\3\3\1\2\0\0\14{message}\1\0\3\tlang\rmarkdown\freplace\2\vrender\nplain\1\0\1\tview\nhover\fmessage\1\0\2\fenabled\2\tview\vnotify\14signature\14auto_open\1\0\4\fluasnip\2\fenabled\2\rthrottle\0032\ftrigger\2\1\0\1\fenabled\2\nhover\1\0\1\fenabled\2\roverride\1\0\3\"vim.lsp.util.stylize_markdown\1 cmp.entry.get_documentation\0011vim.lsp.util.convert_input_to_markdown_lines\1\rprogress\1\0\0\1\0\5\fenabled\2\vformat\17lsp_progress\rthrottle\4´’™’\n™’ÇÇ\4\16format_done\22lsp_progress_done\tview\tmini\nviews\fconfirm\1\0\0\1\0\2\vNormal\17NoiceConfirm\16FloatBorder\23NoiceConfirmBorder\ttext\1\0\1\btop\14 Confirm \1\3\0\0\3\0\3\1\1\0\1\nstyle\frounded\1\0\2\bcol\b50%\brow\b50%\1\2\0\0\r{config}\1\0\a\nenter\1\14focusable\1\fbackend\npopup\tsize\tauto\vzindex\3P\nalign\vcenter\rrelative\veditor\1\0\0\1\0\2\vNormal\vNormal\16FloatBorder\19DiagnosticInfo\fpadding\1\3\0\0\3\0\3\1\1\0\1\nstyle\frounded\1\0\2\nwidth\3<\vheight\3\n\1\0\2\bcol\b50%\brow\3\b\1\0\1\rrelative\veditor\tmini\16win_options\17winhighlight\1\0\3\vSearch\5\14IncSearch\5\vNormal\14NoiceMini\1\0\1\rwinblend\3\30\vborder\1\0\1\nstyle\tnone\1\0\2\bcol\t100%\brow\3\1\1\0\a\14focusable\1\freverse\2\ftimeout\3–\15\tsize\tauto\vzindex\3\20\nalign\18message-right\rrelative\veditor\18cmdline_popup\1\0\0\tsize\1\0\2\nwidth\3<\vheight\tauto\rposition\1\0\1\vzindex\3d\1\0\2\bcol\b50%\brow\3\5\vroutes\1\0\1\tview\nsplit\1\0\2\nevent\vnotify\15min_height\3\15\fpresets\1\0\5\18bottom_search\2\20command_palette\2\26long_message_to_split\2\15inc_rename\2\19lsp_doc_border\2\vnotify\1\0\1\fenabled\2\14popupmenu\1\0\1\fenabled\2\rmessages\1\0\6\fenabled\2\16view_search\16virtualtext\15view_error\vnotify\tview\vnotify\14view_warn\vnotify\17view_history\rmessages\1\0\0\vformat\ninput\thelp\1\0\2\fpattern\20^:%s*he?l?p?%s+\ticon\bÔüï\blua\1\0\3\tlang\blua\ticon\bÓò†\fpattern\16^:%s*lua%s+\vfilter\1\0\3\tlang\tbash\ticon\6$\fpattern\v^:%s*!\16search_down\1\0\4\tlang\nregex\ticon\tÔÄÇ \tkind\vsearch\fpattern\a^/\fcmdline\1\0\0\1\0\3\tlang\bvim\ticon\bÔÅî\fpattern\a^:\topts\1\0\2\fenabled\2\tview\18cmdline_popup\nsetup\nnoice\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\nﬂ\2\0\2\a\1\a\0\15'\2\1\0\18\4\2\0009\2\2\2-\5\0\0009\5\0\0059\6\0\0018\5\6\5B\2\3\2=\2\0\0015\2\4\0009\3\5\0009\3\6\0038\2\3\2=\2\3\1L\1\2\0\1¿\tname\vsource\1\0\14\nemoji\f(Emoji)\16cmp_tabnine\14(Tabnine)\nvsnip\14(Snippet)\vneodev\r(Neodev)\rnvim_lsp\n(LSP)\ttmux\v(TMUX)\fluasnip\14(Snippet)\15treesitter\17(TreeSitter)\rnvim_lua\v(Nvim)\tcalc\v(Calc)\vbuffer\r(Buffer)\fcopilot\14(Copilot)\28nvim_lsp_signature_help\16(Signature)\tpath\v(Path)\tmenu\vformat\a%s\tkindC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireâ\1\0\1\5\1\6\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\fvisibleè\2\0\1\4\3\a\0(-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\30Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\21Ä-\1\2\0009\1\4\1)\3\1\0B\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\5\1)\3\1\0B\1\2\1X\1\nÄ-\1\2\0009\1\6\1B\1\1\2\15\0\1\0X\2\3Ä\18\1\0\0B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\3¿\0¿\21has_words_before\tjump\rjumpable\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\3¿\tjump\rjumpable\21select_prev_item\fvisibleh\0\0\5\0\6\0\0166\0\0\0009\0\1\0009\0\2\0B\0\1\0029\0\3\0\18\2\0\0009\0\4\0)\3\1\0)\4\1\0B\0\4\2\6\0\5\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\6i\bsub\tmode\18nvim_get_mode\bapi\bvim≈\1\1\1\6\1\b\0\30-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\22Ä5\1\1\0-\2\0\0009\2\2\0029\2\3\2=\2\4\0013\2\5\0\18\3\2\0B\3\1\2\15\0\3\0X\4\4Ä-\3\0\0009\3\2\0039\3\6\3=\3\4\1-\3\0\0009\3\a\3\18\5\1\0B\3\2\2\15\0\3\0X\4\2Ä2\0\0ÄK\0\1\0\18\1\0\0B\1\1\1K\0\1\0\2¿\fconfirm\vInsert\0\rbehavior\fReplace\20ConfirmBehavior\1\0\1\vselect\2\fvisibleΩ\1\0\2\6\0\n\0\0236\2\0\0'\4\1\0B\2\2\0029\2\2\0029\2\3\2\18\5\0\0009\3\4\0B\3\2\0028\2\3\2\a\2\5\0X\3\6Ä9\3\6\0019\3\a\3\a\3\b\0X\3\2Ä+\3\1\0L\3\2\0\a\2\t\0X\3\2Ä+\3\1\0L\3\2\0+\3\2\0L\3\2\0\tText\tjava\rfiletype\17prev_context\fSnippet\rget_kind\23CompletionItemKind\blsp\14cmp.types\frequireª\16\1\0\18\0k\0◊\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0026\4\0\0'\6\5\0B\4\2\0029\5\6\0025\a\b\0005\b\a\0=\b\t\a5\b\n\0=\b\v\a9\b\f\0029\b\r\b=\b\14\a5\b\15\0004\t\v\0006\n\0\0'\f\16\0B\n\2\0029\n\17\n>\n\1\t6\n\0\0'\f\16\0B\n\2\0029\n\18\n>\n\2\t9\n\19\0029\n\20\n9\n\21\n>\n\3\t9\n\19\0029\n\20\n9\n\22\n>\n\4\t9\n\19\0029\n\20\n9\n\18\n>\n\5\t9\n\23\4>\n\6\t9\n\19\0029\n\20\n9\n\24\n>\n\a\t9\n\19\0029\n\20\n9\n\25\n>\n\b\t9\n\19\0029\n\20\n9\n\26\n>\n\t\t9\n\19\0029\n\20\n9\n\27\n>\n\n\t=\t\28\b=\b\29\a5\b\31\0005\t\30\0=\t \b9\t\24\1=\t!\b5\t\"\0=\t#\b5\t$\0=\t%\b3\t&\0=\t'\b=\b(\a5\b*\0003\t)\0=\t+\b=\b,\a5\b/\0009\t\19\0029\t-\t9\t.\tB\t\1\2=\t\t\b9\t\19\0029\t-\t9\t.\tB\t\1\2=\t0\b=\b-\a9\b1\0029\b2\b9\b3\b5\n6\0009\v1\0029\r1\0029\r4\rB\r\1\0025\0145\0B\v\3\2=\v7\n9\v1\0029\r1\0029\r8\rB\r\1\0025\0149\0B\v\3\2=\v:\n9\v1\0029\r1\0029\r8\r5\15=\0009\16;\0029\16<\16=\16>\15B\r\2\0025\14?\0B\v\3\2=\v@\n9\v1\0029\r1\0029\r4\r5\15A\0009\16;\0029\16<\16=\16>\15B\r\2\0025\14B\0B\v\3\2=\vC\n9\v1\0029\vD\v)\r¸ˇB\v\2\2=\vE\n9\v1\0029\vD\v)\r\4\0B\v\2\2=\vF\n9\v1\0025\rK\0009\0141\0029\14G\0145\16J\0009\17H\0029\17I\17=\17>\16B\14\2\2=\14L\r3\14M\0=\14N\rB\v\2\2=\vO\n9\v1\0023\rP\0005\14Q\0B\v\3\2=\vR\n9\v1\0023\rS\0005\14T\0B\v\3\2=\vU\n9\v1\0029\vV\vB\v\1\2=\vW\n9\v1\0029\vX\vB\v\1\2=\vY\n9\v1\0023\rZ\0B\v\2\2=\v[\nB\b\2\2=\b1\a4\b\r\0005\t\\\0>\t\1\b5\t]\0003\n^\0=\n_\t>\t\2\b5\t`\0>\t\3\b5\ta\0>\t\4\b5\tb\0>\t\5\b5\tc\0>\t\6\b5\td\0>\t\a\b5\te\0>\t\b\b5\tf\0>\t\t\b5\tg\0>\t\n\b5\th\0>\t\v\b5\ti\0>\t\f\b=\bj\aB\5\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\ttmux\1\0\1\tname\vcrates\1\0\1\tname\15treesitter\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lua\1\0\1\tname\16cmp_tabnine\1\0\1\tname\fluasnip\1\0\1\tname\tpath\17entry_filter\0\1\0\1\tname\rnvim_lsp\1\0\2\tname\fcopilot\16group_index\3\2\t<CR>\0\n<C-e>\nabort\14<C-Space>\rcomplete\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-y>\6c\0\6i\1\0\0\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<C-f>\n<C-d>\16scroll_docs\t<Up>\1\2\0\0\6i\1\0\0\v<Down>\1\2\0\0\6i\rbehavior\1\0\0\vSelect\19SelectBehavior\n<C-j>\1\3\0\0\6i\6c\21select_next_item\n<C-k>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\vinsert\vpreset\fmapping\18documentation\1\0\0\rbordered\vwindow\fsnippet\vexpand\1\0\0\0\15formatting\vformat\0\15duplicates\1\0\4\fluasnip\3\1\vbuffer\3\1\rnvim_lsp\3\0\tpath\3\1\17source_names\1\0\v\nemoji\f(Emoji)\16cmp_tabnine\14(Tabnine)\nvsnip\14(Snippet)\rnvim_lsp\n(LSP)\15treesitter\17(TreeSitter)\ttmux\v(TMUX)\fluasnip\14(Snippet)\vbuffer\r(Buffer)\fcopilot\14(Copilot)\tcalc\v(Calc)\tpath\v(Path)\15kind_icons\vfields\1\0\2\23duplicates_default\3\0\14max_width\3\0\1\4\0\0\tkind\tabbr\tmenu\fsorting\16comparators\norder\vlength\14sort_text\tkind\nunder\nexact\voffset\fcompare\vconfig\nscore\15prioritize\28copilot_cmp.comparators\1\0\1\20priority_weight\3\2\14preselect\tNone\18PreselectMode\17experimental\1\0\2\15ghost_text\1\16native_menu\1\15completion\1\0\0\1\0\1\19keyword_length\3\1\nsetup\25cmp-under-comparator\fluasnip\bcmp\16theme.icons\24plugins.cmp.helpers\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    after = { "neogit", "bufferline.nvim", "alpha-nvim", "nvim-tree.lua", "gitsigns.nvim", "which-key.nvim", "smart-splits.nvim", "telescope.nvim", "lsp-setup.nvim", "nvim-cmp" },
    config = { "\27LJ\2\n»\2\0\0\6\0\19\0\0316\0\0\0'\2\1\0B\0\2\0026\1\2\0006\2\0\0'\4\3\0B\2\2\2=\2\3\0016\1\2\0009\1\3\0019\1\4\0015\3\5\0005\4\b\0009\5\6\0009\5\a\5=\5\t\0049\5\6\0009\5\n\5=\5\v\0049\5\6\0009\5\f\5=\5\r\0049\5\6\0009\5\14\5=\5\15\0049\5\6\0009\5\16\5=\5\17\4=\4\18\3B\1\2\1K\0\1\0\nicons\nTRACE\nTrace\nDEBUG\nDebug\tINFO\tInfo\tWARN\tWarn\nERROR\1\0\0\nError\16diagnostics\1\0\5\vstages\nslide\22background_colour\vNormal\18minimum_width\0032\ftimeout\3Ë\a\vrender\fdefault\nsetup\vnotify\bvim\16theme.icons\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
    config = { "\27LJ\2\n˛\1\0\1\b\0\r\0!6\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\0029\2\3\1\14\0\2\0X\3\1Ä9\2\4\0019\3\5\1\v\3\0\0X\3\2Ä+\3\1\0X\4\1Ä+\3\2\0\15\0\3\0X\4\2Ä\f\4\2\0X\4\6Ä6\4\6\0009\4\a\0049\4\b\4\18\6\2\0'\a\t\0B\4\3\0026\5\0\0'\a\n\0B\5\2\0028\5\0\0055\a\v\0=\4\f\aB\5\2\1K\0\1\0\bcwd\1\0\0\22telescope.builtin\a:h\16fnamemodify\afn\bvim\topen\18absolute_path\flink_to\23get_node_at_cursor\18nvim-tree.lib\frequire$\0\1\4\1\1\0\4-\1\0\0'\3\0\0B\1\2\1K\0\1\0\1¿\15find_files#\0\1\4\1\1\0\4-\1\0\0'\3\0\0B\1\2\1K\0\1\0\1¿\14live_grep—\16\1\0\f\0T\0n6\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0003\3\4\0006\4\0\0'\6\5\0B\4\2\0029\4\6\0045\6\a\0005\a\b\0=\a\t\0065\a\n\0=\a\v\0065\a\f\0005\b\15\0009\t\r\0009\t\14\t=\t\16\b9\t\r\0009\t\17\t=\t\18\b9\t\r\0009\t\19\t=\t\20\b9\t\r\0009\t\21\t=\t\22\b=\b\23\a=\a\r\0065\a\24\0004\b\0\0=\b\25\a=\a\26\0065\a\27\0004\b\0\0=\b\28\a=\a\29\0065\a\30\0=\a\31\0065\a \0005\b!\0004\t\b\0005\n#\0005\v\"\0=\v$\n>\n\1\t5\n%\0>\n\2\t5\n&\0>\n\3\t5\n'\0>\n\4\t5\n(\0=\2)\n>\n\5\t5\n*\0=\3)\n>\n\6\t5\n+\0>\n\a\t=\t,\b=\b-\a=\a.\0065\a1\0005\b/\0005\t0\0=\t\23\b=\b2\a5\b3\0005\t4\0=\t5\b5\t6\0005\n7\0=\n8\t5\n9\0=\n\31\t=\t:\b=\b\23\a=\a;\0065\a<\0005\b=\0=\b>\a4\b\0\0=\b?\a=\a@\0065\aA\0=\aB\0065\aC\0005\bD\0=\bE\a=\aF\0065\aG\0005\bH\0=\bI\a5\bJ\0005\tK\0005\nM\0005\vL\0=\vN\n5\vO\0=\vP\n=\n?\t=\tQ\b=\bR\a=\aS\6B\4\2\0012\0\0ÄK\0\1\0\factions\14open_file\18window_picker\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\venable\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\1\0\2\17quit_on_open\1\18resize_window\1\15change_dir\1\0\3\23restrict_above_cwd\1\vglobal\1\venable\2\1\0\1\25use_system_clipboard\2\blog\ntypes\1\0\6\16diagnostics\1\fprofile\1\bgit\1\vconfig\1\ball\1\15copy_paste\1\1\0\2\venable\1\rtruncate\1\ntrash\1\0\2\20require_confirm\2\bcmd\ntrash\ffilters\fexclude\vcustom\1\3\0\0\17node_modules\f\\.cache\1\0\1\rdotfiles\1\rrenderer\vglyphs\1\0\a\14untracked\b‚òÖ\fdeleted\bÔëò\vstaged\b‚úì\runstaged\b‚úó\runmerged\bÓúß\fignored\b‚óå\frenamed\b‚ûú\vfolder\1\0\b\fdefault\bÓóø\fsymlink\bÔíÇ\17arrow_closed\bÔë†\15arrow_open\bÔëº\nempty\bÔÑî\17symlink_open\bÔíÇ\topen\bÓóæ\15empty_open\bÔÑï\1\0\3\rbookmark\bÔö£\fsymlink\bÔíÅ\fdefault\bÔí•\tshow\1\0\4\vfolder\2\tfile\2\17folder_arrow\2\bgit\2\1\0\4\18git_placement\nafter\fpadding\6 \18symlink_arrow\n ‚ûõ \18webdev_colors\2\19indent_markers\1\0\3\16group_empty\1\25root_folder_modifier\a:t\18highlight_git\2\1\0\4\titem\b‚îÇ\vcorner\b‚îî\tnone\6 \tedge\b‚îÇ\1\0\1\venable\1\tview\rmappings\tlist\1\0\2\bkey\6?\vaction\16toggle_help\1\0\2\bkey\bgtg\vaction\24telescope_live_grep\14action_cb\1\0\2\bkey\bgtf\vaction\25telescope_find_files\1\0\2\bkey\6C\vaction\acd\1\0\2\bkey\6v\vaction\vvsplit\1\0\2\bkey\6h\vaction\15close_node\bkey\1\0\2\tmode\6n\vaction\tedit\1\4\0\0\6l\t<CR>\6o\1\0\1\16custom_only\1\1\0\6\nwidth\3\30\19relativenumber\1\vnumber\1\15signcolumn\byes\21hide_root_folder\1\tside\nright\bgit\1\0\3\ftimeout\3»\1\venable\2\vignore\1\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\2\nicons\nerror\nError\fwarning\tWarn\tinfo\tInfo\thint\1\0\0\tHint\16diagnostics\1\0\2\venable\2\17show_on_dirs\1\23hijack_directories\1\0\1\venable\1\23ignore_ft_on_setup\1\4\0\0\rstartify\14dashboard\nalpha\1\0\4\18disable_netrw\2\15update_cwd\2\25auto_reload_on_write\1\17hijack_netrw\2\nsetup\14nvim-tree\0\0\0\16theme.icons\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "autoclose.nvim", "vim-repeat", "nvim-surround" },
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0\14syntax on\17DoMatchParen\bcmd\bvimÌ\2\1\0\5\2\16\0&6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0005\2\4\0-\3\0\0B\0\3\2\15\0\0\0X\1\26Ä6\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\t\0009\0\n\0005\2\v\0005\3\r\0003\4\f\0=\4\14\3-\4\1\0=\4\15\3B\0\3\1K\0\1\0\1\0\0\0\vbuffer\rcallback\1\0\0\0\1\2\0\0\14BufDelete\24nvim_create_autocmd\bapi2setlocal nocursorline nolist bufhidden=unload\17syntax clear\15syntax off\17NoMatchParen\1\2\0\0\tjson\17tbl_contains#setlocal noswapfile noundofile\bcmd\bvim>\1\0\4\2\4\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0003\3\3\0B\0\3\1K\0\1\0\1¿\0¿\0\18nvim_buf_call\bapi\bvimä\3\1\2\n\0\16\00116\2\0\0009\2\1\0025\4\2\0\18\5\0\0B\2\3\2\15\0\2\0X\3\2Ä+\2\2\0002\0'Ä*\2\0\0006\3\3\0006\5\0\0009\5\4\0059\5\5\0056\6\0\0009\6\6\0069\6\a\6\18\b\1\0B\6\2\0A\3\1\3\15\0\3\0X\5\24Ä\15\0\4\0X\5\22Ä9\5\b\4\1\2\5\0X\5\19Ä6\5\3\0006\a\t\0'\b\n\0B\5\3\3\15\0\5\0X\a\2Ä9\a\v\6B\a\1\0016\a\0\0009\a\f\a3\t\r\0B\a\2\0016\a\0\0009\a\14\a5\t\15\0B\a\2\1+\a\2\0002\0\0ÄL\a\2\0002\0\0ÄK\0\1\0L\2\2\0\1\0\1\ttext@File larger than 1MB, turned off treesitter for this buffer\vnotify\0\rschedule\14pause_buf\15illuminate\frequire\tsize\22nvim_buf_get_name\bapi\ffs_stat\tloop\npcall\1\2\0\0\nlatex\17tbl_contains\bvimÄÄÄ\1Æ\b\1\0\n\0003\0R6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0JÄ6\2\1\0'\4\3\0B\2\2\0029\3\4\2B\3\1\0029\4\5\0015\6\a\0005\a\6\0=\a\b\0065\a\t\0=\a\n\0065\a\v\0003\b\f\0=\b\r\a=\a\14\0065\a\15\0004\b\0\0=\b\16\a=\a\17\0065\a\19\0005\b\18\0=\b\20\a5\b\21\0=\b\r\a=\a\22\0065\a\23\0004\b\a\0009\t\24\3>\t\1\b9\t\25\3>\t\2\b9\t\26\3>\t\3\b9\t\27\3>\t\4\b9\t\28\3>\t\5\b9\t\29\3>\t\6\b=\b\30\a5\b\31\0=\b\r\a=\a \0065\a!\0005\b\"\0005\t#\0=\t$\b=\b%\a=\a&\0065\a(\0005\b'\0=\b)\a5\b*\0=\b+\a=\a,\0065\a-\0005\b.\0=\b\16\a=\a/\6B\4\2\0016\4\0\0006\6\1\0'\a0\0B\4\3\3\14\0\4\0X\6\2Ä2\0\0ÄK\0\1\0009\6\5\0055\b1\0004\t\0\0=\t2\bB\6\2\1K\0\1\0K\0\1\0\rpatterns\1\0\3\rthrottle\2\14max_lines\3\0\venable\1\23treesitter-context\17textsubjects\1\0\2\6;\21textsubjects-big\6.\23textsubjects-smart\1\0\1\venable\1\16textobjects\vselect\1\0\1\venable\1\tswap\1\0\0\1\0\1\venable\1\26context_commentstring\vconfig\20javascriptreact\1\0\1\18style_element\r{/*%s*/}\1\0\a\tscss\r/* %s */\tjson\5\15typescript\n// %s\vsvelte\16<!-- %s -->\bvue\16<!-- %s -->\thtml\16<!-- %s -->\bcss\r/* %s */\1\0\1\venable\2\frainbow\1\2\0\0\thtml\vcolors\ngreen\tblue\tcyan\fmagenta\vyellow\nwhite\1\0\2\venable\2\18extended_mode\1\vindent\1\3\0\0\bcss\tyaml\venable\1\0\0\1\2\0\0\20javascriptreact\26incremental_selection\fkeymaps\1\0\1\venable\2\14highlight\fdisable\0\1\0\2\venable\2&additional_vim_regex_highlighting\2\19ignore_install\1\2\0\0\5\21ensure_installed\1\0\1\17sync_install\1\1\2\0\0\blua\nsetup\15get_colors\15onedarkpro\28nvim-treesitter.configs\frequire\npcall\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedarkpro.nvim"] = {
    after = { "nvim-treesitter", "lualine.nvim" },
    config = { "\27LJ\2\n«\b\0\0\n\0.\0S6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0029\2\3\0005\4\4\0006\5\5\0009\5\6\0059\5\a\0056\a\5\0009\a\6\a9\a\b\a'\t\t\0B\a\2\2'\b\n\0&\a\b\aB\5\2\2=\5\v\0044\5\0\0=\5\f\0045\5\15\0005\6\14\0009\a\r\1=\a\r\6=\6\16\0055\6\18\0009\a\17\1=\a\r\6=\6\19\0055\6\20\0009\a\17\1=\a\r\6=\6\21\0055\6\22\0009\a\17\1=\a\r\6=\6\23\0055\6\24\0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6\26\0055\6\27\0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6\28\0055\6\30\0009\a\29\1=\a\25\0069\a\17\1=\a\r\6=\6\31\0055\6 \0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6!\0055\6\"\0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6#\5=\5$\0045\5%\0=\5&\0044\5\0\0=\5'\0045\5(\0=\5)\0045\5*\0=\5+\4B\2\2\0016\2\5\0009\2,\2'\4-\0B\2\2\1K\0\1\0\30colorscheme onedark_vivid\bcmd\foptions\1\0\b\17transparency\2\27window_unfocused_color\1\20terminal_colors\2\14underline\2\14undercurl\2\vitalic\2\tbold\2\15cursorline\1\vstyles\1\0\v\14operators\tNONE\17conditionals\tNONE\17virtual_text\tNONE\14variables\tNONE\fstrings\tNONE\14constants\tNONE\rcomments\tNONE\ntypes\tNONE\fnumbers\tNONE\rkeywords\tNONE\14functions\tNONE\fplugins\14filetypes\1\0\f\20typescriptreact\2\15typescript\2\blua\2\15javascript\2\bphp\2\vpython\2\truby\2\trust\2\tyaml\2\rmarkdown\2\bvue\2\ttoml\2\15highlights\20TelescopeBorder\1\0\0\20TelescopeNormal\1\0\0\22BarbecueSeparator\1\0\0\nwhite\16FloatBorder\1\0\0\16NormalFloat\afg\1\0\0\26NoiceLspProgressTitle\1\0\0\28NoiceLspProgressSpinner\1\0\0\27NoiceLspProgressClient\1\0\0\tnone\18WhichKeyFloat\1\0\0\1\0\0\abg\vcolors\15cache_path\17/onedarkpro/\ncache\fstdpath\vexpand\afn\bvim\1\0\1\fcaching\1\nsetup\15get_colors\15onedarkpro\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["smart-splits.nvim"] = {
    commands = { "SmartCursorMoveLeft", "SmartCursorMoveRight", "SmartCursorMoveUp", "SmartCursorMoveDown", "SmartResizeLeft", "SmartResizeRight", "SmartResizeUp", "SmartResizeDown", "SmartResizeMode" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-smart-history.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-smart-history.nvim",
    url = "https://github.com/nvim-telescope/telescope-smart-history.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n˝\1\0\0\f\0\b\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\3\0006\3\4\0\18\5\2\0B\3\2\4X\6\4Ä6\b\5\0009\n\6\0\18\v\a\0B\b\3\1E\6\3\3R\6˙\1279\3\a\0\18\5\1\0B\3\2\1K\0\1\0\nsetup\19load_extension\npcall\vipairs\1\t\0\0\vnotify\14ui-select\rfrecency\18smart_history\15fzy_native\nnoice\17file_browser\15cheatsheet\29plugins.telescope.config\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    commands = { "ToggleTerm" },
    config = { "\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\n\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3\20\0\1\2\0\1\0\0029\1\0\0L\1\2\0\tnameÜ\3\1\0\5\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\b\0005\4\a\0=\4\t\3=\3\n\0025\3\v\0005\4\f\0=\4\n\3=\3\r\0025\3\14\0003\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\vwinbar\19name_formatter\0\1\0\1\fenabled\1\15float_opts\1\0\2\vborder\fSpecial\15background\vNormal\1\0\2\vborder\vcurved\rwinblend\3\0\15highlights\vNormal\1\0\0\1\0\1\nguibg\abg\20shade_filetypes\tsize\1\0\6\17hide_numbers\2\17persist_size\2\20shade_terminals\2\20start_in_insert\2\14direction\15horizontal\18close_on_exit\2\0\nsetup\15toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-repeat"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nî\b\0\0\a\0.\00056\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\t\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\5=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\17\0009\6\15\0019\6\16\6=\6\18\0059\6\15\0019\6\19\6=\6\20\0059\6\15\0019\6\21\6=\6\22\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0005\6\27\0=\6\28\0055\6\29\0=\6\30\5=\5\31\0045\5!\0005\6 \0=\6\"\0055\6#\0=\6$\5=\5%\0045\5&\0=\5'\0045\5)\0005\6(\0=\6*\0055\6+\0=\6,\5=\5-\4B\2\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\nalign\tleft\fspacing\3\n\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\rwinblend\3\0\vborder\frounded\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\nicons\ngroup\tPlus\14separator\22ChevronShortRight\15breadcrumb\1\0\0\rEllipsis\aui\15key_labels\1\0\3\n<tab>\bTAB\f<space>\bSPC\t<cr>\bRET\14operators\1\0\v\agU\14Uppercase\ag~\16Toggle case\t<lt>\16Indent left\agc\rComments\azf\16Create fold\6!#Filter though external program\6d\vDelete\6c\vChange\agu\14Lowercase\6y\16Yank (copy)\6>\17Indent right\fplugins\1\0\4\rtriggers\tauto\14show_keys\1\14show_help\1\19ignore_missing\1\rspelling\1\0\2\16suggestions\3\20\fenabled\2\fpresets\1\0\a\14operators\2\fmotions\2\17text_objects\2\fwindows\2\bnav\2\6z\2\6g\2\1\0\2\14registers\2\nmarks\2\nsetup\16theme.icons\14which-key\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\27automatic_installation\2\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n˘\6\0\0\v\0$\00036\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0016\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\n\0\18\6\2\0006\b\6\0009\b\a\b9\b\b\b'\n\t\0B\b\2\2'\t\4\0B\6\3\2=\6\v\0055\6\f\0004\a\0\0=\a\r\6=\6\14\0056\6\6\0009\6\15\0069\6\16\0069\6\17\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0055\6\23\0005\a\26\0009\b\24\0009\b\25\b=\b\27\a9\b\24\0009\b\28\b=\b\29\a9\b\24\0009\b\30\b=\b\31\a=\a \0065\a!\0=\a\"\6=\6#\5B\3\2\1K\0\1\0\aui\fkeymaps\1\0\t\24update_all_packages\6U\28check_outdated_packages\6C\22uninstall_package\6X\24cancel_installation\n<C-c>\26apply_language_filter\n<C-f>\26toggle_package_expand\t<CR>\20install_package\6i\19update_package\6u\26check_package_version\6c\nicons\24package_uninstalled\fRemoved\20package_pending\fWorking\22package_installed\1\0\0\fSuccess\14installer\1\0\2\vborder\tnone$check_outdated_packages_on_open\2\14providers\1\2\0\0!mason.providers.registry-api\vgithub\1\0\1\26download_url_template2https://github.com/%s/releases/download/%s/%s\14log_level\tINFO\vlevels\blog\bpip\17install_args\1\0\1\16upgrade_pip\1\21install_root_dir\1\0\2\tPATH\fprepend\30max_concurrent_installers\3\4\tdata\fstdpath\afn\bvim\nsetup\nmason\rjoinpath\rutils.fn\16theme.icons\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n \n\0\0\t\0001\0P6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\5\0=\5\6\0044\5\5\0009\6\a\0019\6\b\6'\a\t\0&\6\a\6>\6\1\0059\6\a\0019\6\n\6'\a\t\0&\6\a\6>\6\2\0059\6\a\0019\6\v\6'\a\t\0&\6\a\6>\6\3\0059\6\a\0019\6\f\6'\a\t\0&\6\a\6>\6\4\5=\5\r\0049\5\a\0019\5\14\5=\5\15\0045\5\16\0=\5\17\0045\5\20\0009\6\18\0019\6\19\6=\6\21\0059\6\18\0019\6\22\6=\6\23\0059\6\18\0019\6\24\6=\6\25\5=\5\26\0045\5\28\0005\6\27\0=\6\29\0055\6\30\0=\6\31\5=\5 \0045\5!\0=\5\"\0045\5#\0=\5$\0045\5%\0'\6\t\0009\a\18\0019\a&\a'\b\t\0&\6\b\6=\6'\5=\5(\0045\5)\0009\6\18\0019\6*\6=\6+\0059\6\18\0019\6,\6=\6-\5=\5.\0044\5\0\0=\5/\0044\5\0\0=\0050\4B\2\2\1K\0\1\0\24server_filetype_map\16custom_kind\17show_outline\rjump_key\21SmallEmptyCircle\14virt_text\19BoldLineMiddle\1\0\5\15auto_enter\2\17auto_preview\2\17auto_refresh\2\17win_position\nright\14win_width\3\30\21symbol_in_winbar\14separator\22ChevronShortRight\1\0\5\19file_formatter\5\18click_support\1\14in_custom\1\14show_file\2\venable\2\27definition_action_keys\1\0\5\tquit\6q\nsplit\v<C-c>i\tedit\v<C-c>o\vvsplit\v<C-c>v\ttabe\v<C-c>t\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\tquit\1\3\0\0\6q\n<ESC>\topen\1\0\3\vvsplit\6s\nsplit\6i\ttabe\6t\1\3\0\0\6o\t<CR>\17finder_icons\tlink\tLink\bref\fForward\bdef\1\0\0\20MagnifyingGlass\aui\26code_action_lightbulb\1\0\a\18sign_priority\3\20\16update_time\3ñ\1\17virtual_text\2\venable\2\tsign\2\21enable_in_insert\2\22cache_code_action\2\21code_action_icon\rBoldHint\22diagnostic_header\17AltLightning\20BoldInformation\16BoldWarning\6 \14BoldError\16diagnostics\17move_in_saga\1\0\2\tprev\n<C-p>\tnext\n<C-n>\1\0\b\23rename_action_quit\n<C-c>\21rename_in_select\2\17border_style\frounded\18saga_winblend\3\0\24preview_lines_above\3\0\22max_preview_lines\3\n\29code_action_num_shortcut\2\27finder_request_timeout\3‹\v\18init_lsp_saga\16theme.icons\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\nì\17\0\0\a\0T\0s6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0044\5\0\0=\5\16\4=\4\17\3=\3\a\0025\3\19\0=\3\20\0025\3\21\0=\3\22\0025\3\23\0=\3\24\0025\3\25\0=\3\26\0024\3\3\0005\4\28\0005\5\27\0=\5\v\4>\4\1\3=\3\29\0025\3#\0005\4\31\0005\5\30\0=\5 \0045\5!\0=\5\"\4=\4$\0035\4%\0005\5&\0=\5 \0045\5'\0=\5(\0045\5)\0005\6*\0=\6+\5=\5,\4=\4-\0035\4.\0005\5/\0=\5 \0045\0050\0=\5\"\0045\0051\0005\0062\0=\0063\5=\5(\0045\0055\0005\0064\0=\6+\5=\5,\4=\4\22\0035\0046\0005\0057\0=\5\17\0045\0058\0=\5 \0045\0059\0005\6:\0=\0063\0055\6;\0=\6<\5=\5(\0045\5>\0005\6=\0=\6+\5=\5,\4=\4?\3=\3@\0025\3B\0005\4A\0=\4C\0035\4D\0=\4E\0035\4F\0004\5\0\0=\5\4\4=\4G\0035\4H\0005\5I\0=\5J\0044\5\0\0=\5\4\4=\4K\0035\4L\0004\5\0\0=\5\4\4=\4M\0035\4N\0005\5O\0005\6P\0=\6\17\0055\6Q\0=\6,\5=\5\4\4=\4R\3=\3S\2B\0\2\1K\0\1\0\blsp\18documentation\1\0\2\18concealcursor\6n\17conceallevel\3\3\1\2\0\0\14{message}\1\0\3\tlang\rmarkdown\freplace\2\vrender\nplain\1\0\1\tview\nhover\fmessage\1\0\2\fenabled\2\tview\vnotify\14signature\14auto_open\1\0\4\fluasnip\2\fenabled\2\rthrottle\0032\ftrigger\2\1\0\1\fenabled\2\nhover\1\0\1\fenabled\2\roverride\1\0\3\"vim.lsp.util.stylize_markdown\1 cmp.entry.get_documentation\0011vim.lsp.util.convert_input_to_markdown_lines\1\rprogress\1\0\0\1\0\5\fenabled\2\vformat\17lsp_progress\rthrottle\4´’™’\n™’ÇÇ\4\16format_done\22lsp_progress_done\tview\tmini\nviews\fconfirm\1\0\0\1\0\2\vNormal\17NoiceConfirm\16FloatBorder\23NoiceConfirmBorder\ttext\1\0\1\btop\14 Confirm \1\3\0\0\3\0\3\1\1\0\1\nstyle\frounded\1\0\2\bcol\b50%\brow\b50%\1\2\0\0\r{config}\1\0\a\nenter\1\14focusable\1\fbackend\npopup\tsize\tauto\vzindex\3P\nalign\vcenter\rrelative\veditor\1\0\0\1\0\2\vNormal\vNormal\16FloatBorder\19DiagnosticInfo\fpadding\1\3\0\0\3\0\3\1\1\0\1\nstyle\frounded\1\0\2\nwidth\3<\vheight\3\n\1\0\2\bcol\b50%\brow\3\b\1\0\1\rrelative\veditor\tmini\16win_options\17winhighlight\1\0\3\vSearch\5\14IncSearch\5\vNormal\14NoiceMini\1\0\1\rwinblend\3\30\vborder\1\0\1\nstyle\tnone\1\0\2\bcol\t100%\brow\3\1\1\0\a\14focusable\1\freverse\2\ftimeout\3–\15\tsize\tauto\vzindex\3\20\nalign\18message-right\rrelative\veditor\18cmdline_popup\1\0\0\tsize\1\0\2\nwidth\3<\vheight\tauto\rposition\1\0\1\vzindex\3d\1\0\2\bcol\b50%\brow\3\5\vroutes\1\0\1\tview\nsplit\1\0\2\nevent\vnotify\15min_height\3\15\fpresets\1\0\5\18bottom_search\2\20command_palette\2\26long_message_to_split\2\15inc_rename\2\19lsp_doc_border\2\vnotify\1\0\1\fenabled\2\14popupmenu\1\0\1\fenabled\2\rmessages\1\0\6\fenabled\2\16view_search\16virtualtext\15view_error\vnotify\tview\vnotify\14view_warn\vnotify\17view_history\rmessages\1\0\0\vformat\ninput\thelp\1\0\2\fpattern\20^:%s*he?l?p?%s+\ticon\bÔüï\blua\1\0\3\tlang\blua\ticon\bÓò†\fpattern\16^:%s*lua%s+\vfilter\1\0\3\tlang\tbash\ticon\6$\fpattern\v^:%s*!\16search_down\1\0\4\tlang\nregex\ticon\tÔÄÇ \tkind\vsearch\fpattern\a^/\fcmdline\1\0\0\1\0\3\tlang\bvim\ticon\bÔÅî\fpattern\a^:\topts\1\0\2\fenabled\2\tview\18cmdline_popup\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n»\2\0\0\6\0\19\0\0316\0\0\0'\2\1\0B\0\2\0026\1\2\0006\2\0\0'\4\3\0B\2\2\2=\2\3\0016\1\2\0009\1\3\0019\1\4\0015\3\5\0005\4\b\0009\5\6\0009\5\a\5=\5\t\0049\5\6\0009\5\n\5=\5\v\0049\5\6\0009\5\f\5=\5\r\0049\5\6\0009\5\14\5=\5\15\0049\5\6\0009\5\16\5=\5\17\4=\4\18\3B\1\2\1K\0\1\0\nicons\nTRACE\nTrace\nDEBUG\nDebug\tINFO\tInfo\tWARN\tWarn\nERROR\1\0\0\nError\16diagnostics\1\0\5\vstages\nslide\22background_colour\vNormal\18minimum_width\0032\ftimeout\3Ë\a\vrender\fdefault\nsetup\vnotify\bvim\16theme.icons\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: onedarkpro.nvim
time([[Config for onedarkpro.nvim]], true)
try_loadstring("\27LJ\2\n«\b\0\0\n\0.\0S6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0029\2\3\0005\4\4\0006\5\5\0009\5\6\0059\5\a\0056\a\5\0009\a\6\a9\a\b\a'\t\t\0B\a\2\2'\b\n\0&\a\b\aB\5\2\2=\5\v\0044\5\0\0=\5\f\0045\5\15\0005\6\14\0009\a\r\1=\a\r\6=\6\16\0055\6\18\0009\a\17\1=\a\r\6=\6\19\0055\6\20\0009\a\17\1=\a\r\6=\6\21\0055\6\22\0009\a\17\1=\a\r\6=\6\23\0055\6\24\0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6\26\0055\6\27\0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6\28\0055\6\30\0009\a\29\1=\a\25\0069\a\17\1=\a\r\6=\6\31\0055\6 \0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6!\0055\6\"\0009\a\r\1=\a\r\0069\a\25\1=\a\25\6=\6#\5=\5$\0045\5%\0=\5&\0044\5\0\0=\5'\0045\5(\0=\5)\0045\5*\0=\5+\4B\2\2\0016\2\5\0009\2,\2'\4-\0B\2\2\1K\0\1\0\30colorscheme onedark_vivid\bcmd\foptions\1\0\b\17transparency\2\27window_unfocused_color\1\20terminal_colors\2\14underline\2\14undercurl\2\vitalic\2\tbold\2\15cursorline\1\vstyles\1\0\v\14operators\tNONE\17conditionals\tNONE\17virtual_text\tNONE\14variables\tNONE\fstrings\tNONE\14constants\tNONE\rcomments\tNONE\ntypes\tNONE\fnumbers\tNONE\rkeywords\tNONE\14functions\tNONE\fplugins\14filetypes\1\0\f\20typescriptreact\2\15typescript\2\blua\2\15javascript\2\bphp\2\vpython\2\truby\2\trust\2\tyaml\2\rmarkdown\2\bvue\2\ttoml\2\15highlights\20TelescopeBorder\1\0\0\20TelescopeNormal\1\0\0\22BarbecueSeparator\1\0\0\nwhite\16FloatBorder\1\0\0\16NormalFloat\afg\1\0\0\26NoiceLspProgressTitle\1\0\0\28NoiceLspProgressSpinner\1\0\0\27NoiceLspProgressClient\1\0\0\tnone\18WhichKeyFloat\1\0\0\1\0\0\abg\vcolors\15cache_path\17/onedarkpro/\ncache\fstdpath\vexpand\afn\bvim\1\0\1\fcaching\1\nsetup\15get_colors\15onedarkpro\frequire\0", "config", "onedarkpro.nvim")
time([[Config for onedarkpro.nvim]], false)
-- Config for: FixCursorHold.nvim
time([[Config for FixCursorHold.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0", "config", "FixCursorHold.nvim")
time([[Config for FixCursorHold.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nˇ\2\0\0\a\0\16\0\28+\0\0\0006\1\0\0006\3\1\0'\4\2\0B\1\3\3\15\0\1\0X\3\5Ä\15\0\2\0X\3\3Ä9\3\3\2B\3\1\2\18\0\3\0006\3\1\0'\5\4\0B\3\2\0029\3\5\0035\5\6\0005\6\a\0=\6\b\0055\6\t\0=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\5=\0\15\5B\3\2\1K\0\1\0\rpre_hook\nextra\1\0\3\nbelow\bgco\beol\bgcA\nabove\bgcO\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\rmappings\1\0\2\nbasic\2\nextra\2\1\0\4\vactive\2\vsticky\2\fpadding\2\vignore\a^$\nsetup\fComment\20create_pre_hook7ts_context_commentstring.integrations.comment_nvim\frequire\npcall\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\nü\a\0\0\a\0*\0f6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\17\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\n\0005\6\t\0=\6\v\0054\6\0\0=\6\f\5=\5\r\0044\5\0\0=\5\14\0045\5\15\0=\5\16\4=\4\18\0035\4\20\0004\5\3\0009\6\19\0>\6\1\5=\5\21\0044\5\3\0009\6\22\0>\6\1\5=\5\23\0044\5\3\0009\6\24\0>\6\1\0059\6\25\0>\6\2\5=\5\26\0044\5\5\0009\6\27\0>\6\1\0059\6\28\0>\6\2\0059\6\29\0>\6\3\0059\6\30\0>\6\4\5=\5\31\0044\5\3\0009\6 \0>\6\1\5=\5!\0044\5\3\0009\6\"\0>\6\1\5=\5#\4=\4$\0035\4%\0004\5\3\0009\6\19\0>\6\1\5=\5\21\0044\5\3\0009\6\22\0>\6\1\5=\5\23\0044\5\3\0009\6\24\0>\6\1\0059\6\25\0>\6\2\5=\5\26\0044\5\5\0009\6\27\0>\6\1\0059\6\28\0>\6\2\0059\6\29\0>\6\3\0059\6\30\0>\6\4\5=\5\31\0044\5\3\0009\6 \0>\6\1\5=\5!\0044\5\3\0009\6\"\0>\6\1\5=\5#\4=\4&\0034\4\0\0=\4'\0034\4\0\0=\4\f\0034\4\0\0=\4(\0034\4\0\0=\4)\3B\1\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\0\0\rsections\14lualine_z\rprogress\14lualine_y\rlocation\14lualine_x\rfiletype\vspaces\blsp\16diagnostics\14lualine_c\15python_env\tdiff\14lualine_b\vbranch\14lualine_a\1\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\15statusline\3Ë\a\vwinbar\3Ë\a\ftabline\3Ë\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\1\2\0\0\nalpha\23section_separators\1\0\2\tleft\5\nright\5\25component_separators\1\0\2\tleft\5\nright\5\1\0\4\ntheme\tauto\17globalstatus\2\25always_divide_middle\2\18icons_enabled\2\nsetup\flualine\31plugins.lualine.components\frequire\0", "config", "lualine.nvim")

vim.cmd [[ packadd sqlite.lua ]]
vim.cmd [[ packadd telescope-frecency.nvim ]]
vim.cmd [[ packadd telescope-smart-history.nvim ]]
vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n˝\1\0\0\f\0\b\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\3\0006\3\4\0\18\5\2\0B\3\2\4X\6\4Ä6\b\5\0009\n\6\0\18\v\a\0B\b\3\1E\6\3\3R\6˙\1279\3\a\0\18\5\1\0B\3\2\1K\0\1\0\nsetup\19load_extension\npcall\vipairs\1\t\0\0\vnotify\14ui-select\rfrecency\18smart_history\15fzy_native\nnoice\17file_browser\15cheatsheet\29plugins.telescope.config\14telescope\frequire\0", "config", "telescope.nvim")

vim.cmd [[ packadd alpha-nvim ]]

-- Config for: alpha-nvim
try_loadstring("\27LJ\2\nÉ\1\0\0\a\2\a\0\15-\0\0\0009\0\0\0B\0\1\2'\1\1\0\18\3\1\0009\1\2\0019\4\3\0009\5\4\0-\6\1\0009\6\5\0069\6\6\6B\1\5\0024\2\3\0>\1\1\2L\2\2\0\3¿\4¿\fPackage\aui\ntotal\nstart\vformat\21Loaded %s/%s %s \17plugin_countö\a\1\0\r\0000\1p6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0hÄ6\2\1\0'\4\3\0B\2\2\0026\3\1\0'\5\4\0B\3\2\0026\4\1\0'\6\5\0B\4\2\0026\5\1\0'\a\6\0B\5\2\0029\6\a\0059\6\b\0069\a\n\2=\a\t\0069\6\a\0059\6\v\0064\a\a\0009\b\f\5'\n\r\0009\v\14\0049\v\15\v'\f\16\0&\v\f\v'\f\17\0B\b\4\2>\b\1\a9\b\f\5'\n\18\0009\v\14\0049\v\15\v'\f\19\0&\v\f\v'\f\20\0B\b\4\2>\b\2\a9\b\f\5'\n\21\0009\v\22\0049\v\23\v'\f\24\0&\v\f\v'\f\25\0B\b\4\2>\b\3\a9\b\f\5'\n\26\0009\v\14\0049\v\27\v'\f\28\0&\v\f\v'\f\29\0B\b\4\2>\b\4\a9\b\f\5'\n\30\0009\v\14\0049\v\31\v'\f \0&\v\f\v'\f!\0B\b\4\2>\b\5\a9\b\f\5'\n\"\0009\v#\0049\v$\v'\f%\0&\v\f\v'\f&\0B\b\4\0?\b\0\0=\a\t\0063\6'\0009\a\a\0059\a(\a\18\b\6\0B\b\1\2=\b\t\a9\a\a\0059\a(\a9\a)\a'\b+\0=\b*\a9\a\a\0059\a\b\a9\a)\a'\b,\0=\b*\a9\a\a\0059\a\v\a9\a)\a'\b-\0=\b*\a9\a)\0059\a)\a+\b\2\0=\b.\a9\a/\0019\t)\5B\a\2\0012\0\0ÄK\0\1\0K\0\1\0\nsetup\14noautocmd\fKeyword\14Directory\tType\ahl\topts\vfooter\0\f:qa<CR>\v  Quit\nError\16diagnostics\6q :e $MYVIMRC | :cd %:p:h<cr>\r  Config\tGear\6c\23:PackerCompile<CR>\21  Packer Compile\vTarget\6C\20:PackerSync<CR>\18  Packer Sync\fWorking\14installer\6S :Telescope file_browser<CR>\19  File Browser\6f\28:Telescope frecency<CR>\19  Recent files\14Telescope\aui\6r\vbutton\fbuttons\15lighthouse\bval\vheader\fsection\27alpha.themes.dashboard\16theme.icons\15utils.pack\26plugins.alpha.banners\nalpha\frequire\npcall\rÄÄ¿ô\4\0", "config", "alpha-nvim")

vim.cmd [[ packadd which-key.nvim ]]

-- Config for: which-key.nvim
try_loadstring("\27LJ\2\nî\b\0\0\a\0.\00056\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\t\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\5=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\0045\5\17\0009\6\15\0019\6\16\6=\6\18\0059\6\15\0019\6\19\6=\6\20\0059\6\15\0019\6\21\6=\6\22\5=\5\23\0045\5\24\0=\5\25\0045\5\26\0005\6\27\0=\6\28\0055\6\29\0=\6\30\5=\5\31\0045\5!\0005\6 \0=\6\"\0055\6#\0=\6$\5=\5%\0045\5&\0=\5'\0045\5)\0005\6(\0=\6*\0055\6+\0=\6,\5=\5-\4B\2\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\nalign\tleft\fspacing\3\n\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rposition\vbottom\rwinblend\3\0\vborder\frounded\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\nicons\ngroup\tPlus\14separator\22ChevronShortRight\15breadcrumb\1\0\0\rEllipsis\aui\15key_labels\1\0\3\n<tab>\bTAB\f<space>\bSPC\t<cr>\bRET\14operators\1\0\v\agU\14Uppercase\ag~\16Toggle case\t<lt>\16Indent left\agc\rComments\azf\16Create fold\6!#Filter though external program\6d\vDelete\6c\vChange\agu\14Lowercase\6y\16Yank (copy)\6>\17Indent right\fplugins\1\0\4\rtriggers\tauto\14show_keys\1\14show_help\1\19ignore_missing\1\rspelling\1\0\2\16suggestions\3\20\fenabled\2\fpresets\1\0\a\14operators\2\fmotions\2\17text_objects\2\fwindows\2\bnav\2\6z\2\6g\2\1\0\2\14registers\2\nmarks\2\nsetup\16theme.icons\14which-key\frequire\0", "config", "which-key.nvim")

vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
try_loadstring("\27LJ\2\n?\0\2\3\0\3\0\n6\2\0\0009\2\1\0028\2\0\0029\2\2\2\4\2\1\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\rfiletype\abo\bvim¢\2\0\4\17\1\14\00004\4\0\0005\5\2\0-\6\0\0009\6\0\0069\6\1\6=\6\3\5-\6\0\0009\6\0\0069\6\4\6=\6\5\5-\6\0\0009\6\0\0069\6\6\6=\6\a\0056\6\b\0\18\b\2\0B\6\2\4H\t\14Ä8\v\t\5\15\0\v\0X\f\vÄ)\v\0\0\1\v\n\0X\v\bÄ6\v\t\0009\v\n\v\18\r\4\0008\14\t\5'\15\v\0\18\16\n\0&\14\16\14B\v\3\1F\t\3\3R\t\1276\6\t\0009\6\f\6\18\b\4\0'\t\v\0B\6\3\2\18\4\6\0\21\6\4\0)\a\0\0\1\a\6\0X\6\2Ä\f\6\4\0X\6\1Ä'\6\r\0L\6\2\0\0¿\5\vconcat\6 \vinsert\ntable\npairs\tinfo\16Information\fwarning\fWarning\nerror\1\0\0\nError\16diagnostics\29\0\1\5\1\1\0\4-\1\0\0\18\3\0\0'\4\0\0D\1\3\0\0\0\blogı\1\1\2\t\1\b\1/6\2\0\0009\2\1\0023\4\2\0\f\5\1\0X\5\1Ä4\5\0\0B\2\3\0026\3\0\0009\3\3\3\18\5\2\0B\3\2\2\15\0\3\0X\4\3Ä+\3\2\0002\0\0ÄL\3\2\0006\3\0\0009\3\4\0039\3\5\3B\3\1\0026\4\0\0009\4\4\0049\4\5\4'\6\6\0B\4\2\2-\5\0\0\18\a\0\0'\b\a\0B\5\3\2\t\4\0\0X\6\3Ä+\6\2\0002\0\0ÄL\6\2\0\5\3\4\0X\6\2Ä\f\6\5\0X\6\aÄ\4\3\4\0X\6\2Ä\19\6\5\0X\a\3Ä+\6\1\0X\a\1Ä+\6\2\0002\0\0ÄL\6\2\0\2¿\blog\6$\14tabpagenr\afn\16tbl_isempty\0\15tbl_filter\bvim\2+\0\1\6\0\2\0\0066\1\0\0'\3\1\0\18\4\0\0+\5\1\0B\1\4\1K\0\1\0\abd\rbuf_killg\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameˇ\r\1\0\v\0?\0e6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0003\3\4\0003\4\5\0006\5\0\0'\a\6\0B\5\2\0029\5\a\0055\a(\0005\b\b\0003\t\t\0=\t\n\b5\t\r\0009\n\v\0009\n\f\n=\n\14\t=\t\15\b9\t\v\0009\t\16\t=\t\17\b9\t\v\0009\t\18\t=\t\19\b9\t\v\0009\t\20\t=\t\21\b9\t\v\0009\t\22\t=\t\23\b9\t\v\0009\t\24\t=\t\25\b3\t\26\0=\t\27\b=\3\28\b=\4\29\b4\t\6\0005\n\30\0>\n\1\t5\n\31\0>\n\2\t5\n \0>\n\3\t5\n!\0>\n\4\t5\n\"\0>\n\5\t=\t#\b5\t$\0005\n%\0=\n&\t=\t'\b=\b)\a5\b.\0005\t+\0009\n*\1=\n,\t9\n*\1=\n-\t=\t/\b5\t0\0009\n,\1=\n,\t9\n-\1=\n-\t=\t1\b5\t3\0009\n2\1=\n,\t9\n-\1=\n-\t=\t4\b5\t6\0009\n5\1=\n,\t9\n-\1=\n-\t=\t7\b5\t8\0009\n*\1=\n,\t=\t9\b5\t:\0009\n*\1=\n,\t=\t;\b5\t<\0009\n*\1=\n,\t9\n-\1=\n-\t=\t=\b=\b>\aB\5\2\0012\0\0ÄK\0\1\0\15highlights\14separator\1\0\0\22separator_visible\1\0\0\23separator_selected\1\0\0\20buffer_selected\1\0\2\vitalic\2\tbold\2\tblue\19buffer_visible\1\0\0\nwhite\15background\1\0\0\tfill\1\0\0\abg\afg\1\0\0\18bg_statusline\foptions\1\0\0\nhover\vreveal\1\2\0\0\nclose\1\0\2\ndelay\3»\1\fenabled\1\foffsets\1\0\4\fpadding\3\1\ttext\vPacker\14highlight\17PanelHeading\rfiletype\vpacker\1\0\3\rfiletype\24flutterToolsOutline\ttext\20Flutter Outline\14highlight\17PanelHeading\1\0\4\fpadding\3\1\ttext\14Diff View\14highlight\17PanelHeading\rfiletype\18DiffviewFiles\1\0\4\fpadding\3\1\ttext\rExplorer\14highlight\17PanelHeading\rfiletype\rNvimTree\1\0\4\fpadding\3\1\ttext\rUndotree\14highlight\17PanelHeading\rfiletype\rundotree\18custom_filter\26diagnostics_indicator\19name_formatter\0\23right_trunc_marker\21ArrowCircleRight\22left_trunc_marker\20ArrowCircleLeft\15close_icon\14BoldClose\18modified_icon\16SmallCircle\22buffer_close_icon\nClose\14indicator\ticon\1\0\1\nstyle\ticon\17BoldLineLeft\aui\18close_command\0\1\0\23\20show_close_icon\1\24show_tab_indicators\1\26show_duplicate_prefix\2\24persist_buffer_sort\2\rtab_size\3\18\20separator_style\nslant\16diagnostics\rnvim_lsp\27always_show_bufferline\2\fsort_by\aid\fnumbers\tnone\24right_mouse_command\20vert sbuffer %d\23left_mouse_command\14buffer %d\25middle_mouse_command\16bdelete! %d\25enforce_regular_tabs\1\20max_name_length\3\18\22max_prefix_length\3\15\19truncate_names\2\tmode\fbuffers!diagnostics_update_in_insert\1\16color_icons\2\22show_buffer_icons\2\28show_buffer_close_icons\1\29show_buffer_default_icon\2\nsetup\15bufferline\0\0\0\17theme.colors\16theme.icons\frequire\0", "config", "bufferline.nvim")

vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\nﬂ\2\0\2\a\1\a\0\15'\2\1\0\18\4\2\0009\2\2\2-\5\0\0009\5\0\0059\6\0\0018\5\6\5B\2\3\2=\2\0\0015\2\4\0009\3\5\0009\3\6\0038\2\3\2=\2\3\1L\1\2\0\1¿\tname\vsource\1\0\14\nemoji\f(Emoji)\16cmp_tabnine\14(Tabnine)\nvsnip\14(Snippet)\vneodev\r(Neodev)\rnvim_lsp\n(LSP)\ttmux\v(TMUX)\fluasnip\14(Snippet)\15treesitter\17(TreeSitter)\rnvim_lua\v(Nvim)\tcalc\v(Calc)\vbuffer\r(Buffer)\fcopilot\14(Copilot)\28nvim_lsp_signature_help\16(Signature)\tpath\v(Path)\tmenu\vformat\a%s\tkindC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireâ\1\0\1\5\1\6\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\fvisibleè\2\0\1\4\3\a\0(-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\30Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\21Ä-\1\2\0009\1\4\1)\3\1\0B\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\5\1)\3\1\0B\1\2\1X\1\nÄ-\1\2\0009\1\6\1B\1\1\2\15\0\1\0X\2\3Ä\18\1\0\0B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\3¿\0¿\21has_words_before\tjump\rjumpable\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\3¿\tjump\rjumpable\21select_prev_item\fvisibleh\0\0\5\0\6\0\0166\0\0\0009\0\1\0009\0\2\0B\0\1\0029\0\3\0\18\2\0\0009\0\4\0)\3\1\0)\4\1\0B\0\4\2\6\0\5\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\6i\bsub\tmode\18nvim_get_mode\bapi\bvim≈\1\1\1\6\1\b\0\30-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\22Ä5\1\1\0-\2\0\0009\2\2\0029\2\3\2=\2\4\0013\2\5\0\18\3\2\0B\3\1\2\15\0\3\0X\4\4Ä-\3\0\0009\3\2\0039\3\6\3=\3\4\1-\3\0\0009\3\a\3\18\5\1\0B\3\2\2\15\0\3\0X\4\2Ä2\0\0ÄK\0\1\0\18\1\0\0B\1\1\1K\0\1\0\2¿\fconfirm\vInsert\0\rbehavior\fReplace\20ConfirmBehavior\1\0\1\vselect\2\fvisibleΩ\1\0\2\6\0\n\0\0236\2\0\0'\4\1\0B\2\2\0029\2\2\0029\2\3\2\18\5\0\0009\3\4\0B\3\2\0028\2\3\2\a\2\5\0X\3\6Ä9\3\6\0019\3\a\3\a\3\b\0X\3\2Ä+\3\1\0L\3\2\0\a\2\t\0X\3\2Ä+\3\1\0L\3\2\0+\3\2\0L\3\2\0\tText\tjava\rfiletype\17prev_context\fSnippet\rget_kind\23CompletionItemKind\blsp\14cmp.types\frequireª\16\1\0\18\0k\0◊\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0026\4\0\0'\6\5\0B\4\2\0029\5\6\0025\a\b\0005\b\a\0=\b\t\a5\b\n\0=\b\v\a9\b\f\0029\b\r\b=\b\14\a5\b\15\0004\t\v\0006\n\0\0'\f\16\0B\n\2\0029\n\17\n>\n\1\t6\n\0\0'\f\16\0B\n\2\0029\n\18\n>\n\2\t9\n\19\0029\n\20\n9\n\21\n>\n\3\t9\n\19\0029\n\20\n9\n\22\n>\n\4\t9\n\19\0029\n\20\n9\n\18\n>\n\5\t9\n\23\4>\n\6\t9\n\19\0029\n\20\n9\n\24\n>\n\a\t9\n\19\0029\n\20\n9\n\25\n>\n\b\t9\n\19\0029\n\20\n9\n\26\n>\n\t\t9\n\19\0029\n\20\n9\n\27\n>\n\n\t=\t\28\b=\b\29\a5\b\31\0005\t\30\0=\t \b9\t\24\1=\t!\b5\t\"\0=\t#\b5\t$\0=\t%\b3\t&\0=\t'\b=\b(\a5\b*\0003\t)\0=\t+\b=\b,\a5\b/\0009\t\19\0029\t-\t9\t.\tB\t\1\2=\t\t\b9\t\19\0029\t-\t9\t.\tB\t\1\2=\t0\b=\b-\a9\b1\0029\b2\b9\b3\b5\n6\0009\v1\0029\r1\0029\r4\rB\r\1\0025\0145\0B\v\3\2=\v7\n9\v1\0029\r1\0029\r8\rB\r\1\0025\0149\0B\v\3\2=\v:\n9\v1\0029\r1\0029\r8\r5\15=\0009\16;\0029\16<\16=\16>\15B\r\2\0025\14?\0B\v\3\2=\v@\n9\v1\0029\r1\0029\r4\r5\15A\0009\16;\0029\16<\16=\16>\15B\r\2\0025\14B\0B\v\3\2=\vC\n9\v1\0029\vD\v)\r¸ˇB\v\2\2=\vE\n9\v1\0029\vD\v)\r\4\0B\v\2\2=\vF\n9\v1\0025\rK\0009\0141\0029\14G\0145\16J\0009\17H\0029\17I\17=\17>\16B\14\2\2=\14L\r3\14M\0=\14N\rB\v\2\2=\vO\n9\v1\0023\rP\0005\14Q\0B\v\3\2=\vR\n9\v1\0023\rS\0005\14T\0B\v\3\2=\vU\n9\v1\0029\vV\vB\v\1\2=\vW\n9\v1\0029\vX\vB\v\1\2=\vY\n9\v1\0023\rZ\0B\v\2\2=\v[\nB\b\2\2=\b1\a4\b\r\0005\t\\\0>\t\1\b5\t]\0003\n^\0=\n_\t>\t\2\b5\t`\0>\t\3\b5\ta\0>\t\4\b5\tb\0>\t\5\b5\tc\0>\t\6\b5\td\0>\t\a\b5\te\0>\t\b\b5\tf\0>\t\t\b5\tg\0>\t\n\b5\th\0>\t\v\b5\ti\0>\t\f\b=\bj\aB\5\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\ttmux\1\0\1\tname\vcrates\1\0\1\tname\15treesitter\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lua\1\0\1\tname\16cmp_tabnine\1\0\1\tname\fluasnip\1\0\1\tname\tpath\17entry_filter\0\1\0\1\tname\rnvim_lsp\1\0\2\tname\fcopilot\16group_index\3\2\t<CR>\0\n<C-e>\nabort\14<C-Space>\rcomplete\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-y>\6c\0\6i\1\0\0\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<C-f>\n<C-d>\16scroll_docs\t<Up>\1\2\0\0\6i\1\0\0\v<Down>\1\2\0\0\6i\rbehavior\1\0\0\vSelect\19SelectBehavior\n<C-j>\1\3\0\0\6i\6c\21select_next_item\n<C-k>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\vinsert\vpreset\fmapping\18documentation\1\0\0\rbordered\vwindow\fsnippet\vexpand\1\0\0\0\15formatting\vformat\0\15duplicates\1\0\4\fluasnip\3\1\vbuffer\3\1\rnvim_lsp\3\0\tpath\3\1\17source_names\1\0\v\nemoji\f(Emoji)\16cmp_tabnine\14(Tabnine)\nvsnip\14(Snippet)\rnvim_lsp\n(LSP)\15treesitter\17(TreeSitter)\ttmux\v(TMUX)\fluasnip\14(Snippet)\vbuffer\r(Buffer)\fcopilot\14(Copilot)\tcalc\v(Calc)\tpath\v(Path)\15kind_icons\vfields\1\0\2\23duplicates_default\3\0\14max_width\3\0\1\4\0\0\tkind\tabbr\tmenu\fsorting\16comparators\norder\vlength\14sort_text\tkind\nunder\nexact\voffset\fcompare\vconfig\nscore\15prioritize\28copilot_cmp.comparators\1\0\1\20priority_weight\3\2\14preselect\tNone\18PreselectMode\17experimental\1\0\2\15ghost_text\1\16native_menu\1\15completion\1\0\0\1\0\1\19keyword_length\3\1\nsetup\25cmp-under-comparator\fluasnip\bcmp\16theme.icons\24plugins.cmp.helpers\frequire\0", "config", "nvim-cmp")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'ToggleTerm', function(cmdargs)
          require('packer.load')({'toggleterm.nvim'}, { cmd = 'ToggleTerm', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'toggleterm.nvim'}, { cmd = 'ToggleTerm' }, _G.packer_plugins)
          return vim.fn.getcompletion('ToggleTerm ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartCursorMoveLeft', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveLeft', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveLeft' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartCursorMoveLeft ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartCursorMoveRight', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveRight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveRight' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartCursorMoveRight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartCursorMoveUp', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveUp', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveUp' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartCursorMoveUp ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartCursorMoveDown', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveDown', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartCursorMoveDown' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartCursorMoveDown ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle' }, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeOpen', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeOpen' }, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeClose', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeClose' }, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartResizeDown', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeDown', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeDown' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartResizeDown ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartResizeMode', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeMode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeMode' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartResizeMode ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartResizeUp', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeUp', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeUp' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartResizeUp ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartResizeRight', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeRight', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeRight' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartResizeRight ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SmartResizeLeft', function(cmdargs)
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeLeft', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'smart-splits.nvim'}, { cmd = 'SmartResizeLeft' }, _G.packer_plugins)
          return vim.fn.getcompletion('SmartResizeLeft ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neogit', function(cmdargs)
          require('packer.load')({'neogit'}, { cmd = 'Neogit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neogit'}, { cmd = 'Neogit' }, _G.packer_plugins)
          return vim.fn.getcompletion('Neogit ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'neodev.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-ts-context-commentstring', 'vim-repeat', 'nvim-surround'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'autoclose.nvim', 'copilot-cmp', 'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
