return {
  'https://codeberg.org/esensar/nvim-dev-container',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'akinsho/toggleterm.nvim',
  },
  config = function()
    require("devcontainer").setup{}

    -- Keybinding to open a floating terminal attached to the dev container
    -- vim.api.nvim_set_keymap('n', '<leader>dp', ':lua OpenDevContainerTerminal()<CR>', { noremap = true, silent = true })

    -- Function to open a floating terminal
    function OpenDevContainerTerminal()
      local Terminal = require('toggleterm.terminal').Terminal
      local devcontainer_terminal = Terminal:new({
        cmd = "DevcontainerAttach bash",
        direction = "float",
        float_opts = {
          border = "curved",
        },
        close_on_exit = true,
      })
      devcontainer_terminal:toggle()
    end
  end
}
