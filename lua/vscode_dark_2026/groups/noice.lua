local M = {}

---@param c table
function M.get(c)
  return {
    NoiceCmdline = { fg = c.fg, bg = c.bg_popup },
    NoiceCmdlinePopup = "NormalFloat",
    NoiceCmdlinePopupBorder = "FloatBorder",
    NoiceConfirm = "NormalFloat",
    NoiceConfirmBorder = "FloatBorder",
    NoicePopup = "NormalFloat",
    NoicePopupBorder = "FloatBorder",
    NoiceVirtualText = { fg = c.comment },
    NoiceFormatProgressDone = { fg = c.bg, bg = c.blue2 },
    NoiceFormatProgressTodo = { fg = c.fg_gutter, bg = c.bg_widget },
    NoiceLspProgressClient = { fg = c.teal },
    NoiceLspProgressSpinner = { fg = c.orange },
    NoiceLspProgressTitle = { fg = c.fg },
  }
end

return M
