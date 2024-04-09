if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

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
    local cmp = require("cmp")
    -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium", group_index = 1 } }))
    -- config tabnine
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp_tabnine", group_index = 1, priority = 100 } }))
  end,
}
