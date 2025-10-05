return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        -- Enable keybindings
        mappings = {
          -- Enable operator-pending mapping
          basic = true,
          -- Enable extra mapping
          extra = true,
        },
        -- Configure commentstring for specific filetypes
        pre_hook = function(ctx)
          -- Set commentstring for Bicep files
          if vim.bo.filetype == "bicep" then
            vim.bo.commentstring = "// %s"
          end
        end,
      })
      -- Default keymaps provided by plugin:
      -- Normal mode:  gcc (line),  gb c (block)
      -- Visual mode:  gc  (line),  gb   (block)
    end,
  },
}


