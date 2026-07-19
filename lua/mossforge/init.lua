local M = {}

-- highlight-group name prefixes belonging to each optional integration;
-- used to strip groups when that integration is disabled in config
local INTEGRATION_PREFIXES = {
  treesitter = { "@" },
  lsp        = { "Lsp", "Diagnostic" },
  telescope  = { "Telescope" },
  fzflua     = { "FzfLua" },
  blink      = { "BlinkCmp" },
  cmp        = { "Cmp" },
  gitsigns   = { "GitSigns" },
  nvimtree   = { "NvimTree" },
  neotree    = { "NeoTree" },
  bufferline = { "BufferLine" },
  ibl        = { "Ibl" },
  whichkey   = { "WhichKey" },
  trouble    = { "Trouble" },
  noice      = { "Noice" },
  mini       = { "Mini" },
  misc       = { "Illuminated", "Flash" },
  snacks     = { "Snacks" },
  treesitter_context = { "TreesitterContext" },
  -- lualine has no highlight-group prefix here: it's a separate theme table
  -- consumed directly by lualine's own `options.theme`, see lualine.lua
}

local function filter_disabled(groups, integrations)
  for name, prefixes in pairs(INTEGRATION_PREFIXES) do
    if integrations[name] == false then
      for _, prefix in ipairs(prefixes) do
        for group in pairs(groups) do
          if group:sub(1, #prefix) == prefix then
            groups[group] = nil
          end
        end
      end
    end
  end
  return groups
end

-- setup(opts): configure without applying. Call before :colorscheme mossforge,
-- or call M.load() again afterwards to re-apply with new options.
function M.setup(opts)
  require("mossforge.config").setup(opts)
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "mossforge"
  vim.o.background = "dark"

  local cfg = require("mossforge.config").options
  local palette = require("mossforge.palette")
  local c = palette.get(cfg.palette_overrides)

  local groups = require("mossforge.theme").groups(c, cfg)
  groups = filter_disabled(groups, cfg.integrations)

  for name, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, name, hl)
  end

  -- terminal colors (:terminal, and used by some statusline/plugins)
  vim.g.terminal_color_0  = c.bg
  vim.g.terminal_color_1  = c.error
  vim.g.terminal_color_2  = c.linenr
  vim.g.terminal_color_3  = c.keyword
  vim.g.terminal_color_4  = c.comment
  vim.g.terminal_color_5  = c.keyword_import
  vim.g.terminal_color_6  = c.func
  vim.g.terminal_color_7  = c.fg_dim
  vim.g.terminal_color_8  = c.fg_gutter
  vim.g.terminal_color_9  = c.error
  vim.g.terminal_color_10 = c.linenr_cur
  vim.g.terminal_color_11 = c.string
  vim.g.terminal_color_12 = c.comment
  vim.g.terminal_color_13 = c.keyword_import
  vim.g.terminal_color_14 = c.func
  vim.g.terminal_color_15 = c.fg
end

return M
