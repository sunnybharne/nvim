-- ToggleTerm configuration for horizontal terminal
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = false,
      shell = vim.o.shell,
    })

    -- Simple keybinding for horizontal terminal
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle horizontal terminal" })
    
    -- Make Esc exit terminal mode
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
  end,
}
