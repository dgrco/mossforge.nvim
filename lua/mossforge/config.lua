local M = {}

M.defaults = {
  italic = false, -- italics disabled by default (comments, some builtins, etc.)
  transparent = false, -- if true, Normal/NormalFloat/sidebars get no bg
  palette_overrides = {}, -- e.g. { string = "#ffcc00" }

  -- toggle highlight groups per plugin; false skips setting that group
  -- entirely so another colorscheme layer / plugin default can show through
  integrations = {
    treesitter  = true,
    lsp         = true,
    telescope   = true,
    fzflua      = true,
    blink       = true,
    cmp         = true,
    gitsigns    = true,
    lualine     = true,
    nvimtree    = true,
    neotree     = true,
    bufferline  = true,
    ibl         = true,
    whichkey    = true,
    trouble     = true,
    noice       = true,
    mini        = true,
    misc        = true, -- flash.nvim, vim-illuminate
    snacks      = true,
    treesitter_context = true,
  },
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
  return M.options
end

return M
