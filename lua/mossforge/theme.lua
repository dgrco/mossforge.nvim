local M = {}

function M.groups(c, cfg)
  cfg = cfg or { italic = false, transparent = false }
  local g = {}
  local main_bg = cfg.transparent and c.none or c.bg
  local alt_bg = cfg.transparent and c.none or c.bg_alt

  -- ===================== Core editor UI =====================
  g.Normal       = { fg = c.fg, bg = main_bg }
  g.NormalNC     = { fg = c.fg, bg = main_bg }
  g.NormalFloat  = { fg = c.fg, bg = alt_bg }
  g.FloatBorder  = { fg = c.border_hl, bg = c.bg_alt }
  g.FloatTitle   = { fg = c.keyword, bg = c.bg_alt }
  g.Pmenu        = { fg = c.fg, bg = c.bg_alt }
  g.PmenuSel     = { fg = c.bg, bg = c.keyword }
  g.PmenuSbar    = { bg = c.bg_alt }
  g.PmenuThumb   = { bg = c.border_hl }
  g.PmenuKind    = { fg = c.func, bg = c.bg_alt }
  g.PmenuKindSel = { fg = c.bg, bg = c.keyword }
  g.PmenuExtra   = { fg = c.fg_muted, bg = c.bg_alt }

  g.Cursor       = { fg = c.bg, bg = c.fg }
  g.CursorLine   = { bg = c.bg_highlight }
  g.CursorLineNr = { fg = c.linenr_cur }
  g.CursorColumn = { bg = c.bg_highlight }
  g.LineNr       = { fg = c.linenr }
  g.SignColumn   = { fg = c.linenr, bg = main_bg }
  g.ColorColumn  = { bg = c.bg_highlight }

  g.Visual       = { bg = c.bg_select }
  g.VisualNOS    = { bg = c.bg_select }
  g.Search       = { fg = c.bg, bg = c.keyword }
  g.IncSearch    = { fg = c.bg, bg = c.string }
  g.CurSearch    = { fg = c.bg, bg = c.string }
  g.Substitute   = { fg = c.bg, bg = c.error }

  g.VertSplit    = { fg = c.border }
  g.WinSeparator = { fg = c.border }
  g.StatusLine   = { fg = c.fg_dim, bg = c.bg_dim }
  g.StatusLineNC = { fg = c.fg_muted, bg = c.bg_dim }
  g.TabLine      = { fg = c.fg_muted, bg = c.bg_dim }
  g.TabLineSel   = { fg = c.fg, bg = c.bg_highlight }
  g.TabLineFill  = { bg = c.bg_dim }
  g.WinBar       = { fg = c.fg_dim, bg = c.bg }
  g.WinBarNC     = { fg = c.fg_muted, bg = c.bg }

  g.Folded       = { fg = c.fg_muted, bg = c.bg_alt, italic = cfg.italic }
  g.FoldColumn   = { fg = c.fg_gutter, bg = c.bg }

  g.MatchParen   = { fg = c.keyword }
  g.NonText      = { fg = c.fg_gutter }
  g.Whitespace   = { fg = c.fg_gutter }
  g.SpecialKey   = { fg = c.fg_gutter }
  g.EndOfBuffer  = { fg = c.bg, bg = main_bg }
  g.Directory    = { fg = c["type"] }
  g.Title        = { fg = c.keyword }
  g.ModeMsg      = { fg = c.fg_dim }
  g.MoreMsg      = { fg = c.string }
  g.Question     = { fg = c.string }
  g.WildMenu     = { fg = c.bg, bg = c.keyword }

  g.DiffAdd      = { fg = c.diff_add, bg = c.none }
  g.DiffChange   = { fg = c.diff_change, bg = c.none }
  g.DiffDelete   = { fg = c.diff_delete, bg = c.none }
  g.DiffText     = { fg = c.diff_text }

  g.SpellBad     = { sp = c.error, undercurl = true }
  g.SpellCap     = { sp = c.warning, undercurl = true }
  g.SpellRare    = { sp = c["type"], undercurl = true }
  g.SpellLocal   = { sp = c.info, undercurl = true }

  -- ===================== Syntax (base) =====================
  g.Comment      = { fg = c.comment, italic = cfg.italic }
  g.Constant     = { fg = c.constant }
  g.String       = { fg = c.string }
  g.Character    = { fg = c.string }
  g.Number       = { fg = c.number }
  g.Boolean      = { fg = c.boolean }
  g.Float        = { fg = c.number }

  g.Identifier   = { fg = c.variable }
  g.Function     = { fg = c.func }

  g.Statement    = { fg = c.keyword }
  g.Conditional  = { fg = c.keyword }
  g.Repeat       = { fg = c.keyword }
  g.Label        = { fg = c.keyword }
  g.Operator     = { fg = c.operator }
  g.Keyword      = { fg = c.keyword }
  g.Exception    = { fg = c.keyword }

  g.PreProc      = { fg = c.keyword }
  g.Include      = { fg = c.keyword_import }
  g.Define       = { fg = c.keyword }
  g.Macro        = { fg = c.fg }
  g.PreCondit    = { fg = c.keyword }

  g.Type         = { fg = c["type"] }
  g.StorageClass = { fg = c["type"] }
  g.Structure    = { fg = c["type"] }
  g.Typedef      = { fg = c["type"] }

  g.Special      = { fg = c.func }
  g.SpecialChar  = { fg = c.number }
  g.Tag          = { fg = c.keyword }
  g.Delimiter    = { fg = c.operator }
  g.SpecialComment = { fg = c.comment }
  g.Debug        = { fg = c.error }

  g.Underlined   = { underline = true }
  g.Ignore       = { fg = c.fg_muted }
  g.Error        = { fg = c.error }
  g.Todo         = { fg = c.bg, bg = c.warning }

  -- ===================== Treesitter =====================
  g["@variable"]              = { fg = c.variable }
  g["@variable.builtin"]      = { fg = c.builtin, italic = cfg.italic }
  g["@variable.parameter"]    = { fg = c.fg }
  g["@variable.member"]       = { fg = c.fg }

  g["@constant"]               = { fg = c.constant }
  g["@constant.builtin"]       = { fg = c.constant }
  g["@constant.macro"]         = { fg = c.fg }

  g["@module"]                 = { fg = c.fg }
  g["@label"]                  = { fg = c.keyword }

  g["@string"]                 = { fg = c.string }
  g["@string.escape"]          = { fg = c.number }
  g["@string.special"]         = { fg = c.number }
  g["@string.regexp"]          = { fg = c.number }

  g["@character"]              = { fg = c.string }
  g["@character.special"]      = { fg = c.number }
  g["@number"]                 = { fg = c.number }
  g["@boolean"]                = { fg = c.boolean }
  g["@float"]                  = { fg = c.number }

  g["@function"]               = { fg = c.func }
  g["@function.builtin"]       = { fg = c.builtin, italic = cfg.italic }
  g["@function.call"]          = { fg = c.func_call }
  g["@function.macro"]         = { fg = c.fg }
  g["@function.method"]        = { fg = c.method }
  g["@function.method.call"]   = { fg = c.func_call }
  g["@constructor"]            = { fg = c.func_call }
  g["@operator"]                = { fg = c.operator }

  g["@keyword"]                 = { fg = c.keyword }
  g["@keyword.function"]        = { fg = c.keyword }
  g["@keyword.operator"]        = { fg = c.keyword }
  g["@keyword.return"]          = { fg = c.keyword }
  g["@keyword.import"]          = { fg = c.keyword_import }
  g["@keyword.conditional"]     = { fg = c.keyword }
  g["@keyword.repeat"]          = { fg = c.keyword }
  g["@keyword.exception"]       = { fg = c.keyword }

  g["@punctuation.delimiter"]   = { fg = c.operator }
  g["@punctuation.bracket"]     = { fg = c.operator }
  g["@punctuation.special"]     = { fg = c.keyword }

  g["@comment"]                 = { fg = c.comment, italic = cfg.italic }
  g["@comment.documentation"]   = { fg = c.comment }
  g["@comment.error"]           = { fg = c.error }
  g["@comment.warning"]         = { fg = c.warning }
  g["@comment.todo"]            = { fg = c.bg, bg = c.warning }
  g["@comment.note"]            = { fg = c.bg, bg = c.info }

  g["@markup.strong"]           = { bold = true }
  g["@markup.italic"]           = { italic = true }
  g["@markup.underline"]        = { underline = true }
  g["@markup.strikethrough"]    = { strikethrough = true }
  g["@markup.heading"]          = { fg = c.keyword }
  g["@markup.link"]             = { fg = c["type"], underline = true }
  g["@markup.link.url"]         = { fg = c["type"], underline = true }
  g["@markup.raw"]              = { fg = c.string }
  g["@markup.list"]             = { fg = c.operator }

  g["@tag"]                     = { fg = c.keyword }
  g["@tag.attribute"]           = { fg = c.func }
  g["@tag.delimiter"]           = { fg = c.operator }

  g["@type"]                    = { fg = c["type"] }
  g["@type.builtin"]            = { fg = c["type"], italic = cfg.italic }
  g["@attribute"]               = { fg = c.func }
  g["@property"]                = { fg = c.fg }

  g["@diff.plus"]  = { fg = c.diff_add }
  g["@diff.minus"] = { fg = c.diff_delete }
  g["@diff.delta"] = { fg = c.diff_change }

  -- ===================== LSP semantic tokens (@lsp.*) =====================
  g["@lsp.type.class"]         = { fg = c["type"] }
  g["@lsp.type.decorator"]     = { fg = c.func }
  g["@lsp.type.enum"]          = { fg = c["type"] }
  g["@lsp.type.enumMember"]    = { fg = c.constant }
  g["@lsp.type.event"]         = { fg = c["type"] }
  g["@lsp.type.function"]      = { fg = c.func_call }
  g["@lsp.type.interface"]     = { fg = c["type"] }
  g["@lsp.type.keyword"]       = { fg = c.keyword }
  g["@lsp.type.macro"]         = { fg = c.fg }
  g["@lsp.type.method"]                     = { fg = c.func_call }
  g["@lsp.typemod.function.declaration"]    = { fg = c.func }
  g["@lsp.typemod.function.definition"]     = { fg = c.func }
  g["@lsp.typemod.method.declaration"]      = { fg = c.method }
  g["@lsp.typemod.method.definition"]       = { fg = c.method }
  g["@lsp.type.modifier"]                   = { fg = c.keyword }
  g["@lsp.type.namespace"]     = { fg = c.fg }
  g["@lsp.type.number"]        = { fg = c.number }
  g["@lsp.type.operator"]      = { fg = c.operator }
  g["@lsp.type.parameter"]     = { fg = c.fg }
  g["@lsp.type.property"]      = { fg = c.fg }
  g["@lsp.type.regexp"]        = { fg = c.number }
  g["@lsp.type.string"]        = { fg = c.string }
  g["@lsp.type.struct"]        = { fg = c["type"] }
  g["@lsp.type.type"]          = { fg = c["type"] }
  g["@lsp.type.typeParameter"] = { fg = c["type"], italic = cfg.italic }
  g["@lsp.type.variable"]      = { fg = c.variable }
  g["@lsp.type.comment"]       = { fg = c.comment, italic = cfg.italic }

  g["@lsp.mod.deprecated"]                  = { strikethrough = true }
  g["@lsp.typemod.variable.readonly"]       = { fg = c.constant }
  g["@lsp.typemod.variable.defaultLibrary"] = { fg = c.builtin, italic = cfg.italic }
  g["@lsp.typemod.function.defaultLibrary"] = { fg = c.builtin, italic = cfg.italic }
  g["@lsp.typemod.method.defaultLibrary"]   = { fg = c.builtin, italic = cfg.italic }

  -- ===================== LSP =====================
  g.LspReferenceText  = { bg = c.bg_highlight }
  g.LspReferenceRead  = { bg = c.bg_highlight }
  g.LspReferenceWrite = { bg = c.bg_highlight, underline = true }
  g.LspSignatureActiveParameter = { fg = c.keyword }
  g.LspCodeLens        = { fg = c.fg_muted, italic = cfg.italic }
  g.LspInlayHint       = { fg = c.fg_gutter, bg = c.bg_alt, italic = cfg.italic }

  g.DiagnosticError = { fg = c.error }
  g.DiagnosticWarn  = { fg = c.warning }
  g.DiagnosticInfo  = { fg = c.info }
  g.DiagnosticHint  = { fg = c.hint }
  g.DiagnosticOk    = { fg = c.ok }

  g.DiagnosticVirtualTextError = { fg = c.error, bg = c.none, italic = cfg.italic }
  g.DiagnosticVirtualTextWarn  = { fg = c.warning, bg = c.none, italic = cfg.italic }
  g.DiagnosticVirtualTextInfo  = { fg = c.info, bg = c.none, italic = cfg.italic }
  g.DiagnosticVirtualTextHint  = { fg = c.hint, bg = c.none, italic = cfg.italic }

  g.DiagnosticUnderlineError = { sp = c.error, undercurl = true }
  g.DiagnosticUnderlineWarn  = { sp = c.warning, undercurl = true }
  g.DiagnosticUnderlineInfo  = { sp = c.info, undercurl = true }
  g.DiagnosticUnderlineHint  = { sp = c.hint, undercurl = true }

  g.DiagnosticFloatingError = { fg = c.error }
  g.DiagnosticFloatingWarn  = { fg = c.warning }
  g.DiagnosticFloatingInfo  = { fg = c.info }
  g.DiagnosticFloatingHint  = { fg = c.hint }

  g.DiagnosticSignError = { fg = c.error }
  g.DiagnosticSignWarn  = { fg = c.warning }
  g.DiagnosticSignInfo  = { fg = c.info }
  g.DiagnosticSignHint  = { fg = c.hint }

  -- nvim 0.10+ multiline virtual diagnostics
  g.DiagnosticVirtualLinesError = { fg = c.error, italic = cfg.italic }
  g.DiagnosticVirtualLinesWarn  = { fg = c.warning, italic = cfg.italic }
  g.DiagnosticVirtualLinesInfo  = { fg = c.info, italic = cfg.italic }
  g.DiagnosticVirtualLinesHint  = { fg = c.hint, italic = cfg.italic }

  g.DiagnosticDeprecated  = { fg = c.fg_muted, strikethrough = true }
  g.DiagnosticUnnecessary = { fg = c.fg_muted, italic = cfg.italic }

  -- ===================== :checkhealth =====================
  g.healthError   = { fg = c.error }
  g.healthWarning = { fg = c.warning }
  g.healthSuccess = { fg = c.ok }

  -- ===================== nvim-treesitter-context =====================
  g.TreesitterContext            = { bg = c.bg_alt }
  g.TreesitterContextLineNumber  = { fg = c.linenr, bg = c.bg_alt }
  g.TreesitterContextBottom      = { sp = c.border, underline = true }

  -- ===================== Telescope =====================
  g.TelescopeNormal        = { fg = c.fg, bg = c.bg_alt }
  g.TelescopeBorder        = { fg = c.border_hl, bg = c.bg_alt }
  g.TelescopePromptNormal  = { fg = c.fg, bg = c.bg_highlight }
  g.TelescopePromptBorder  = { fg = c.border_hl, bg = c.bg_highlight }
  g.TelescopePromptTitle   = { fg = c.bg, bg = c.keyword }
  g.TelescopePreviewTitle  = { fg = c.bg, bg = c.func }
  g.TelescopeResultsTitle  = { fg = c.bg, bg = c["type"] }
  g.TelescopeSelection     = { fg = c.fg, bg = c.bg_select }
  g.TelescopeSelectionCaret = { fg = c.keyword }
  g.TelescopeMatching      = { fg = c.string }
  g.TelescopeMultiSelection = { fg = c["type"] }

  -- ===================== fzf-lua =====================
  g.FzfLuaNormal        = { fg = c.fg, bg = c.bg_alt }
  g.FzfLuaBorder        = { fg = c.border_hl, bg = c.bg_alt }
  g.FzfLuaTitle         = { fg = c.bg, bg = c.keyword }
  g.FzfLuaPreviewTitle  = { fg = c.bg, bg = c.func }
  g.FzfLuaCursorLine    = { bg = c.bg_select }
  g.FzfLuaScrollBorderEmpty = { fg = c.border }
  g.FzfLuaScrollBorderFull  = { fg = c.keyword }
  g.FzfLuaHeaderBind    = { fg = c["type"] }
  g.FzfLuaHeaderText    = { fg = c.comment }

  -- ===================== blink.cmp =====================
  g.BlinkCmpMenu           = { fg = c.fg, bg = c.bg_alt }
  g.BlinkCmpMenuBorder     = { fg = c.border_hl, bg = c.bg_alt }
  g.BlinkCmpMenuSelection  = { fg = c.bg, bg = c.keyword }
  g.BlinkCmpLabel          = { fg = c.fg }
  g.BlinkCmpLabelMatch     = { fg = c.string }
  g.BlinkCmpLabelDeprecated = { fg = c.fg_muted, strikethrough = true }
  g.BlinkCmpLabelDetail    = { fg = c.fg_muted }
  g.BlinkCmpLabelDescription = { fg = c.fg_muted }
  g.BlinkCmpKind           = { fg = c.func }
  g.BlinkCmpDoc            = { fg = c.fg, bg = c.bg_alt }
  g.BlinkCmpDocBorder      = { fg = c.border_hl, bg = c.bg_alt }
  g.BlinkCmpDocSeparator   = { fg = c.border_hl }
  g.BlinkCmpSignatureHelp  = { fg = c.fg, bg = c.bg_alt }
  g.BlinkCmpSignatureHelpBorder = { fg = c.border_hl, bg = c.bg_alt }
  g.BlinkCmpSignatureHelpActiveParameter = { fg = c.keyword }
  g.BlinkCmpGhostText      = { fg = c.fg_gutter, italic = cfg.italic }

  -- nvim-cmp (kept for compatibility if used instead of blink)
  g.CmpItemAbbr           = { fg = c.fg }
  g.CmpItemAbbrMatch      = { fg = c.string }
  g.CmpItemAbbrDeprecated = { fg = c.fg_muted, strikethrough = true }
  g.CmpItemKind           = { fg = c.func }
  g.CmpItemMenu           = { fg = c.fg_muted }
  g.CmpDoc                = { fg = c.fg, bg = c.bg_alt }
  g.CmpDocBorder          = { fg = c.border_hl, bg = c.bg_alt }
  g.CmpPmenu              = { fg = c.fg, bg = c.bg_alt }
  g.CmpPmenuBorder        = { fg = c.border_hl, bg = c.bg_alt }

  -- ===================== gitsigns =====================
  g.GitSignsAdd          = { fg = c.diff_add }
  g.GitSignsChange       = { fg = c.diff_change }
  g.GitSignsDelete       = { fg = c.diff_delete }
  g.GitSignsAddNr        = { fg = c.diff_add }
  g.GitSignsChangeNr     = { fg = c.diff_change }
  g.GitSignsDeleteNr     = { fg = c.diff_delete }
  g.GitSignsAddLn        = { bg = c.bg_highlight }
  g.GitSignsChangeLn     = { bg = c.bg_highlight }
  g.GitSignsDeleteLn     = { bg = c.bg_highlight }
  g.GitSignsCurrentLineBlame = { fg = c.fg_muted, italic = cfg.italic }

  -- ===================== lualine (base16-style, consumed via lua/mossforge/lualine.lua) =====================
  -- see lualine.lua for the theme table

  -- ===================== nvim-tree =====================
  g.NvimTreeNormal        = { fg = c.fg, bg = c.bg_dim }
  g.NvimTreeNormalNC      = { fg = c.fg, bg = c.bg_dim }
  g.NvimTreeWinSeparator  = { fg = c.border, bg = c.bg_dim }
  g.NvimTreeRootFolder    = { fg = c.keyword }
  g.NvimTreeFolderName    = { fg = c["type"] }
  g.NvimTreeOpenedFolderName = { fg = c["type"] }
  g.NvimTreeEmptyFolderName = { fg = c.fg_muted }
  g.NvimTreeFolderIcon    = { fg = c["type"] }
  g.NvimTreeIndentMarker  = { fg = c.border_hl }
  g.NvimTreeGitDirty      = { fg = c.diff_change }
  g.NvimTreeGitNew        = { fg = c.diff_add }
  g.NvimTreeGitDeleted    = { fg = c.diff_delete }
  g.NvimTreeSpecialFile   = { fg = c.string, underline = true }
  g.NvimTreeExecFile      = { fg = c.ok }
  g.NvimTreeOpenedFile    = { fg = c.func }
  g.NvimTreeCursorLine    = { bg = c.bg_highlight }
  g.NvimTreeStatusLine    = { fg = c.fg_dim, bg = c.bg_dim }
  g.NvimTreeStatusLineNC  = { fg = c.fg_muted, bg = c.bg_dim }

  -- ===================== neo-tree =====================
  g.NeoTreeNormal         = { fg = c.fg, bg = c.bg_dim }
  g.NeoTreeNormalNC       = { fg = c.fg, bg = c.bg_dim }
  g.NeoTreeDirectoryName  = { fg = c["type"] }
  g.NeoTreeDirectoryIcon  = { fg = c["type"] }
  g.NeoTreeRootName       = { fg = c.keyword }
  g.NeoTreeFileName       = { fg = c.fg }
  g.NeoTreeFileIcon       = { fg = c.fg_dim }
  g.NeoTreeIndentMarker   = { fg = c.border_hl }
  g.NeoTreeGitAdded       = { fg = c.diff_add }
  g.NeoTreeGitModified    = { fg = c.diff_change }
  g.NeoTreeGitDeleted     = { fg = c.diff_delete }
  g.NeoTreeGitUntracked   = { fg = c.diff_add, italic = cfg.italic }
  g.NeoTreeCursorLine     = { bg = c.bg_highlight }
  g.NeoTreeTabActive      = { fg = c.fg, bg = c.bg_highlight }
  g.NeoTreeTabInactive    = { fg = c.fg_muted, bg = c.bg_dim }
  g.NeoTreeWinSeparator   = { fg = c.border, bg = c.bg_dim }

  -- ===================== bufferline =====================
  g.BufferLineFill               = { bg = c.bg_dim }
  g.BufferLineBackground         = { fg = c.fg_muted, bg = c.bg_dim }
  g.BufferLineBufferSelected     = { fg = c.fg, bg = c.bg }
  g.BufferLineBufferVisible      = { fg = c.fg_dim, bg = c.bg_dim }
  g.BufferLineTab                = { fg = c.fg_muted, bg = c.bg_dim }
  g.BufferLineTabSelected        = { fg = c.bg, bg = c.keyword }
  g.BufferLineIndicatorSelected  = { fg = c.keyword, bg = c.bg }
  g.BufferLineSeparator          = { fg = c.bg_dim, bg = c.bg_dim }
  g.BufferLineSeparatorSelected  = { fg = c.border, bg = c.bg }
  g.BufferLineModified           = { fg = c.diff_change, bg = c.bg_dim }
  g.BufferLineModifiedSelected   = { fg = c.diff_change, bg = c.bg }
  g.BufferLineCloseButton        = { fg = c.fg_muted, bg = c.bg_dim }
  g.BufferLineCloseButtonSelected = { fg = c.error, bg = c.bg }
  g.BufferLineDiagnosticSelected = { fg = c.error, bg = c.bg }

  -- ===================== indent-blankline (ibl) =====================
  g.IblIndent      = { fg = c.border }
  g.IblScope       = { fg = c.border_hl }
  g.IblWhitespace  = { fg = c.fg_gutter }

  -- ===================== which-key =====================
  g.WhichKey          = { fg = c.keyword }
  g.WhichKeyGroup      = { fg = c["type"] }
  g.WhichKeyDesc       = { fg = c.fg }
  g.WhichKeySeparator  = { fg = c.fg_muted }
  g.WhichKeyFloat      = { bg = c.bg_alt }
  g.WhichKeyBorder     = { fg = c.border_hl, bg = c.bg_alt }
  g.WhichKeyValue      = { fg = c.fg_muted }

  -- ===================== trouble.nvim =====================
  g.TroubleNormal      = { fg = c.fg, bg = c.bg_dim }
  g.TroubleText         = { fg = c.fg }
  g.TroubleCount        = { fg = c.keyword }
  g.TroubleIndent       = { fg = c.border }
  g.TroubleFoldIcon     = { fg = c.keyword }
  g.TroubleLocation     = { fg = c.fg_muted }
  g.TroubleFile          = { fg = c["type"] }
  g.TroubleSource        = { fg = c.fg_muted, italic = cfg.italic }
  g.TroubleCode          = { fg = c.fg_muted }

  -- ===================== noice.nvim =====================
  g.NoiceCmdlinePopup       = { fg = c.fg, bg = c.bg_alt }
  g.NoiceCmdlinePopupBorder = { fg = c.border_hl, bg = c.bg_alt }
  g.NoiceCmdlineIcon        = { fg = c.keyword }
  g.NoiceCmdlinePrompt      = { fg = c.keyword }
  g.NoiceConfirm            = { fg = c.fg, bg = c.bg_alt }
  g.NoiceConfirmBorder      = { fg = c.border_hl, bg = c.bg_alt }
  g.NoiceMini               = { fg = c.fg, bg = c.bg_alt }
  g.NoiceLspProgressTitle   = { fg = c.func }
  g.NoiceLspProgressClient  = { fg = c["type"] }
  g.NoiceLspProgressSpinner = { fg = c.keyword }
  g.NoticeFormatProgressDone = { fg = c.ok }
  g.NoiceFormatProgressTodo  = { fg = c.fg_muted }

  -- ===================== mini.nvim =====================
  g.MiniIndentscopeSymbol   = { fg = c.border_hl }
  g.MiniStatuslineModeNormal = { fg = c.bg, bg = c.keyword }
  g.MiniStatuslineModeInsert = { fg = c.bg, bg = c.func }
  g.MiniStatuslineModeVisual = { fg = c.bg, bg = c["type"] }
  g.MiniStatuslineModeReplace = { fg = c.bg, bg = c.error }
  g.MiniStatuslineModeCommand = { fg = c.bg, bg = c.string }
  g.MiniStatuslineFilename   = { fg = c.fg_dim, bg = c.bg_alt }
  g.MiniStatuslineInactive   = { fg = c.fg_muted, bg = c.bg_dim }
  g.MiniTablineCurrent       = { fg = c.fg, bg = c.bg }
  g.MiniTablineVisible       = { fg = c.fg_dim, bg = c.bg_dim }
  g.MiniTablineHidden        = { fg = c.fg_muted, bg = c.bg_dim }
  g.MiniTablineModifiedCurrent = { fg = c.diff_change, bg = c.bg }
  g.MiniTablineModifiedHidden  = { fg = c.diff_change, bg = c.bg_dim }
  g.MiniCursorword           = { underline = true }
  g.MiniCursorwordCurrent    = { underline = true }
  g.MiniJump                 = { fg = c.bg, bg = c.keyword }
  g.MiniJump2dSpot           = { fg = c.keyword, underline = true }
  g.MiniCompletionActiveParameter = { fg = c.keyword }
  g.MiniPickBorder            = { fg = c.border_hl, bg = c.bg_alt }
  g.MiniPickBorderText        = { fg = c.keyword, bg = c.bg_alt }
  g.MiniPickMatchCurrent      = { bg = c.bg_select }
  g.MiniPickNormal            = { fg = c.fg, bg = c.bg_alt }
  g.MiniPickPrompt            = { fg = c.keyword }
  g.MiniIconsRed    = { fg = c.error }
  g.MiniIconsOrange = { fg = c.string }
  g.MiniIconsYellow = { fg = c.keyword }
  g.MiniIconsGreen  = { fg = c.diff_add }
  g.MiniIconsCyan   = { fg = c.func }
  g.MiniIconsBlue   = { fg = c["type"] }
  g.MiniIconsPurple = { fg = c.comment }
  g.MiniIconsGrey   = { fg = c.fg_muted }

  -- ===================== snacks.nvim =====================
  g.SnacksNormal            = { fg = c.fg, bg = c.bg_alt }
  g.SnacksBackdrop          = { bg = c.bg }
  g.SnacksIndent            = { fg = c.border }
  g.SnacksIndentScope       = { fg = c.border_hl }
  g.SnacksPickerBorder      = { fg = c.border_hl, bg = c.bg_alt }
  g.SnacksPickerTitle       = { fg = c.bg, bg = c.keyword }
  g.SnacksPickerMatch       = { fg = c.string, bold = true }
  g.SnacksPickerDir         = { fg = c.fg_muted }
  g.SnacksNotifierInfo      = { fg = c.info }
  g.SnacksNotifierWarn      = { fg = c.warning }
  g.SnacksNotifierError     = { fg = c.error }
  g.SnacksDashboardHeader   = { fg = c.keyword }
  g.SnacksDashboardDesc     = { fg = c.fg_dim }
  g.SnacksDashboardFooter   = { fg = c.comment, italic = cfg.italic }
  g.SnacksDashboardKey      = { fg = c.func }

  -- ===================== misc quality-of-life =====================
  g.IlluminatedWordText = { bg = c.bg_highlight }
  g.IlluminatedWordRead = { bg = c.bg_highlight }
  g.IlluminatedWordWrite = { bg = c.bg_highlight, underline = true }
  g.FlashLabel = { fg = c.bg, bg = c.keyword }
  g.FlashMatch = { fg = c.string }
  g.FlashCurrent = { fg = c.bg, bg = c.func }

  return g
end

return M
