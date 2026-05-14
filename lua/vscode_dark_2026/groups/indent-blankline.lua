local M = {}

---@param c table
function M.get(c)
  return {
    IblIndent = { fg = c.bg_widget },
    IblWhitespace = { fg = c.bg_widget },
    IblScope = { fg = c.fg_gutter },
    IndentBlanklineChar = { fg = c.bg_widget },
    IndentBlanklineContextChar = { fg = c.fg_gutter },
    IndentBlanklineContextStart = { sp = c.fg_gutter, underline = true },
  }
end

return M
