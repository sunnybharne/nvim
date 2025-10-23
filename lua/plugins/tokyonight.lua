return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- TokyoNight configuration options
        style = "storm", -- The theme comes in different styles: storm, night, moon, day
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            -- Style to be applied to different syntax groups
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
        },
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
        
        -- Customize specific highlight groups
        on_highlights = function(hl, c)
            -- Improve visual selection visibility with Deep Pink
            hl.Visual = {
                bg = "#FF1493", -- Deep Pink background
                fg = "#ffffff", -- White text
                bold = true,
            }
            -- Also improve visual mode cursor line
            hl.CursorLineNr = {
                fg = c.orange,
                bold = true,
            }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight-night")
    end,
}
