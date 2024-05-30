return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup{
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      autochdir = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end
      },
    }
  end
}
