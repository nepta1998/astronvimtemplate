if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "catppuccin/nvim",
  name = "catppuccin", -- latte, frappe, macchiato, mocha
  config = function()
    require("catppuccin").setup {
      flavour = "frappe",
    }
  end
}
