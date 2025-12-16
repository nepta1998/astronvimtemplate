if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "ruff-lsp",
        "pyright",
        "black"
        -- add more arguments for adding more language servers
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it

      local mason_registry = require("mason-registry")
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions

      null_ls.setup({
        -- debug = true, -- Turn on debug for :NullLsLog
        debug = false,
        -- diagnostics_format = "#{m} #{s}[#{c}]",
        sources = {
          -- list of supported sources:
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

          -- get from $PATH
          diagnostics.ruff,
          diagnostics.mypy,
          formatting.black,

          -- get from mason
          formatting.stylua.with({
            command = mason_registry.get_package("stylua").path,
            extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          }),
          formatting.shfmt.with({
            command = mason_registry.get_package("shfmt").path,
          }),
          formatting.prettierd.with({
            command = mason_registry.get_package("prettierd").path,
          }),
          formatting.rustfmt.with({
            command = mason_registry.get_package("rustfmt").path,
          }),
          formatting.yamlfix.with({
            command = mason_registry.get_package("yamlfix").path, -- requires python
          }),

          diagnostics.yamllint.with({
            command = mason_registry.get_package("yamllint").path,
          }),

          code_actions.shellcheck.with({
            command = mason_registry.get_package("shellcheck").path,
          }),
        },
      })
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
        -- add more arguments for adding more null-ls sources
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
