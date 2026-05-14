local M = {}

---@param c table
function M.get(c)
  return {
    FlashBackdrop = { fg = c.fg_gutter },
    FlashMatch = { fg = c.info, bg = c.virtual_text.info },
    FlashCurrent = { fg = c.bg, bg = c.orange, bold = true },
    FlashLabel = { fg = c.bg, bg = c.red1, bold = true },
  }
end

return M
