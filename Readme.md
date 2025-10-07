# Neovim Snippets Collection

Professional snippet collection for developers, featuring curated code snippets for various technologies and frameworks.

## 🚀 Quick Start

This Neovim configuration includes a comprehensive collection of snippets organized into specialized modules for easy maintenance and versioning.

### Prerequisites
- Neovim 0.8+
- LuaSnip plugin
- Node.js (for some snippets)

### Installation
```bash
# Clone the repository
git clone <your-repo-url> ~/.config/nvim

# Install dependencies
cd ~/.config/nvim
./install.sh

# Start Neovim
nvim
```

### Usage
- Use `<Tab>` to expand snippets in supported file types
- Snippets are automatically loaded when Neovim starts
- Customize snippets in `lua/snippets/` directory

## 📚 Module Documentation

Each module has its own documentation located in the module folder:

- **[Bicep Documentation](./lua/snippets/bicep/README.md)** - Azure Bicep snippets
- **[Terraform Documentation](./lua/snippets/terraform/README.md)** - Multi-cloud infrastructure
- **[Docker Documentation](./lua/snippets/docker/README.md)** - Containerization patterns
- **[Azure DevOps Documentation](./lua/snippets/ado/README.md)** - CI/CD pipelines
- **[GitHub Actions Documentation](./lua/snippets/github-actions/README.md)** - Workflow automation
- **[Pester Documentation](./lua/snippets/pester/README.md)** - PowerShell testing
- **[Lua Documentation](./lua/snippets/lua/README.md)** - Lua development
- **[TypeScript Documentation](./lua/snippets/typescript/README.md)** - CDKTF snippets
- **[Azure Documentation](./lua/snippets/azure/README.md)** - Azure integration

## 🛠️ Available Modules

### Infrastructure as Code
- **[Bicep](./lua/snippets/bicep/)** - Azure Bicep snippets for infrastructure as code
- **[Terraform](./lua/snippets/terraform/)** - Terraform snippets for multi-cloud infrastructure
- **[TypeScript CDKTF](./lua/snippets/typescript/)** - TypeScript CDKTF snippets for infrastructure

### CI/CD and DevOps
- **[Azure DevOps](./lua/snippets/ado/)** - Azure DevOps pipeline and artifact snippets
- **[GitHub Actions](./lua/snippets/github-actions/)** - GitHub Actions workflow snippets

### Development Tools
- **[Docker](./lua/snippets/docker/)** - Docker containerization snippets
- **[Pester](./lua/snippets/pester/)** - PowerShell testing snippets
- **[Lua](./lua/snippets/lua/)** - Lua development snippets

### Cloud Services
- **[Azure](./lua/snippets/azure/)** - Azure integration snippets

## 🎯 Key Features

### ✨ Professional Snippets
- **Production-ready** code patterns
- **Best practices** built-in
- **Consistent formatting** across all snippets
- **Comprehensive coverage** of common use cases

### 🔧 Developer Experience
- **Fast expansion** with `<Tab>` key
- **Context-aware** snippet selection
- **Customizable** to fit your workflow
- **Well-documented** with examples

### 📦 Modular Architecture
- **Independent modules** for easy maintenance
- **Semantic versioning** for each module
- **Changelog tracking** for all updates
- **Easy contribution** workflow

## 🚀 Quick Examples

### Bicep Infrastructure
```bicep
// Type 'bicep:resource' and press Tab
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'st${resourceGroup().name}${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
```

### Terraform Resources
```hcl
# Type 'tf:resource' and press Tab
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
```

### Docker Configuration
```dockerfile
# Type 'docker:multi-stage' and press Tab
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

## 🛠️ Customization

### Adding New Snippets
1. Navigate to the appropriate module directory
2. Create or edit `.lua` files
3. Follow the existing snippet authoring style guide
4. Update module documentation
5. Update changelog for the affected module

### Snippet Authoring Style Guide
```lua
-- Follow this pattern for consistent snippets
local snippets = {
  s("trigger", {
    t("expanded content"),
    i(1, "placeholder"),
    t("more content"),
  }, {
    description = "Brief description of what this snippet does",
  }),
}
```

## 📋 Versioning

Each module is versioned independently using semantic versioning (SemVer):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

See individual module changelogs for version history.

## 🤝 Contributing

We welcome contributions! When adding new snippets:

1. **Follow the style guide** - Maintain consistency with existing snippets
2. **Update documentation** - Keep module docs current
3. **Test thoroughly** - Ensure snippets work as expected
4. **Update changelog** - Document your changes
5. **Submit PR** - Use clear commit messages

### Development Setup
```bash
# Fork the repository
# Clone your fork
git clone <your-fork-url>

# Create a feature branch
git checkout -b feature/new-snippets

# Make your changes
# Test your snippets
# Commit and push
git commit -m "feat: add new bicep snippets"
git push origin feature/new-snippets
```

## 📞 Support

- **Documentation**: [Complete docs site](http://localhost:3000)
- **Issues**: [GitHub Issues](https://github.com/yourusername/yourrepo/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/yourrepo/discussions)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **LuaSnip** - The amazing snippet engine
- **Neovim Community** - For the excellent ecosystem
- **Contributors** - Everyone who helps improve these snippets

---

**Happy coding with Neovim Snippets!** 🚀

*Building better developer experiences, one snippet at a time.*