return {
    "folke/flash.nvim",
    event = "VeryLazy", -- Load only when needed
    opts = {
      labels = "abcdefghijklmnopqrstuvwxyz", -- Customize jump labels
      search = {
        multi_window = true, -- Search across multiple windows
        wrap = true, -- Wrap around buffer
      },
      jump = {
        autojump = true, -- Auto jump if there's only one match
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
}
