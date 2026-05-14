local M = {}

---@param c table
function M.get(c)
  return {
    WhichKey = { fg = c.blue2 },
    WhichKeyGroup = { fg = c.teal },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.comment },
    WhichKeySeperator = "WhichKeySeparator",
    WhichKeyValue = { fg = c.comment },
    WhichKeyFloat = "NormalFloat",
    WhichKeyBorder = "FloatBorder",
    WhichKeyTitle = "FloatTitle",
  }
end

return M
