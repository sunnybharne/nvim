return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
      -- Default keymaps provided by plugin:
      -- Normal mode:  gcc (line),  gb c (block)
      -- Visual mode:  gc  (line),  gb   (block)
    end,
  },
}


