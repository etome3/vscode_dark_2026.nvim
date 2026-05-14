local M = {}

---@param c table
function M.get(c)
  return {
    LazyNormal = "NormalFloat",
    LazyButton = { fg = c.fg, bg = c.bg_widget },
    LazyButtonActive = { fg = c.bg, bg = c.blue2, bold = true },
    LazyComment = { fg = c.comment },
    LazyCommit = { fg = c.git.change },
    LazyCommitIssue = { fg = c.purple },
    LazyCommitScope = { fg = c.teal },
    LazyCommitType = { fg = c.red },
    LazyDimmed = { fg = c.fg_gutter },
    LazyDir = { fg = c.teal },
    LazyH1 = { fg = c.bg, bg = c.blue2, bold = true },
    LazyH2 = { fg = c.blue2, bold = true },
    LazyProgressDone = { fg = c.git.add },
    LazyProgressTodo = { fg = c.fg_gutter },
    LazyProp = { fg = c.fg_dark },
    LazyReasonCmd = { fg = c.orange },
    LazyReasonEvent = { fg = c.purple },
    LazyReasonFt = { fg = c.teal },
    LazyReasonKeys = { fg = c.magenta },
    LazySpecial = { fg = c.orange },
    LazyTaskError = { fg = c.error },
    LazyTaskOutput = { fg = c.fg },
    LazyUrl = { fg = c.info, underline = true },
    LazyValue = { fg = c.green },
  }
end

return M
