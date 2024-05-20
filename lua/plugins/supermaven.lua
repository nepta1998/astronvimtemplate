return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            disable_inline_completion = false, -- disables inline completion for use with cmp
            disable_keymaps = false -- disables built in keymaps for more manual control
        })
    end,
    -- config = function()
    --   require("supermaven-nvim").setup({
    --     keymaps = {
    --       -- accept_suggestion = "<Tab>",
    --       -- clear_suggestion = "<C-]>",
    --       accept_suggestion = "<A-f>",
    --       clear_suggestion = "<A-c>",
    --       accept_word = "<C-j>",
    --     },
    --     ignore_filetypes = { cpp = true },
    --     color = {
    --       suggestion_color = "#CBE48A",
    --       cterm = 244,
    --     }
    --   })
    -- end,
}
