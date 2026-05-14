local M = {}

---@param c table
function M.get(c)
  return {
    SnacksDashboardNormal = { fg = c.fg, bg = c.bg_normal },
    SnacksDashboardDesc = { fg = c.fg_sidebar },
    SnacksDashboardFile = { fg = c.fg },
    SnacksDashboardDir = { fg = c.comment },
    SnacksDashboardFooter = { fg = c.comment, italic = true },
    SnacksDashboardHeader = { fg = c.blue2, bold = true },
    SnacksDashboardIcon = { fg = c.teal },
    SnacksDashboardKey = { fg = c.blue2, bold = true },
    SnacksDashboardTerminal = "SnacksDashboardNormal",
    SnacksDashboardSpecial = { fg = c.orange },
    SnacksDashboardTitle = { fg = c.teal, bold = true },

    SnacksNormal = "NormalFloat",
    SnacksNormalNC = "NormalFloat",
    SnacksBackdrop = { bg = c.bg_dark },
    SnacksWinBar = "FloatTitle",
    SnacksWinBarNC = { fg = c.fg_dark, bg = c.bg_float },
    SnacksWinKey = { fg = c.blue2, bold = true },
    SnacksWinKeySep = { fg = c.fg_gutter },
    SnacksWinKeyDesc = { fg = c.fg },
  }
end

return M
