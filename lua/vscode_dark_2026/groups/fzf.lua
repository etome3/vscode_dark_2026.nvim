local M = {}

---@param c table
function M.get(c)
  return {
    FzfLuaNormal = "NormalFloat",
    FzfLuaBorder = "FloatBorder",
    FzfLuaTitle = "FloatTitle",
    FzfLuaCursor = { bg = c.bg_visual },
    FzfLuaSearch = { fg = c.blue2, bold = true },
    FzfLuaHeaderText = { fg = c.comment },
    FzfLuaPathColNr = { fg = c.fg_gutter },
    FzfLuaPathLineNr = { fg = c.fg_gutter },
  }
end

return M
