local M = {}

-- --- Creates a new augroup
-- --- @param group string The name of the augroup
-- --- @return fun(autocmds: fun(event: table | string, opts: table, command: function | string))
-- M.augroup = function(group)
-- 	-- local id = vim.api.nvim_create_augroup(group, { clear = true })
-- 	vim.api.nvim_create_augroup(group, { clear = true })
-- 	---@param autocmds fun(autocmd: fun(event: table | string, opts: table, command: function | string))
-- 	return function(autocmds)
-- 		autocmds(function(event, opts, command)
-- 			-- opts.group = id
-- 			opts.group = group
-- 			if type(command) == "function" then
-- 				opts.callback = command
-- 			else
-- 				opts.command = command
-- 			end
-- 			vim.api.nvim_create_autocmd(event, opts)
-- 		end)
-- 	end
-- end

-- --- Creates a new autocmd
-- --- @param event string | table The event(s) to run the autocmd on
-- --- @param command function | string The command to run
-- --- @param opts table The options for the autocmd
-- M.autocmd = function(event, command, opts)
--   if type(command) == "function" then
--     opts.callback = command
--   else
--     opts.command = command
--   end
--   vim.api.nvim_create_autocmd(event, opts)
-- end

-- M.highlight_on_yank = function()
--   vim.api.nvim_create_autocmd("TextYankPost", {
--     desc = "Highlight on yank",
--     pattern = "*",
--     callback = function()
--       vim.highlight.on_yank { higroup = "WildMenu", timeout = 200 }
--     end
--   })
-- end

-- M.wrap_json = function()
--   vim.api.nvim_create_autocmd("BufEnter", {
--     desc = "Wrap on enter for json files",
--     pattern = { "*.json", "*.jsonc" },
--     callback = function()
--       vim.wo.wrap = true
--     end
--   })
-- end

-- M.treesitter_zsh = function()
--   vim.api.nvim_create_autocmd("FileType", {
--     desc = "Attach treesitter highlight for zsh files",
--     pattern = "zsh",
--     callback = function()
--       require("nvim-treesitter.highlight").attach(0, "bash")
--     end
--   })
-- end

-- M.termopen = function()
--   vim.api.nvim_create_autocmd("TermOpen", {
--     pattern = "*",
--     callback = function()
--       vim.cmd("setlocal statusline= listchars= nonumber norelativenumber")
--       -- vim.cmd("startinsert")
--     end
--   })
-- end

-- M.vimresized = function()
--   vim.api.nvim_create_autocmd("VimResized", {
--     desc = "Auto resize windows",
--     pattern = "*",
--     callback = function()
--       vim.cmd "wincmd ="
--     end
--   })
-- end

-- -- M.lsp_signature = function()
-- --   vim.api.nvim_create_autocmd("LspAttach", {
-- --     callback = function(args)
-- --       local bufnr = args.buf
-- --       local client = vim.lsp.get_client_by_id(args.data.client_id)
-- --       if vim.tbl_contains({ 'null-ls' }, client.name) then  -- blacklist lsp
-- --         return
-- --       end
-- --       require("lsp_signature").on_attach({
-- --         -- ... setup options here ...
-- --       }, bufnr)
-- --     end,
-- --   })
-- -- end

-- -- M.eagle = function()
-- --   vim.api.nvim_create_autocmd("LspAttach", {
-- --     callback = function(args)
-- --       local bufnr = args.buf
-- --       local client = vim.lsp.get_client_by_id(args.data.client_id)
-- --       require("eagle").setup({
-- --         -- override the default values found in config.lua
-- --         -- debug_mode = true
-- --       })
-- --     end,
-- --   })
-- -- end

-- -- ac("FileType", {
-- --   desc = "Disable miniindent for NvimTree, Telescope and startup",
-- --   pattern = "NvimTree,Telescope,startup"
-- -- }, function()
-- --     vim.b.miniindentscope_disable = true
-- -- end)

