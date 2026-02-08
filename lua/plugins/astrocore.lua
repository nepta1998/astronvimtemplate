
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        python3_host_prog = "/home/neptali/miniconda3/bin/python3", -- set default python env
        loaded_perl_provider = 0, -- fix warning to  load perl
        loaded_ruby_provider = 0, -- fix warning to  load ruby
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        -- delete selected word.
        ["<Leader>s"] = { desc = "👀" .. "Search word and edit" },

        ["<leader>si"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gi<Left><Left><Left>]], desc = "Change word - Not confirmation" },
        ["<leader>sc"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gic<left><Left><Left><Left>]], desc = "Change word - confirmation" },

        -- Opencode
        ["<leader>1"] = { group = "Opencode", icon = "🔮"},
        ["<leader>1a"] = { function() require("opencode").ask("@this: ", { submit = true }) end, desc = "Ask opencode…" },
        ["<leader>1c"] = { function() require("opencode").select() end, desc = "Execute opencode action…" },
        ["<leader>1t"] = { function() require("opencode").toggle() end, desc = "Toggle opencode" },
        ["<leader>1gr"] = { function() return require("opencode").operator("@this ") end,  desc = "Add range to opencode", expr = true  },
        ["<leader>1go"] = { function() return require("opencode").operator("@this ") .. "_" end,  desc = "Add line to opencode", expr = true  },
        ["<leader>1u"] = { function() require("opencode").command("session.half.page.up") end, desc = "Scroll opencode up" },
        ["<leader>1d"] = { function() require("opencode").command("session.half.page.down") end, desc = "Scroll opencode down" },
        ["<leader>m"] = { desc = " Markdown Preview"},
      },
      v = {
        ["J"] = { ":m '>+1<CR>gv-gv" },
        ["K"] = { ":m '<-2<CR>gv-gv" },
        ["<leader>1"] = { group = "Opencode", icon = "🔮"},
        ["<leader>1a"] = { function() require("opencode").ask("@this: ", { submit = true }) end, desc = "Ask opencode…" },
        ["<leader>1c"] = { function() require("opencode").select() end, desc = "Execute opencode action…" },
        ["<leader>1gr"] = { function() return require("opencode").operator("@this ") end, desc = "Add range to opencode", expr = true },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["<C-\\>"] = { function() require("opencode").toggle() end, desc = "Toggle opencode" },
      },
    },
  },
}
