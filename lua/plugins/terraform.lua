return {
  -- Terraform syntax highlighting and formatting
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "terraform-vars", "hcl" },
    init = function()
      -- Format terraform files on save
      vim.g.terraform_fmt_on_save = 1
      -- Align terraform settings automatically with the HCL formatter
      vim.g.terraform_align = 1
      -- Allow vim-terraform to override the indent if you want
      vim.g.terraform_fold_sections = 0
      -- Enable syntax highlighting features
      vim.g.terraform_syntax_override = 1
    end,
    config = function()
      -- Additional terraform-specific settings
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "terraform", "terraform-vars" },
        callback = function()
          -- Set indentation for terraform files
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.expandtab = true
          
          -- Enable folding
          vim.opt_local.foldmethod = "syntax"
          vim.opt_local.foldlevel = 99
        end,
      })
    end,
  },
  -- Terraform documentation helper (optional)
  {
    "juliosueiras/vim-terraform-completion",
    ft = { "terraform", "terraform-vars" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
}
