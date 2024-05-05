-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- return {
--   'Exafunction/codeium.vim',
--   -- event = 'BufEnter',
--   config = function ()
--     -- Change '<C-g>' here to any keycode you like.
--     vim.keymap.set('i', '<C-y>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
--     vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
--     vim.keymap.set('i', '<C-f>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
--     vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
--     vim.keymap.set({'n', 'i', 'v'}, '<leader>1c', function() return vim.fn['codeium#Chat']() end, { expr = true })
--   end
-- }

return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
          enable_chat = true,
        })
    end
}
