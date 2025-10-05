return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "bicep",
          "json",
          "jsonc",
          "markdown",
          "markdown_inline",
          "yaml",
          "toml",
          "dockerfile",
          "bash",
          "powershell",
        },
        
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        
        -- List of parsers to ignore installing
        ignore_install = { "help" },
        
        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          
          -- list of language that will be disabled for highlighting
          disable = { "help" },
          
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          additional_vim_regex_highlighting = { "bicep" },
          
          -- Enable semantic highlighting for Bicep
          semantic_tokens = {
            enable = true,
          },
        },
        
        indent = {
          enable = true,
        },
        
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-backspace>",
          },
        },
        
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  }
}
