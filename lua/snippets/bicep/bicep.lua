local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Bicep snippets - consistent with Terraform and CDKTF keywords
ls.add_snippets('bicep', {
  -- Basic Structure
  s("param", {
    t({"", "@description('Example parameter')"}),
    t({"", "param example string = 'default-value'"})
  }),

  s("var", {
    t({"", "var example = 'example-value'"})
  }),

  s("output", {
    t({"", "@description('Example output')"}),
    t({"", "output example string = resourceGroup.name"})
  }),

  s("module", {
    t({"", "module example 'path/to/module.bicep' = {"}),
    t({"", "  name: 'example-module'"}),
    t({"", "  params: {"}),
    t({"", "    inputParam: 'value'"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Azure Resources - using same keywords as Terraform/CDKTF
  s("rg", {
    t({"", "resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {"}),
    t({"", "  name: 'example-rg'"}),
    t({"", "  location: 'East US'"}),
    t({"", "  tags: {"}),
    t({"", "    Environment: 'dev'"}),
    t({"", "    Project: 'example'"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("vnet", {
    t({"", "resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-05-01' = {"}),
    t({"", "  name: 'example-vnet'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    addressSpace: {"}),
    t({"", "      addressPrefixes: ["}),
    t({"", "        '10.0.0.0/16'"}),
    t({"", "      ]"}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("subnet", {
    t({"", "resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {"}),
    t({"", "  parent: virtualNetwork"}),
    t({"", "  name: 'example-subnet'"}),
    t({"", "  properties: {"}),
    t({"", "    addressPrefix: '10.0.1.0/24'"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("nsg", {
    t({"", "resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {"}),
    t({"", "  name: 'example-nsg'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    securityRules: ["}),
    t({"", "      {"}),
    t({"", "        name: 'AllowHTTP'"}),
    t({"", "        properties: {"}),
    t({"", "          priority: 1000"}),
    t({"", "          access: 'Allow'"}),
    t({"", "          direction: 'Inbound'"}),
    t({"", "          destinationPortRange: '80'"}),
    t({"", "          protocol: 'Tcp'"}),
    t({"", "          sourceAddressPrefix: '*'"}),
    t({"", "        }"}),
    t({"", "      }"}),
    t({"", "    ]"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("pip", {
    t({"", "resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {"}),
    t({"", "  name: 'example-pip'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  sku: {"}),
    t({"", "    name: 'Basic'"}),
    t({"", "    tier: 'Regional'"}),
    t({"", "  }"}),
    t({"", "  properties: {"}),
    t({"", "    publicIPAllocationMethod: 'Dynamic'"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("nic", {
    t({"", "resource networkInterface 'Microsoft.Network/networkInterfaces@2021-05-01' = {"}),
    t({"", "  name: 'example-nic'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    ipConfigurations: ["}),
    t({"", "      {"}),
    t({"", "        name: 'ipconfig1'"}),
    t({"", "        properties: {"}),
    t({"", "          privateIPAllocationMethod: 'Dynamic'"}),
    t({"", "          subnet: {"}),
    t({"", "            id: subnet.id"}),
    t({"", "          }"}),
    t({"", "          publicIPAddress: {"}),
    t({"", "            id: publicIP.id"}),
    t({"", "          }"}),
    t({"", "        }"}),
    t({"", "      }"}),
    t({"", "    ]"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("vm", {
    t({"", "resource virtualMachine 'Microsoft.Compute/virtualMachines@2021-11-01' = {"}),
    t({"", "  name: 'example-vm'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    hardwareProfile: {"}),
    t({"", "      vmSize: 'Standard_B1s'"}),
    t({"", "    }"}),
    t({"", "    osProfile: {"}),
    t({"", "      computerName: 'example-vm'"}),
    t({"", "      adminUsername: 'adminuser'"}),
    t({"", "      adminPassword: 'AdminPassword123!'"}),
    t({"", "    }"}),
    t({"", "    storageProfile: {"}),
    t({"", "      imageReference: {"}),
    t({"", "        publisher: 'Canonical'"}),
    t({"", "        offer: '0001-com-ubuntu-server-jammy'"}),
    t({"", "        sku: '22_04-lts'"}),
    t({"", "        version: 'latest'"}),
    t({"", "      }"}),
    t({"", "      osDisk: {"}),
    t({"", "        name: 'example-osdisk'"}),
    t({"", "        createOption: 'FromImage'"}),
    t({"", "        diskSizeGB: 30"}),
    t({"", "      }"}),
    t({"", "    }"}),
    t({"", "    networkProfile: {"}),
    t({"", "      networkInterfaces: ["}),
    t({"", "        {"}),
    t({"", "          id: networkInterface.id"}),
    t({"", "        }"}),
    t({"", "      ]"}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("sa", {
    t({"", "resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {"}),
    t({"", "  name: 'examplestorage'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  sku: {"}),
    t({"", "    name: 'Standard_LRS'"}),
    t({"", "  }"}),
    t({"", "  kind: 'StorageV2'"}),
    t({"", "  properties: {"}),
    t({"", "    accessTier: 'Hot'"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("kv", {
    t({"", "resource keyVault 'Microsoft.KeyVault/vaults@2021-10-01' = {"}),
    t({"", "  name: 'example-kv'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    sku: {"}),
    t({"", "      family: 'A'"}),
    t({"", "      name: 'standard'"}),
    t({"", "    }"}),
    t({"", "    tenantId: subscription().tenantId"}),
    t({"", "    accessPolicies: ["}),
    t({"", "      {"}),
    t({"", "        tenantId: subscription().tenantId"}),
    t({"", "        objectId: 'object-id-here'"}),
    t({"", "        permissions: {"}),
    t({"", "          keys: ['all']"}),
    t({"", "          secrets: ['all']"}),
    t({"", "        }"}),
    t({"", "      }"}),
    t({"", "    ]"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("asp", {
    t({"", "resource appServicePlan 'Microsoft.Web/serverfarms@2021-03-01' = {"}),
    t({"", "  name: 'example-asp'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  sku: {"}),
    t({"", "    name: 'F1'"}),
    t({"", "    tier: 'Free'"}),
    t({"", "  }"}),
    t({"", "  properties: {"}),
    t({"", "    reserved: true"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("app", {
    t({"", "resource webApp 'Microsoft.Web/sites@2021-03-01' = {"}),
    t({"", "  name: 'example-app'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    serverFarmId: appServicePlan.id"}),
    t({"", "    siteConfig: {"}),
    t({"", "      linuxFxVersion: 'NODE|14-lts'"}),
    t({"", "    }"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Data Sources
  s("data-client", {
    t({"", "var clientConfig = getClientConfig()"})
  }),

  s("data-az", {
    t({"", "var availabilityZones = ["}),
    t({"", "  '1'"}),
    t({"", "  '2'"}),
    t({"", "  '3'"}),
    t({"", "]"})
  }),

  -- Common Patterns
  s("conditional", {
    t({"", "resource example 'Microsoft.Example/resource@2021-01-01' = if (condition) {"}),
    t({"", "  name: 'example'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    // properties here"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  s("foreach", {
    t({"", "var items = ["}),
    t({"", "  'item1'"}),
    t({"", "  'item2'"}),
    t({"", "  'item3'"}),
    t({"", "]"}),
    t({"",""}),
    t({"", "resource resources 'Microsoft.Example/resource@2021-01-01' = [for item in items: {"}),
    t({"", "  name: 'example-${item}'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  properties: {"}),
    t({"", "    // properties here"}),
    t({"", "  }"}),
    t({"", "}]"})
  }),

  s("depends", {
    t({"", "resource dependent 'Microsoft.Example/resource@2021-01-01' = {"}),
    t({"", "  name: 'dependent'"}),
    t({"", "  location: resourceGroup.location"}),
    t({"", "  dependsOn: ["}),
    t({"", "    resourceGroup"}),
    t({"", "  ]"}),
    t({"", "  properties: {"}),
    t({"", "    // properties here"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Functions
  s("concat", {
    t({"", "var concatenated = concat('prefix-', resourceGroup.name, '-suffix')"})
  }),

  s("format", {
    t({"", "var formatted = format('{0}-{1}', resourceGroup.name, 'suffix')"})
  }),

  s("resourceid", {
    t({"", "var resourceId = resourceId('Microsoft.Storage/storageAccounts', 'examplestorage')"})
  }),

  s("reference", {
    t({"", "var referenced = reference(resourceGroup.id)"})
  })
})
