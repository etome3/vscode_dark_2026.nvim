local M = {}

---@param c table
function M.get(c)
  return {
    GitGutterAdd = { fg = c.git.add },
    GitGutterChange = { fg = c.git.change },
    GitGutterDelete = { fg = c.git.delete },
    GitGutterChangeDelete = { fg = c.orange },
  }
end

return M
