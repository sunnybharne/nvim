# Terraform

## Overview
Terraform is an infrastructure as code (IaC) tool that enables you to safely and predictably create, change, and improve infrastructure. This guide covers essential Terraform concepts, best practices, and practical implementations.

## Table of Contents
1. [Basic Concepts](#basic-concepts)
2. [Configuration Syntax](#configuration-syntax)
3. [State Management](#state-management)
4. [Variables and Outputs](#variables-and-outputs)
5. [Modules](#modules)
6. [Workspaces](#workspaces)
7. [Best Practices](#best-practices)
8. [Common Commands](#common-commands)

## Basic Concepts

### Infrastructure as Code
- Declarative configuration language
- Version controlled infrastructure
- Reproducible deployments
- State management

### Provider Types
1. **Official Providers**
   - AWS
   - Azure
   - Google Cloud
   - Kubernetes

2. **Community Providers**
   - Custom implementations
   - Third-party services
   - Specialized resources

## Configuration Syntax

### Basic Structure
```hcl
# Provider configuration
provider "aws" {
  region = "us-west-2"
}

# Resource definition
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
```

### Resource Dependencies
```hcl
# Implicit dependencies
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  instance = aws_instance.web.id
}

# Explicit dependencies
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  depends_on = [aws_s3_bucket.example]
}
```

## State Management

### State File
- Tracks current state of infrastructure
- Maps real-world resources to configuration
- Stores metadata and dependencies
- Enables state locking for team collaboration

### State Operations
```bash
# Initialize Terraform
terraform init

# Show current state
terraform show

# Refresh state
terraform refresh

# Import existing resources
terraform import aws_instance.example i-1234567890abcdef0
```

## Variables and Outputs

### Variable Types
```hcl
# String variables
variable "environment" {
  type        = string
  description = "Environment name"
  default     = "development"
}

# Number variables
variable "instance_count" {
  type        = number
  description = "Number of instances"
  default     = 1
}

# List variables
variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-west-2a", "us-west-2b"]
}

# Map variables
variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {
    Environment = "development"
    Project     = "example"
  }
}
```

### Outputs
```hcl
output "instance_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.example.public_ip
}

output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.example.id
}
```

## Modules

### Module Structure
```
module/
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

### Module Usage
```hcl
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr     = "10.0.0.0/16"
  environment  = var.environment
  project_name = var.project_name
}
```

## Workspaces

### Workspace Management
```bash
# List workspaces
terraform workspace list

# Create new workspace
terraform workspace new development

# Select workspace
terraform workspace select production

# Show current workspace
terraform workspace show
```

### Workspace-Specific Variables
```hcl
# terraform.tfvars
environment = "development"
instance_type = "t2.micro"

# terraform.tfvars.production
environment = "production"
instance_type = "t2.large"
```

## Best Practices

### Code Organization
1. Use consistent naming conventions
2. Implement proper file structure
3. Document all variables and outputs
4. Use version constraints

### Security
1. Secure state file storage
2. Implement state locking
3. Use encryption for sensitive data
4. Follow principle of least privilege

### Performance
1. Optimize resource dependencies
2. Use data sources effectively
3. Implement proper state management
4. Optimize module structure

## Common Commands

### Basic Operations
```bash
# Initialize
terraform init

# Plan changes
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure
terraform destroy
```

### State Operations
```bash
# Show state
terraform show

# Refresh state
terraform refresh

# Import resources
terraform import

# Move resources
terraform state mv
```

### Workspace Operations
```bash
# List workspaces
terraform workspace list

# Create workspace
terraform workspace new

# Select workspace
terraform workspace select

# Show current workspace
terraform workspace show
```

## Resources
- [Terraform Official Documentation](https://www.terraform.io/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/) 
