# Snippet Reference Guide

## Bicep Snippets

### Azure Pipelines
- `pipeline` - Basic pipeline
- `powershell-task` - PowerShell task
- `azure-cli-task` - Azure CLI task
- `build-task` - Build task
- `test-task` - Test task
- `publish-task` - Publish task
- `publish-artifact` - Publish artifact
- `download-artifact` - Download artifact

### Basic Structure
- `param` - Parameter definition
- `var` - Variable definition  
- `output` - Output definition
- `module` - Module reference
- `array` - Array parameter
- `for` - For loop
- `data-client` - Client configuration data source
- `data-az` - Availability zones data source

### Azure Resources
- `rg` - Resource Group
- `vnet` - Virtual Network
- `subnet` - Subnet
- `nsg` - Network Security Group
- `pip` - Public IP
- `nic` - Network Interface
- `vm` - Virtual Machine
- `sa` - Storage Account
- `kv` - Key Vault
- `asp` - App Service Plan
- `app` - Web App

### Management & Governance
- `mg` - Management Group
- `sub` - Subscription Alias

### Advanced Patterns
- `conditional` - Conditional resource
- `foreach` - For each loop
- `depends` - Resource dependencies
- `concat` - String concatenation
- `format` - String formatting
- `resourceid` - Resource ID function
- `reference` - Resource reference

## Terraform Snippets

### Basic Structure
- `terraform` - Terraform configuration block
- `terraform-aws` - AWS provider configuration
- `variables` - Variables block
- `output` - Output block
- `data` - Data source
- `locals` - Local values

### Azure Resources
- `rg` - Resource Group
- `vnet` - Virtual Network
- `subnet` - Subnet
- `nsg` - Network Security Group
- `pip` - Public IP
- `nic` - Network Interface
- `vm` - Virtual Machine
- `sa` - Storage Account
- `kv` - Key Vault
- `asp` - App Service Plan
- `app` - Web App

### AWS Resources
- `vpc` - VPC
- `igw` - Internet Gateway
- `subnet` - Subnet
- `rt` - Route Table
- `sg` - Security Group
- `ec2` - EC2 Instance
- `s3` - S3 Bucket
- `rds` - RDS Database
- `lambda` - Lambda Function
- `cloudfront` - CloudFront Distribution

### Management & Governance
- `mg` - Management Group
- `policy` - Policy definition
- `role` - Role assignment

### Providers
- `provider-azure` - Azure Provider
- `provider-aws` - AWS Provider
- `provider-gcp` - GCP Provider
- `providers` - Multiple providers

### Variables
- `var-string` - String variable
- `var-number` - Number variable
- `var-bool` - Boolean variable
- `var-list` - List variable
- `var-map` - Map variable
- `var-object` - Object variable
- `var-set` - Set variable
- `var-tuple` - Tuple variable
- `var-sensitive` - Sensitive variable
- `var-validation` - Variable with validation
- `vars-common` - Common variables
- `vars-aws` - AWS-specific variables
- `vars-tf` - Terraform-specific variables

### Advanced Patterns
- `module` - Module reference
- `data-client` - Client configuration
- `data-az` - Azure data source
- `data-ami` - AMI data source
- `random-password` - Random password
- `random-id` - Random ID
- `templatefile` - Template file
- `foreach` - For each loop
- `count` - Count meta-argument
- `conditional` - Conditional resource
- `lifecycle` - Lifecycle rules
- `depends` - Dependencies
- `sleep` - Sleep resource
- `null-local` - Null resource with local
- `taint` - Resource taint
- `import` - Resource import
- `workspace` - Workspace configuration
- `remote-state` - Remote state
- `validation` - Input validation
- `sensitive` - Sensitive output
- `output-sensitive` - Sensitive output
- `data-existing` - Existing data source
- `moved` - Moved resource
- `import-block` - Import block

### Settings
- `terraform-settingsandprovider-block-azure` - Terraform settings with Azure provider
- `terraform-settingsa-block-azure` - Terraform settings Azure block

## TypeScript/CDKTF Snippets

### Basic CDKTF Structure
- `cdktf-imports` - CDKTF imports
- `cdktf-stack` - Stack class
- `cdktf-app` - App and stack instantiation
- `cdktf-var` - Variable definition
- `cdktf-output` - Output definition
- `cdktf-local` - Local value
- `cdktf-module` - Module reference
- `cdktf-construct` - Custom construct
- `cdktf-test` - Test structure

### Providers
- `aws-provider` - AWS Provider
- `azure-provider` - Azure Provider

### AWS Resources
- `aws-s3` - S3 Bucket
- `aws-ec2` - EC2 Instance
- `aws-vpc` - VPC
- `aws-subnet` - Subnet
- `aws-sg` - Security Group
- `aws-rds` - RDS Database
- `aws-lambda` - Lambda Function
- `aws-cloudfront` - CloudFront Distribution

### Azure Resources
- `azure-rg` - Resource Group
- `azure-vnet` - Virtual Network
- `azure-subnet` - Subnet
- `azure-vm` - Virtual Machine
- `azure-sa` - Storage Account

### Data Sources
- `data-aws-ami` - AWS AMI data source
- `data-azure-client` - Azure client data source

### CDKTF Commands
- `cdktf-init` - Initialize CDKTF
- `cdktf-deploy` - Deploy stack
- `cdktf-destroy` - Destroy stack
- `cdktf-synth` - Synthesize stack

## Docker Snippets

### Dockerfile
- `dockerfile` - Basic Dockerfile
- `multistage` - Multi-stage build
- `python` - Python Dockerfile
- `nginx` - Nginx Dockerfile
- `ubuntu` - Ubuntu base image
- `alpine` - Alpine base image

### Docker Compose
- `compose` - Basic docker-compose.yml
- `web-stack` - Web application stack
- `dev-env` - Development environment

## CI/CD Snippets


### GitHub Actions
- `workflow` - Basic workflow
- `workflow-multi` - Multi-job workflow
- `workflow-schedule` - Scheduled workflow
- `workflow-env` - Environment workflow
- `workflow-matrix` - Matrix strategy workflow

## PowerShell/Pester Snippets

### Pester Testing
- `describe-pester` - Describe block
- `it-pester` - It block
- `beforeall-pester` - BeforeAll block
- `afterall-pester` - AfterAll block
- `boilerplate-pester` - Test boilerplate

### Azure DevOps
- `powershell-task` - PowerShell task (ADO)

## Usage Tips

1. **Trigger Snippets**: Type the keyword and press Tab to expand
2. **File Type Specific**: Snippets are automatically loaded based on your current file type
3. **Consistent Keywords**: Many keywords are consistent across different file types (e.g., `rg` for Resource Group in both Bicep and Terraform)
4. **Smart Snippets**: Use `<leader>ts` to open smart snippets based on your current file type
5. **Scratchpad**: Use `<leader>sp` to open this reference guide

## Key Mappings

- `<leader>sp` - Open scratchpad (this file)
- `<leader>sn` - Next scratchpad file
- `<space>hh` - Show snippets for current file type
- `<leader>ts` - Show smart snippets
