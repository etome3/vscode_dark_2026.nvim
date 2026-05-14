local M = {}

---@param c table
function M.get(c)
  return {
    TelescopeNormal = { fg = c.fg, bg = c.bg_float },
    TelescopeBorder = { fg = c.border_highlight, bg = c.bg_float },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_popup },
    TelescopePromptBorder = { fg = c.border_highlight, bg = c.bg_popup },
    TelescopePromptTitle = { fg = c.bg, bg = c.blue2, bold = true },
    TelescopePreviewTitle = { fg = c.bg, bg = c.git.add, bold = true },
    TelescopeResultsTitle = { fg = c.bg, bg = c.purple, bold = true },
    TelescopeSelection = { bg = c.bg_visual, fg = c.fg },
    TelescopeSelectionCaret = { fg = c.orange },
    TelescopeMatching = { fg = c.blue2, bold = true },
  }
end

return M
