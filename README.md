# vscode_dark_2026.nvim

A faithful Neovim port of VS Code Dark 2026, built with [lush.nvim](https://github.com/rktjmp/lush.nvim).

Covers core Vim groups, Treesitter, LSP semantic tokens (including the
stdlib-vs-user-function distinction), diagnostics, rainbow delimiters,
and common LazyVim plugins.

---

## Installation (LazyVim)

Place the theme folder somewhere on your machine, e.g.
`~/.config/nvim/lua/plugins/vscode_dark_2026/`, or publish it as a repo
and point Lazy at it. Both approaches are shown below.

### Option A — local directory

```lua
-- ~/.config/nvim/lua/plugins/vscode_dark_2026.lua
return {
  { "rktjmp/lush.nvim", lazy = true },
  {
    dir = "/absolute/path/to/vscode_dark_2026", -- ← change this
    name = "vscode_dark_2026",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme vscode_dark_2026")
    end,
  },
}
```

### Option B — GitHub repo

```lua
return {
  { "rktjmp/lush.nvim", lazy = true },
  {
    "your_username/vscode_dark_2026.nvim", -- ← change this
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme vscode_dark_2026")
    end,
  },
}
```

---

## Rainbow delimiters

Install [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)
and the theme's `RainbowDelimiter1–7` groups are picked up automatically.

```lua
-- ~/.config/nvim/lua/plugins/rainbow.lua
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  config = function()
    local rainbow = require("rainbow-delimiters")
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow.strategy["global"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua  = "rainbow-blocks",
      },
      -- Colours come from the theme's RainbowDelimiter1–7 groups.
      -- No highlight override needed here.
    }
  end,
}
```

The theme cycles: **yellow → purple → blue → yellow → …** matching VS Code's
bracket pair colouriser.

---

## Colour palette reference

| Token                        | Colour    | Hex       |
|------------------------------|-----------|-----------|
| Background                   | dark      | `#0E0E0E` |
| Default fg / variables / ops | light grey| `#C9D1D9` |
| Comments                     | grey      | `#8B949E` |
| Keywords (`fn`, `let`, …)    | red       | `#FF7B72` |
| Types / namespaces           | teal      | `#4EC9B0` |
| User functions & methods     | purple    | `#D2A8FF` |
| Stdlib functions (`from`, …) | yellow    | `#DCDCAA` |
| Constants / enum variants    | light blue| `#79C0FF` |
| Macros / booleans            | blue      | `#569CD6` |
| Strings & char literals      | sky blue  | `#A5D6FF` |
| Numbers                      | sage green| `#B5CEA8` |
| Parameters                   | orange    | `#FFA657` |
| Generic angle brackets `<>`  | dark grey | `#BBBEBF` |
| Rainbow layer 1              | yellow    | `#FFD700` |
| Rainbow layer 2              | purple    | `#DA70D6` |
| Rainbow layer 3              | blue      | `#179FFF` |

---

## Live editing with Lushify

Open `lua/lush_theme/vscode_dark_2026.lua` in Neovim and run:

```
:Lushify
```

Changes are reflected in real time as you edit colours.

---

## Notes

- **Stdlib method distinction** (`from`, `new`, `len` etc. in yellow vs user
  methods in purple) depends on your LSP providing semantic tokens with the
  `defaultLibrary` modifier. `rust-analyzer` does this out of the box.
  Without semantic tokens active, all methods fall back to purple.

- **Angle brackets `<>`**: Treesitter maps all brackets through
  `@punctuation.bracket`. The darker grey for generics specifically comes from
  VS Code's semantic token layer. If you want exact parity you can add a
  Rust-specific treesitter query override, but in practice it is barely
  noticeable.
