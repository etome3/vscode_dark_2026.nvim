local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h")
vim.opt.runtimepath:prepend(root)

local function assert_eq(actual, expected, message)
  if actual ~= expected then
    error((message or "assertion failed") .. ": expected " .. vim.inspect(expected) .. ", got " .. vim.inspect(actual), 2)
  end
end

local function assert_truthy(value, message)
  if not value then
    error(message or "expected truthy value", 2)
  end
end

local theme = require("vscode_dark_2026")

theme.setup()
vim.cmd.colorscheme("vscode_dark_2026")
assert_eq(vim.g.colors_name, "vscode_dark_2026", "colorscheme name")
assert_eq(vim.o.background, "dark", "background")

local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
assert_truthy(normal.fg, "Normal fg should be set")
assert_truthy(normal.bg, "Normal bg should be set")

local diagnostic = vim.api.nvim_get_hl(0, { name = "DiagnosticError" })
assert_truthy(diagnostic.fg, "DiagnosticError fg should be set")

theme.setup({ transparent = true })
theme.load()
normal = vim.api.nvim_get_hl(0, { name = "Normal" })
assert_eq(normal.bg, nil, "transparent Normal bg")

local colors, highlights = theme.load({
  plugins = { all = false, auto = false, telescope = true, snacks = true, cmp = false },
  on_colors = function(c)
    c.info = "#abcdef"
  end,
  on_highlights = function(hl, c)
    hl.TestOverride = { fg = c.info }
  end,
})

assert_eq(colors.info, "#abcdef", "on_colors override")
assert_truthy(highlights.TelescopeNormal, "telescope should be enabled")
assert_truthy(highlights.SnacksDashboardKey, "snacks should be enabled")
assert_eq(highlights.CmpItemAbbr, nil, "cmp should be disabled")
local override = vim.api.nvim_get_hl(0, { name = "TestOverride" })
assert_eq(override.fg, tonumber("abcdef", 16), "on_highlights override")

vim.print("vscode_dark_2026 minimal tests passed")
