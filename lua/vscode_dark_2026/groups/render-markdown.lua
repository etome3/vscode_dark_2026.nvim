local M = {}

---@param c table
function M.get(c)
  return {
    RenderMarkdownH1Bg = { bg = c.virtual_text.error },
    RenderMarkdownH2Bg = { bg = c.virtual_text.info },
    RenderMarkdownH3Bg = { bg = c.virtual_text.hint },
    RenderMarkdownH4Bg = { bg = c.virtual_text.warning },
    RenderMarkdownH5Bg = { bg = c.bg_widget },
    RenderMarkdownH6Bg = { bg = c.bg_widget },
    RenderMarkdownCode = { bg = c.bg_widget },
    RenderMarkdownCodeInline = { fg = c.cyan, bg = c.bg_widget },
    RenderMarkdownBullet = { fg = c.red },
    RenderMarkdownDash = { fg = c.fg_gutter },
    RenderMarkdownQuote = { fg = c.comment },
    RenderMarkdownLink = { fg = c.info, underline = true },
    RenderMarkdownUnchecked = { fg = c.fg_dark },
    RenderMarkdownChecked = { fg = c.git.add },
  }
end

return M
