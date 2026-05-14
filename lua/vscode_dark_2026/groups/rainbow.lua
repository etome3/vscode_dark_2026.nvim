local M = {}

---@param c table
function M.get(c)
  local ret = {}
  for i, color in ipairs(c.rainbow) do
    ret["RainbowDelimiter" .. i] = { fg = color }
  end
  return ret
end

return M
