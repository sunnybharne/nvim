-- Add custom filetype detection rules in Neovim

-- Define filetypes based on file extensions
vim.filetype.add({
  extension = {
    tf = "terraform", -- Files with .tf extension are recognized as Terraform
    tfvars = "terraform", -- Files with .tfvars extension are also recognized as Terraform
    bicep = "bicep", -- Files with .bicep extension are recognized as Bicep
  }
})

-- Define filetypes based on filenames and patterns
vim.filetype.add({
  filename = {
    ["Dockerfile"] = "dockerfile", -- Files named 'Dockerfile' are recognized as Dockerfile
  },
  pattern = {
    ["Dockerfile%..*"] = "dockerfile", -- Files matching 'Dockerfile.<something>' are recognized as Dockerfile
  },
})

-- Set comment configuration for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "bicep",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})
