return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "s",
            function() require("flash").jump() end,
            mode = { "n", "x", "o" },
            desc = "Flash jump"
        },
        {
            "S",
            function() require("flash").treesitter() end,
            mode = { "n", "x", "o" },
            desc = "Flash Treesitter"
        },
        {
            "r",
            function() require("flash").remote() end,
            mode = { "o", "x" },
            desc = "Remote Flash"
        },
        {
            "R",
            function() require("flash").treesitter_search() end,
            mode = "o",
            desc = "Treesitter Search"
        },
    },
}
