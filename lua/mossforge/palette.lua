-- mossforge palette
-- olive-green control-flow keywords, orchid-magenta import keywords,
-- indigo-periwinkle comments, coral-rust strings/numbers, mint-teal booleans,
-- teal functions, moss-green types

local M = {}

M.palette = {
  -- base surfaces
  bg        = "#000000",
  bg_dim    = "#000000",
  bg_alt    = "#0a0a0a",
  bg_highlight = "#131311",
  bg_select = "#1c1c18",

  fg        = "#e6e6e2",
  fg_dim    = "#b8b8b0",
  fg_muted  = "#7a7a72",
  fg_gutter = "#4a4a44",

  -- borders / ui
  border    = "#2a2a26",
  border_hl = "#3a3a34",

  -- syntax roles
  comment   = "#8874d6",
  linenr    = "#c8c8c2",
  linenr_cur= "#f2f2ee",

  keyword        = "#a4ae64",
  keyword_import = "#cc63c0",
  operator       = "#c9c9be",

  string    = "#cf5f6c",
  number    = "#cf5f6c",
  boolean   = "#7cc4b0",
  constant  = "#cf5f6c",

  func      = "#8fc4cf",
  method    = "#8fc4cf",
  func_call = "#e6e6e2",
  ["type"]  = "#77a06c",
  builtin   = "#e6e6e2",

  variable  = "#e6e6e2",

  -- semantic
  error   = "#c9564a",
  warning = "#c9974a",
  info    = "#8fc4cf",
  hint    = "#7fb8b8",
  ok      = "#5c8a3a",

  -- diff / git
  diff_add    = "#5c8a3a",
  diff_change = "#c9974a",
  diff_delete = "#c9564a",
  diff_text   = "#8fbf5f",

  none = "NONE",
}

-- returns the base palette with any user overrides applied on top
function M.get(overrides)
  if not overrides or vim.tbl_isempty(overrides) then
    return M.palette
  end
  return vim.tbl_extend("force", {}, M.palette, overrides)
end

return M
