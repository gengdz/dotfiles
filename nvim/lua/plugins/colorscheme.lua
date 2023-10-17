return {
  {
    "catppuccin/nvim",
    lazy = true,
    enabled = false,
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        -- 不需要 下波浪线，因为颜色太杂 undercurl
        hl.DiagnosticUnderlineWarn.undercurl = nil
        hl.DiagnosticUnderlineWarn.underline = true
        hl.DiagnosticUnderlineError.undercurl = nil
        hl.DiagnosticUnderlineError.underline = true
        hl.DiagnosticUnderlineInfo.undercurl = nil
        hl.DiagnosticUnderlineInfo.underline = true
        hl.DiagnosticUnderlineHint.undercurl = nil
        hl.DiagnosticUnderlineHint.underline = true
      end,
    },
  },
}
