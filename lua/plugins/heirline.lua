return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astroui.status")
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode({
        mode_text = { padding = { left = 1, right = 1 } },
      }), -- add the mode text
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      status.component.nav(),
      -- remove the 2nd mode indicator on the right
      status.component.builder({
        {
          provider = function()
            return status.utils.stylize("🧙"..vim.fn['codeium#GetStatusString'](), {
              padding = { right = 1 , left = 1},
            })
          end,
        },
        -- hl = status.hl.get_attributes("mode"), -- highlight based on mode attributes
      }),
      status.component.builder({
          {
            provider = function()
              return status.utils.stylize("🔮 ".. require('tabnine.status').status(), {
                padding = { right = 1 },
              })
            end,
          },
      }),
    }

  end,
}
