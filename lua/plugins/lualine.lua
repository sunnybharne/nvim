return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional icons
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",  -- Match your theme (Change if needed)
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,  -- One statusline for all windows
        },
        sections = {
          lualine_a = { "mode" }, -- NORMAL, INSERT, etc.
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } }, -- Show full file path
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" }, -- Show % progress
          lualine_z = { "location" } -- Line:Column
        },
      })
    end
}
