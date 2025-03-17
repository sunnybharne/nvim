return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
    { "<leader>gl", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
    { "<leader>gf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Filter" },
  },
  config = function()
    -- Optional: Define a floating window command for LazyGit
    vim.api.nvim_create_user_command("LazyGitFloat", function()
      require("lazy.util").float_term({ "lazygit" })
    end, { desc = "Open LazyGit in Floating Window" })
  end
}
