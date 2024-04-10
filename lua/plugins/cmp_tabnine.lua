return {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",
  opts = {
    max_lines = 1000,
    max_num_results = 5,
    sort = true,
  },
  config = function(_, opts)
    require("cmp_tabnine.config"):setup(opts)
  end,
}
