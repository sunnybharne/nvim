return {
  "sunnybharne/nvim-terraform-snippets",
  config = function()
    require("terraform_snippets").setup()
  end,
  dependencies = { "L3MON4D3/LuaSnip" },
}
