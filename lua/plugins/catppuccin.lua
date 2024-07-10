return {
  "catppuccin/nvim",
  name = "catppuccin", -- latte, frappe, macchiato, mocha
  config = function()
    require("catppuccin").setup {
      -- flavour = "frappe",
      transparent_background = true,
    }
  end
}
