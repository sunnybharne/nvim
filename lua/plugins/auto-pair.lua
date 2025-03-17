return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",  -- Load only when entering insert mode
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,    -- Enable Treesitter integration
        disable_filetype = { "TelescopePrompt", "vim" }, -- Don't auto-pair in these filetypes
        fast_wrap = {},     -- Enable fast wrapping with `<M-e>` (Alt+e)
      })
    end
  }
}
