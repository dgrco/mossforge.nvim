local cfg = require("mossforge.config").options
local c = require("mossforge.palette").get(cfg.palette_overrides)

local function mode(bgcol)
  return { a = { fg = c.bg, bg = bgcol, gui = "bold" }, b = { fg = c.fg, bg = c.bg_alt }, c = { fg = c.fg_dim, bg = c.bg_dim } }
end

return {
  normal   = mode(c.keyword),
  insert   = mode(c.func),
  visual   = mode(c["type"]),
  replace  = mode(c.error),
  command  = mode(c.string),
  inactive = { a = { fg = c.fg_muted, bg = c.bg_dim }, b = { fg = c.fg_muted, bg = c.bg_dim }, c = { fg = c.fg_muted, bg = c.bg_dim } },
}
