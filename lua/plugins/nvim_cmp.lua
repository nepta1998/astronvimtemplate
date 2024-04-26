return {
  "nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    -- import nvim-cmp plugin
    local cmp = require("cmp")
    -- config codeium
    -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium", group_index = 1, priority = 1000 } }))
    -- config tabnine
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp_tabnine", group_index = 2, priority = 900 } }))
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    -- run cmp setup
    cmp.setup(opts)
    -- configure  codeium in lspkind
    cmp.setup({
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = require('lspkind').cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = '...',
            symbol_map = { Codeium = "🔮", TabNine = "🧙"},
            -- before = function (entry, vim_item)
            --   -- set max width of cmp window
            --   local width = 30
            --   local ellipses_char = '...'
            --   local label = vim_item.abbr
            --   local truncated_label = vim.fn.strcharpart(label, 0, width)
            --   if truncated_label ~= label then
            --     vim_item.abbr = truncated_label .. ellipses_char
            --   else
            --     vim_item.abbr = label .. ' '
            --   end
            --   return vim_item
            -- end
        })
      }
    })
  end,
}
