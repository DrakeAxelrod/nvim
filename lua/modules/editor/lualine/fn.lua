local M = {}

function M.buffer_not_empty()
  return vim.fn.empty(vim.fn.expand "%:t") ~= 1
end

function M.hide_in_width()
  local window_width_limit = 70
  return vim.fn.winwidth(0) > window_width_limit
end

function M.check_git_workspace()
  local filepath = vim.fn.expand "%:p:h"
  local gitdir = vim.fn.finddir(".git", filepath .. ";")
  return gitdir and #gitdir > 0 and #gitdir < #filepath
end


function M.trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ""
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
    end
    return str
  end
end

function M.hide_component(filetype_table)
  filetype_table = filetype_table or {
    "NvimTree",
    "aerial",
    "Starter",
    "terminal",
    "alpha",
    "startify",
  }
  local filetype = vim.bo.filetype
  for _, ft in ipairs(filetype_table) do
    if filetype == ft then
      return false
    end
  end
  return true
end

function M.show_component()
  return not M.hide_component()
end

function M.env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch "([^/]+)" do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

return M
