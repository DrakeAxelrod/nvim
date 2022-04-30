if not conf.ok.legendary then return end
conf.cmds = {}
local legendary = require("legendary")

-- vim.api.nvim_add_user_command("command! MiniStarter :lua require("mini.starter").open()")

conf.cmds.autocmds = function()
  legendary.bind_autocmds({
    {{ "BufWinEnter" }, ":checktime", opts = { pattern = "*" }},
    {{ "FileType" },
      [[:nnoremap <silent> <buffer> q :close<CR>]],
      opts = { pattern = { "qf", "help", "man", "null-ls-info", "lspinfo", "lsp-installer" }
    }},
    {{ "FileType" }, [[:set nobuflisted]], opts = { pattern = { "qf" } }},
    {{ "FileType" },
      function()
        vim.b.miniindentscope_disable = true
        vim.b.minicursorword_disable = true
      end,
      opts = { pattern = { "starter", "Telescope", "aerial", "NvimTree", "man", "help", "qf" }}
    },
    {{ "TermOpen" },
      function()
        vim.cmd([[:setlocal listchars= nonumber norelativenumber]])
        vim.cmd([[:startinsert]])
        vim.b.miniindentscope_disable = true
      end,
      opts = { pattern = "*" }
    },
    {{ "TermClose" }, [[:call feedkeys("\<cr>")]], opts = { pattern = "term://*" }},
    {{ "VimResized" }, [[:tabdo wincmd =]], opts = { pattern = "*" }},
    {{"ColorScheme"}, [[:hi CursorLineNr guifg=#46D9FF guibg=#282c34]], opts = { pattern = "*" }},
    {{ "TextYankPost" },
      [[:lua vim.highlight.on_yank({higroup = "Search", timeout = 300})]],
      opts = { pattern = "*" }
    }
  })
end


conf.cmds.command_palette = function()
  return {
    { "all keymaps", [[Legendary keymaps]] },
    { "normal mode keymaps", [[lua require('legendary').find('keymaps', require('legendary.filters').mode('n'))]]},
    { "visual mode keymaps", [[lua require('legendary').find('keymaps', require('legendary.filters').mode('v'))]] },
    { "insert mode keymaps", [[lua require('legendary').find('keymaps', require('legendary.filters').mode('i'))]] },
    { "commands", [[Legendary commands]] },
    { "autocmds", [[Legendary autocmds]] },
    { "entire selection", ':call feedkeys("GVgg")' },
    { "save current file", ':w' },
    { "save all files", ':wa' },
    { "quit", ':qa' },
    { "file browser", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
    { "search word", ":lua require('telescope.builtin').live_grep()", 1 },
    { "git files", ":lua require('telescope.builtin').git_files()", 1 },
    { "files", ":lua require('telescope.builtin').find_files()", 1 },
    { "keymaps", ":Legendary" },
    { "tips", ":help tips" },
    { "cheatsheet", ":help index" },
    { "tutorial", ":help tutor" },
    { "summary", ":help summary" },
    { "quick reference", ":help quickref" },
    { "search", ":lua require('telescope.builtin').help_tags()", 1 },
    { "reload vimrc", ":source $MYVIMRC" },
    { 'check health', ":checkhealth" },
    { "jumps", ":lua require('telescope.builtin').jumplist()" },
    { "commands", ":lua require('telescope.builtin').commands()" },
    { "command history", ":lua require('telescope.builtin').command_history()" },
    { "registers", ":lua require('telescope.builtin').registers()" },
    { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
    { "vim options", ":lua require('telescope.builtin').vim_options()" },
    { "keymaps", ":lua require('telescope.builtin').keymaps()" },
    { "buffers", ":Telescope buffers" },
    { "search history", ":lua require('telescope.builtin').search_history()" },
    { "paste mode", ':set paste!' },
    { 'cursor line', ':set cursorline!' },
    { 'cursor column', ':set cursorcolumn!' },
    { "spell checker", ':set spell!' },
    { "relative number", ':set relativenumber!' },
    { "search highlighting", ':set hlsearch!' },
    { "Open Last", ":Telescope resume<CR>" },
    { "Telescope Builtin's", ":Telescope builtin<CR>" },
    { "Man Pages", ":Telescope man_pages<CR>" },
    { "Grep String", ":Telescope grep_string<CR>" },
    { "Live Grep", ":Telescope live_grep<CR>" },
    { "FZF Native", ":Telescope fzf_native<CR>" },
    { "Buffer FZF Find", ":Telescope current_buffer_fuzzy_find<CR>" },
    { "Reloader", ":Telescope reloader<CR>" },
    { "Locations List", ":Telescope loclist<CR>" },
    { "Buffers", ":Telescope buffers<CR>" },
    { "Jumplist", ":Telescope jumplist<CR>" },
    { "Spelling Suggestions", ":Telescope spell_suggest<CR>" },
    { "Help Tags", ":Telescope help_tags<CR>" },
    { "Marks", ":Telescope marks<CR>" },
    { "Tags", ":Telescope tags<CR>" },
    { "Current Buffer Tags", ":Telescope current_buffer_tags<CR>" },
    { "Tagstack", ":Telescope tagstack<CR>" },
    { "Symbols", ":Telescope symbols<CR>" },
    { "Quickfix", ":Telescope quickfix<CR>" },
    { "Treesitter", ":Telescope treesitter<CR>" },
    { "Files", ":Telescope find_files<CR>" },
    { "Media Files", ":Telescope media_files<CR>" },
    { "Old Files", ":Telescope oldfiles<CR>" },
    { "History", ":Telescope search_history<CR>" },
    { "Command History", ":Telescope command_history<CR>" },
    { "Normal Mode Keymaps", ":Telescope keymaps<CR>" },
    { "Registers", ":Telescope registers<CR>" },
    { "Colorschemes", ":Telescope colorscheme<CR>" },
    { "Vim Options", ":Telescope vim_options<CR>" },
    { "Vim Commands", ":Telescope commands<CR>" },
    { "Vim Autocommands", ":Telescope autocommands<CR>" },
    { "Compile", ":PackerCompile<cr>" },
    { "Install", ":PackerInstall<cr>" },
    { "Sync", ":PackerSync<cr>" },
    { "Status", ":PackerStatus<cr>" },
    { "Update", ":PackerUpdate<cr>" },
    { "Git Status", ":Git status" },
    { "Git Log", [[:Git log --graph --abbrev-commit --decorate --format=format:"%h - (%ar) %s - %an%d" --all<CR>]] },
    { "Git Diff", ":Git diff<CR>" },
    { "Git Diff Staged", ":Git diff --staged<CR>" },
    { "Git Diff", ":Gitsigns diffthis HEAD<CR>" },
    { "Next Hunk", ":lua require 'gitsigns'.next_hunk()<CR>" },
    { "Prev Hunk", ":lua require 'gitsigns'.prev_hunk()<CR>" },
    { "Blame", ":lua require 'gitsigns'.blame_line()<CR>" },
    { "Preview Hunk", ":lua require 'gitsigns'.preview_hunk()<CR>" },
    { "Reset Hunk", ":lua require 'gitsigns'.reset_hunk()<CR>" },
    { "Reset Buffer", ":lua require 'gitsigns'.reset_buffer()<CR>" },
    { "Stage Hunk", ":lua require 'gitsigns'.stage_hunk()<CR>" },
    { "Undo Stage Hunk", ":lua require('gitsigns').undo_stage_hunk()<CR>" },
    { "Telescope Status", ":Telescope git_status<CR>" },
    { "Telescope Stash", ":Telescope git_stash<CR>" },
    { "Telescope Branch's", ":Telescope git_branches<CR>" },
    { "Telescope Commis", ":Telescope git_commits<CR>" },
    { "Telescope Branch Commits", ":Telescope git_bcommits<CR>" },
    { "Telescope Files", ":Telescope git_files<CR>" },
  }
end
