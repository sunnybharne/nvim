return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Configure Copilot behavior
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_filetypes = {
      markdown = false,
      help = false,
      yaml = true,
      lua = true,
      javascript = true,
      typescript = true,
      python = true,
      terraform = true,
      bicep = true,
      dockerfile = true,
      sh = true,
      bash = true,
      zsh = true,
    }

    -- Accept suggestion with Tab
    vim.keymap.set("i", "<Tab>", "copilot#Accept(\"\")", {
      expr = true,
      replace_keycodes = false,
      desc = "Copilot Accept",
    })

    -- Alternative accept with Ctrl+]
    vim.keymap.set("i", "<C-]>", "copilot#Accept(\"\")", {
      expr = true,
      replace_keycodes = false,
      desc = "Copilot Accept Alternative",
    })

    -- Next/Previous suggestions
    vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", {
      desc = "Copilot Next",
    })
    vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", {
      desc = "Copilot Previous",
    })

    -- Dismiss suggestion
    vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", {
      desc = "Copilot Dismiss",
    })
  end,
}
