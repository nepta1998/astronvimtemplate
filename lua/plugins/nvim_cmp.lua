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
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp_tabnine", group_index = 2, priority = 900 } }))
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
                maxwidth = 200,
                ellipsis_char = '...',
                symbol_map = { Codeium = "🔮", TabNine = "🧙"}
            })
        }
      }
    })
    -- cmp.setup({
    --   opts = {
    --     -- ...
    --     formatting = {
    --         format = lspkind.cmp_format({
    --             mode = "symbol",
    --             maxwidth = 80,
    --             ellipsis_char = '...',
    --             symbol_map = { cmp_tabnine = "🧙", }
    --         })
    --     }
    --   }
    -- })
    -- cmp.setup( {
	   --  sources = {
		  --   { name = 'cmp_tabnine' },
	   --  },
	   --  opts = {
	   --    formatting = {
		  --     format = function(entry, vim_item)
		  -- 	    -- if you have lspkind installed, you can use it like
		  -- 	    -- in the following line:
	   -- 		    vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
	   -- 		    if entry.soshow_labelDetails = trueurce.name == "cmp_tabnine" then
    --                   local detail = (entry.completion_item.labelDetails or {}).detail
	   -- 			    vim_item.kind = "🧙"
	   -- 			    if detail and detail:find('.*%%.*') then
	   -- 				    vim_item.kind = vim_item.kind .. ' ' .. detail
	   -- 			    end
    --
	   -- 			    if (entry.completion_item.data or {}).multiline then
	   -- 				    vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
	   -- 			    end
	   -- 		    end
	   -- 		    local maxwidth = 80
	   -- 		    vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
	   -- 		    return vim_item
	   --      end,
	   --    },
	   --  }
    -- })
  end,
}
