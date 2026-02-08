return {
    "wallpants/github-preview.nvim",
    cmd = { "GithubPreviewToggle" },
    keys = {
        { "<leader>mp", function() require("github-preview").fns.open() end, desc = "Open GitHub Preview" },
        { "<leader>mpt", function() require("github-preview").fns.toggle() end, desc = "Toggle GitHub Preview" },
        { "<leader>mps", function() require("github-preview").fns.single_file_toggle() end, desc = "Toggle Single File Mode" },
        { "<leader>mpd", function() require("github-preview").fns.details_tags_toggle() end, desc = "Toggle Details Tags" },
    },
    opts = {},
}