-- M.fix_indent = function()
--   vim.api.nvim_create_autocmd("FileType", {
--     desc = "Disable miniindent for NvimTree, Telescope and startup",
--     pattern = "NvimTree,NeoTree,Telescope,Alpha,startup,neo-tree*",
--     callback = function()
--       vim.b.miniindentscope_disable = true
--     end
--   })
-- end
-- change search highlight color


-- local augroup = function(name)
--   return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
-- end

-- vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
--   group = augroup("checktime"),
--   desc = "check if we need to reload the file when it changed",
--   command = "checktime",
-- })

-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = augroup("highlight_yank"),
--   desc = "highlight yanked text",
--   callback = function()
--     vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   group = augroup("resize_splits"),
--   desc = "resize splits if window got resized",
--   callback = function()
--     vim.cmd("tabdo wincmd =")
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = augroup("last_loc"),
--   desc = "go to last loc when opening a buffer",
--   callback = function()
--     local mark = vim.api.nvim_buf_get_mark(0, '"')
--     local lcount = vim.api.nvim_buf_line_count(0)
--     if mark[1] > 0 and mark[1] <= lcount then
--       pcall(vim.api.nvim_win_set_cursor, 0, mark)
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("close_with_q"),
--   desc = "close some filetypes with <q>",
--   pattern = {
--     "PlenaryTestPopup",
--     "help",
--     "lspinfo",
--     "man",
--     "notify",
--     "qf",
--     "query", -- :InspectTree
--     "spectre_panel",
--     "startuptime",
--     "tsplayground",
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("wrap_spell"),
--   desc = "wrap and check for spell in text filetypes",
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--     vim.wo.wrap = true
--     vim.wo.spell = true
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = augroup("json_file"),
--   desc = "Wrap on enter for json files",
--   pattern = { "*.json", "*.jsonc" },
--   callback = function()
--     vim.wo.wrap = true
--   end,
-- })

-- vim.api.nvim_create_autocmd("User", {
--   group = augroup("alpha_fix"),
--   desc = "Fix alpha",
--   pattern = "AlphaReady",
--   callback = function()
--     vim.opt.laststatus = 0
--     vim.opt.showtabline = 0
--   end,
-- })

-- vim.api.nvim_create_autocmd("User", {
--   group = augroup("alpha_fix"),
--   desc = "Fix alpha",
--   pattern = "AlphaClosed",
--   callback = function()
--     vim.opt.laststatus = 3
--     vim.opt.showtabline = 2
--   end,
-- })

M.defaults = function()
  local augroup = function(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
  end

  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    desc = "Highlight on yank",
    pattern = "*",
    callback = function()
      vim.highlight.on_yank { higroup = "WildMenu", timeout = 200 }
    end
  })


  vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup("json_file"),
    desc = "Wrap on enter for json files",
    pattern = { "*.json", "*.jsonc" },
    callback = function()
      vim.wo.wrap = true
    end
  })


  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("treesitter_zsh"),
    desc = "Attach treesitter highlight for zsh files",
    pattern = "zsh",
    callback = function()
      require("nvim-treesitter.highlight").attach(0, "bash")
    end
  })


  vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup("termopen"),
    desc = "TermOpen Fix",
    pattern = "*",
    callback = function()
      vim.cmd("setlocal statusline= listchars= nonumber norelativenumber")
      -- vim.cmd("startinsert")
    end
  })


  vim.api.nvim_create_autocmd("VimResized", {
    group = augroup("vimresized"),
    desc = "Auto resize windows",
    pattern = "*",
    callback = function()
      vim.cmd "wincmd ="
    end
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("fix_mini_indent"),
    desc = "Disable miniindent for NvimTree, Telescope and startup",
    pattern = "NvimTree,NeoTree,Telescope,Alpha,startup,neo-tree*,eagle,lspsaga,FzfLua",
    callback = function()
      vim.b.miniindentscope_disable = true
    end
  })
end

return M