return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle horizontal terminal" })
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle vertical terminal" })
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
    vim.keymap.set("n", "<leader>tq", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle all terminals" })

    -- Terminal mode keymaps
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], { desc = "Move to left window" })
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], { desc = "Move to down window" })
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], { desc = "Move to up window" })
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], { desc = "Move to right window" })
  end,
}
