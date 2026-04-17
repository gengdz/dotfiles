local function find_local_cmd(ctx, cmd)
  return vim.fs.find("node_modules/.bin/" .. cmd, { path = ctx.dirname, upward = true })[1]
end

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}

      opts.formatters.oxfmt = {
        command = function(ctx)
          return find_local_cmd(ctx, "vp") or find_local_cmd(ctx, "oxfmt") or "vp"
        end,
        args = function(ctx)
          return find_local_cmd(ctx, "vp") and { "fmt", "--stdin-filepath", "$FILENAME" } or { "--stdin-filepath", "$FILENAME" }
        end,
        condition = function(_, ctx)
          return find_local_cmd(ctx, "vp") or find_local_cmd(ctx, "oxfmt")
        end,
      }

      local prettier = opts.formatters.prettier or {}
      local original_condition = prettier.condition

      opts.formatters.prettier = vim.tbl_extend("force", prettier, {
        condition = function(formatter, ctx)
          return find_local_cmd(ctx, "prettier")
            and (not original_condition or original_condition(formatter, ctx))
        end,
      })
    end,
  },
}


