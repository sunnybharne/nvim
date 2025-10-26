return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
      { "<leader>lc", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit current file" },
      { "<leader>lf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit filter" },
      { "<leader>lF", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit filter current file" },
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function() end,
  },
}
