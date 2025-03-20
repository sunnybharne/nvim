-- List of Treesitter language parsers to be installed
local treesitter_languages = {
  "lua",
  "python",
  "typescript",
  "java",
  "terraform",
  "hcl",
  "bicep",
  "bash",
  "css",
  "csv",
  "dockerfile",
  "diff",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "groovy",
  "go",
  "helm",
  "html",
  "http",
  "ini",
  "javascript",
  "json",
  "jsonc",
  "kotlin",
  "luadoc",
  "markdown",
  "markdown_inline",
  "mermaid",
  "nginx",
  "powershell",
  "properties",
  "puppet",
  "regex",
  "robot",
  "scss",
  "sql",
  "ssh_config",
  "tmux",
  "toml",
  "tsv",
  "tsx",
  "xml",
  "yaml",
}

-- Treesitter plugin configuration
return {
  "nvim-treesitter/nvim-treesitter",
  -- Command to run after installation to update parsers
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Ensure the specified language parsers are installed
      ensure_installed = treesitter_languages,
      -- Enable syntax highlighting
      highlight = { enable = true },
      -- Enable indentation based on Treesitter
      indent = { enable = true },
      -- Enable incremental selection
      incremental_selection = { enable = true },
    })
  end,
}
