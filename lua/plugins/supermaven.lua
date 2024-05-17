return {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          -- accept_suggestion = "<Tab>",
          -- clear_suggestion = "<C-]>",
          accept_suggestion = "<A-f>",
          clear_suggestion = "<A-c>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = "#CBE48A",
          cterm = 244,
        }
      })
    end,
}
