return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- TokyoNight configuration options  
        style = "night", -- The theme comes in different styles: storm, night, moon, day
        transparent = false, -- Disable transparency for better color control
        terminal_colors = false, -- Let terminal handle colors for better consistency
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
            -- More subtle visual selection
            hl.Visual = {
                bg = "#364a82", -- Darker blue background
                fg = "#c0caf5", -- Standard foreground
            }
            -- Tone down cursor line
            hl.CursorLineNr = {
                fg = c.blue,
                bold = false,
            }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        -- Load the theme that matches the style setting
        vim.cmd("colorscheme tokyonight-" .. opts.style)
    end,
}
