# vscode_dark_2026.nvim

A polished standalone Neovim port of VS Code Dark 2026.

The theme keeps the VS Code Dark syntax identity while using a native
Tokyonight-inspired architecture: modular palette, grouped highlights, terminal
colors, user overrides, and optional plugin integrations. It does not require
`lush.nvim`.

## Installation

```lua
return {
  {
    "your_username/vscode_dark_2026.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("vscode_dark_2026")
    end,
  },
}
```

For a local checkout:

```lua
return {
  {
    dir = "/absolute/path/to/vscode_dark_2026.nvim",
    name = "vscode_dark_2026",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("vscode_dark_2026")
    end,
  },
}
```

## Configuration

Configure before loading the colorscheme:

```lua
require("vscode_dark_2026").setup({
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
  },
  plugins = {
    all = false,
    auto = true,
    telescope = true,
  },
  on_colors = function(colors)
    -- colors.info = "#58a6ff"
  end,
  on_highlights = function(highlights, colors)
    -- highlights.CursorLine = { bg = colors.bg_widget }
  end,
})

vim.cmd.colorscheme("vscode_dark_2026")
```

Plugin integrations can be enabled by short group name, such as `telescope`,
`cmp`, `blink`, `neo-tree`, `which-key`, or by plugin name, such as
`["telescope.nvim"] = true`. When `plugins.auto = true` and lazy.nvim is loaded,
installed supported plugins are detected automatically.

## Supported Highlights

Core coverage includes:

- Vim UI, floating windows, popups, statusline, tabline, winbar, signs, folds,
  messages, search, visual mode, spell, diff, and diagnostics
- Classic syntax groups
- Treesitter captures, including current `@markup.*` groups and legacy aliases
- LSP semantic tokens without special default-library recoloring
- Completion kinds shared by completion and symbol plugins
- Terminal ANSI colors

Plugin coverage includes:

- `nvim-cmp`, `blink.cmp`
- `telescope.nvim`, `fzf-lua`, `flash.nvim`, `which-key.nvim`
- `neo-tree.nvim`, `nvim-tree.lua`, `gitsigns.nvim`, `vim-gitgutter`
- `lazy.nvim`, `noice.nvim`, `nvim-notify`, `trouble.nvim`
- `render-markdown.nvim`, `rainbow-delimiters.nvim`,
  `indent-blankline.nvim`

## Palette

| Role | Hex |
| --- | --- |
| Background | `#0e0e0e` |
| Sidebar | `#141414` |
| Float | `#181818` |
| Popup | `#1f1f1f` |
| Foreground | `#c9d1d9` |
| Comments | `#8b949e` |
| Keywords | `#ff7b72` |
| Control flow | `#c586c0` |
| Types and namespaces | `#4ec9b0` |
| User functions and methods | `#d2a8ff` |
| Constants and enum members | `#79c0ff` |
| Macros and booleans | `#569cd6` |
| Strings | `#a5d6ff` |
| Numbers | `#b5cea8` |
| Parameters | `#ffa657` |
| Errors | `#f85149` |
| Warnings | `#d29922` |
| Info | `#58a6ff` |
| Git add | `#3fb950` |
| Git change | `#d29922` |
| Git delete | `#f85149` |

## Testing

Run the lightweight headless check from the repository root:

```sh
nvim --headless -u NONE -l tests/minimal.lua
```
