# mossforge.nvim

A minimal, warm-dark colorscheme: near-black background, moss-green line
numbers, warm gold keywords, dusty purple comments, muted orange strings,
brick-red numbers, teal functions, slate-blue types.

## Install (lazy.nvim)

```lua
{
  "dgrco/mossforge.nvim",
  name = "mossforge",
  priority = 1000,
  config = function()
    require("mossforge").setup({
      -- all fields optional, these are the defaults
      italic = false,       -- italics are off by default
      transparent = false,  -- true = no background, let terminal show through
      palette_overrides = {},
      -- palette_overrides = { string = "#ffcc00", linenr = "#888888" },
      integrations = {
        treesitter = true, lsp = true, telescope = true, fzflua = true,
        blink = true, cmp = true, gitsigns = true, lualine = true,
        nvimtree = true, neotree = true, bufferline = true, ibl = true,
        whichkey = true, trouble = true, noice = true, mini = true,
        misc = true,
      },
    })
    vim.cmd.colorscheme("mossforge")
  end,
}
```

`setup()` must be called before (or you must re-run `:colorscheme mossforge`
after) changing options — it only stores config, `:colorscheme` / `load()`
is what applies it.

## lualine

```lua
require("lualine").setup({
  options = { theme = require("mossforge.lualine") },
})
```

## What's themed

Core UI (statusline, floats, popups, diffs, folds, search), Treesitter
captures, native LSP (diagnostics, references, inlay hints, codelens),
telescope.nvim, fzf-lua, blink.cmp (+ nvim-cmp fallback), gitsigns.nvim,
lualine.nvim, nvim-tree.lua, neo-tree.nvim, bufferline.nvim,
indent-blankline.nvim (ibl), which-key.nvim, trouble.nvim, noice.nvim,
mini.nvim (statusline, tabline, pick, icons, jump, indentscope), plus
flash.nvim and vim-illuminate.

## Terminal themes

- `alacritty/mossforge.toml` — copy to `~/.config/alacritty/themes/` and
  `import` it from `alacritty.toml`.
- `foot/mossforge.ini` — copy to `~/.config/foot/themes/mossforge` and
  `include=` it from `foot.ini`.

## Palette

| role          | hex       |
|---------------|-----------|
| bg            | `#0d0d0d` |
| bg_alt        | `#151515` |
| fg            | `#e6e6e2` |
| comment       | `#8b6bb8` |
| line number   | `#c8c8c2` |
| keyword       | `#c9974a` |
| string        | `#e0c23c` |
| number/const  | `#ab5c56` |
| function      | `#7fb8b8` |
| type/builtin  | `#5a8bb0` |
| error         | `#c9564a` |

Tweak `lua/mossforge/palette.lua` to adjust. Everything else derives from it.
