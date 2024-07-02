return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      styles = {
        -- variables = {
        --   fg = "#E5C07B",
        -- },
      },
      on_colors = function(c)
        local util = require("tokyonight.util")
        -- 遍历 table 并应用 darken 函数（不递归处理子 table）
        local function darkenColors(colTable)
          for k, v in pairs(colTable) do
            if type(v) == "string" and v:sub(1, 1) == "#" then
              -- 变暗十六进制的颜色值
              -- colTable[k] = util.blend_bg(v, 0.85)
              colTable[k] = util.blend_bg(v, 0.90)
            end
            -- 如果类型是 table，则跳过，不进行变暗处理
          end
        end

        darkenColors(c)
      end,
      on_highlights = function(hl, c)
        hl["@variable"] = { fg = c.yellow }
        hl["@lsp.type.variable"] = { link = "@variable" }
        hl["@variable.parameter"] = { fg = c.fg }
      end,
    },
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "tokyonight",
  --   },
  -- },
}
