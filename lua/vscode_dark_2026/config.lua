local M = {}

---@class vscode_dark_2026.Config
---@field transparent boolean
---@field terminal_colors boolean
---@field dim_inactive boolean
---@field styles table<string, table>
---@field on_colors fun(colors: table)
---@field on_highlights fun(highlights: table, colors: table)
---@field plugins table<string, boolean|{enabled:boolean}>

M.defaults = {
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
  },
  on_colors = function(_) end,
  on_highlights = function(_, _) end,
  plugins = {
    all = false,
    auto = true,
  },
}

---@type vscode_dark_2026.Config?
M.options = nil

---@param options? vscode_dark_2026.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? vscode_dark_2026.Config
---@return vscode_dark_2026.Config
function M.extend(opts)
  if not M.options then
    M.setup()
  end
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or vim.deepcopy(M.options)
end

setmetatable(M, {
  __index = function(_, key)
    if key == "options" then
      return M.defaults
    end
  end,
})

return M
