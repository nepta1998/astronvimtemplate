return {
  "nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    -- table.insert(opts.sources, 1, {
    --   name = "cmp_tabnine",
    --   group_index = 1,
    --   priority = 100,
    -- })
    -- table.insert(opts.sources, 1, {
    --   name = "codeium",
    --   group_index = 1,
    --   priority = 100,
    -- })
    -- import nvim-cmp plugin
    local cmp = require("cmp")
    -- config codeium
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium", group_index = 1, priority = 1000 } }))
    -- config tabnine
    -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp_tabnine", group_index = 1, priority = 100 } }))
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    -- run cmp setup
    cmp.setup(opts)
    -- configure  codeium in lspkind
    cmp.setup({
      opts = {
        -- ...
        formatting = {
            format = require('lspkind').cmp_format({
                mode = "symbol",
                maxwidth = 80,
                ellipsis_char = '...',
                symbol_map = { Codeium = "🔮", }
            })
        }
      }
    })
  end,
}
