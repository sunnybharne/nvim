local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- CDKTF TypeScript snippets
ls.add_snippets('typescript', {
  -- Basic CDKTF imports
  s("cdktf-imports", {
    t({"import { Construct } from \"constructs\";",""}),
    t({"import { App, TerraformStack, TerraformOutput } from \"cdktf\";",""}),
    t({"import { AwsProvider } from \"./providers/aws\";",""}),
    t({"import { AzurermProvider } from \"./providers/azurerm\";",""}),
    t({""})
  }),

  -- Main stack class
  s("cdktf-stack", {
    t({"export class MyStack extends TerraformStack {",""}),
    t({"  constructor(scope: Construct, id: string) {",""}),
    t({"    super(scope, id);",""}),
    t({"",""}),
    t({"    // Define resources here",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- App and stack instantiation
  s("cdktf-app", {
    t({"const app = new App();",""}),
    t({"new MyStack(app, \"my-stack\");",""}),
    t({"app.synth();",""})
  }),

  -- AWS Provider
  s("aws-provider", {
    t({"new AwsProvider(this, \"aws\", {",""}),
    t({"  region: \"us-east-1\"",""}),
    t({"});",""})
  }),

  -- Azure Provider
  s("azure-provider", {
    t({"new AzurermProvider(this, \"azurerm\", {",""}),
    t({"  features: {}",""}),
    t({"});",""})
  }),

  -- AWS Resources
  s("aws-s3", {
    t({"new S3Bucket(this, \"example-bucket\", {",""}),
    t({"  bucket: \"example-bucket-name\"",""}),
    t({"});",""})
  }),

  s("aws-ec2", {
    t({"new Instance(this, \"example-instance\", {",""}),
    t({"  ami: \"ami-0c02fb55956c7d316\"",""}),
    t({"  instanceType: \"t3.micro\"",""}),
    t({"",""}),
    t({"  tags: {",""}),
    t({"    Name: \"example-instance\"",""}),
    t({"  }",""}),
    t({"});",""})
  }),

  s("aws-vpc", {
    t({"new Vpc(this, \"example-vpc\", {",""}),
    t({"  cidr: \"10.0.0.0/16\"",""}),
    t({"  enableDnsHostnames: true",""}),
    t({"  enableDnsSupport: true",""}),
    t({"",""}),
    t({"  tags: {",""}),
    t({"    Name: \"example-vpc\"",""}),
    t({"  }",""}),
    t({"});",""})
  }),

  s("aws-subnet", {
    t({"new Subnet(this, \"example-subnet\", {",""}),
    t({"  vpcId: vpc.id",""}),
    t({"  cidrBlock: \"10.0.1.0/24\"",""}),
    t({"  availabilityZone: \"us-east-1a\"",""}),
    t({"",""}),
    t({"  tags: {",""}),
    t({"    Name: \"example-subnet\"",""}),
    t({"  }",""}),
    t({"});",""})
  }),

  s("aws-sg", {
    t({"new SecurityGroup(this, \"example-sg\", {",""}),
    t({"  vpcId: vpc.id",""}),
    t({"  name: \"example-security-group\"",""}),
    t({"  description: \"Example security group\"",""}),
    t({"",""}),
    t({"  ingress: [",""}),
    t({"    {",""}),
    t({"      fromPort: 80",""}),
    t({"      toPort: 80",""}),
    t({"      protocol: \"tcp\"",""}),
    t({"      cidrBlocks: [\"0.0.0.0/0\"]",""}),
    t({"    }",""}),
    t({"  ]",""}),
    t({"",""}),
    t({"  egress: [",""}),
    t({"    {",""}),
    t({"      fromPort: 0",""}),
    t({"      toPort: 0",""}),
    t({"      protocol: \"-1\"",""}),
    t({"      cidrBlocks: [\"0.0.0.0/0\"]",""}),
    t({"    }",""}),
    t({"  ]",""}),
    t({"});",""})
  }),

  -- Azure Resources
  s("azure-rg", {
    t({"new ResourceGroup(this, \"example-rg\", {",""}),
    t({"  name: \"example-resource-group\"",""}),
    t({"  location: \"East US\"",""}),
    t({"});",""})
  }),

  s("azure-vnet", {
    t({"new VirtualNetwork(this, \"example-vnet\", {",""}),
    t({"  name: \"example-vnet\"",""}),
    t({"  addressSpace: [\"10.0.0.0/16\"]",""}),
    t({"  location: \"East US\"",""}),
    t({"  resourceGroupName: resourceGroup.name",""}),
    t({"});",""})
  }),

  s("azure-subnet", {
    t({"new Subnet(this, \"example-subnet\", {",""}),
    t({"  name: \"example-subnet\"",""}),
    t({"  resourceGroupName: resourceGroup.name",""}),
    t({"  virtualNetworkName: virtualNetwork.name",""}),
    t({"  addressPrefixes: [\"10.0.1.0/24\"]",""}),
    t({"});",""})
  }),

  s("azure-vm", {
    t({"new LinuxVirtualMachine(this, \"example-vm\", {",""}),
    t({"  name: \"example-vm\"",""}),
    t({"  resourceGroupName: resourceGroup.name",""}),
    t({"  location: \"East US\"",""}),
    t({"  size: \"Standard_B1s\"",""}),
    t({"  adminUsername: \"adminuser\"",""}),
    t({"",""}),
    t({"  adminSshKey: {",""}),
    t({"    username: \"adminuser\"",""}),
    t({"    publicKey: \"ssh-rsa AAAAB3NzaC1yc2E...\"",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  networkInterfaceIds: [networkInterface.id]",""}),
    t({"",""}),
    t({"  osDisk: {",""}),
    t({"    caching: \"ReadWrite\"",""}),
    t({"    storageAccountType: \"Standard_LRS\"",""}),
    t({"  }",""}),
    t({"",""}),
    t({"  sourceImageReference: {",""}),
    t({"    publisher: \"Canonical\"",""}),
    t({"    offer: \"0001-com-ubuntu-server-jammy\"",""}),
    t({"    sku: \"22_04-lts\"",""}),
    t({"    version: \"latest\"",""}),
    t({"  }",""}),
    t({"});",""})
  }),

  s("azure-sa", {
    t({"new StorageAccount(this, \"example-sa\", {",""}),
    t({"  name: \"examplestorage\"",""}),
    t({"  resourceGroupName: resourceGroup.name",""}),
    t({"  location: \"East US\"",""}),
    t({"  accountTier: \"Standard\"",""}),
    t({"  accountReplicationType: \"LRS\"",""}),
    t({"});",""})
  }),

  -- Data Sources
  s("data-aws-ami", {
    t({"const ami = new DataAwsAmi(this, \"example-ami\", {",""}),
    t({"  mostRecent: true",""}),
    t({"  owners: [\"amazon\"]",""}),
    t({"",""}),
    t({"  filter: [",""}),
    t({"    {",""}),
    t({"      name: \"name\"",""}),
    t({"      values: [\"amzn2-ami-hvm-*-x86_64-gp2\"]",""}),
    t({"    }",""}),
    t({"  ]",""}),
    t({"});",""})
  }),

  s("data-azure-client", {
    t({"const client = new DataAzurermClientConfig(this, \"current\");",""})
  }),

  -- Outputs
  s("cdktf-output", {
    t({"new TerraformOutput(this, \"example-output\", {",""}),
    t({"  value: resource.property",""}),
    t({"  description: \"Example output value\"",""}),
    t({"});",""})
  }),

  -- Variables
  s("cdktf-var", {
    t({"const exampleVar = new TerraformVariable(this, \"example\", {",""}),
    t({"  type: \"string\"",""}),
    t({"  description: \"Example variable\"",""}),
    t({"  default: \"default-value\"",""}),
    t({"});",""})
  }),

  -- Local values
  s("cdktf-local", {
    t({"const commonTags = {",""}),
    t({"  Environment: \"dev\"",""}),
    t({"  Project: \"example\"",""}),
    t({"};",""})
  }),

  -- Modules
  s("cdktf-module", {
    t({"new TerraformModule(this, \"example-module\", {",""}),
    t({"  source: \"./modules/example\"",""}),
    t({"  version: \"1.0.0\"",""}),
    t({"",""}),
    t({"  variables: {",""}),
    t({"    input_var: \"value\"",""}),
    t({"  }",""}),
    t({"});",""})
  }),

  -- Constructs
  s("cdktf-construct", {
    t({"export class ExampleConstruct extends Construct {",""}),
    t({"  constructor(scope: Construct, id: string) {",""}),
    t({"    super(scope, id);",""}),
    t({"",""}),
    t({"    // Define resources here",""}),
    t({"  }",""}),
    t({"}",""})
  }),

  -- Testing
  s("cdktf-test", {
    t({"import { Testing } from \"cdktf\";",""}),
    t({"import { MyStack } from \"./main\";",""}),
    t({"",""}),
    t({"describe(\"My CDKTF Application\", () => {",""}),
    t({"  it(\"should synthesize without error\", () => {",""}),
    t({"    const app = Testing.app();",""}),
    t({"    const stack = new MyStack(app, \"test\");",""}),
    t({"    expect(Testing.synth(stack)).toMatchSnapshot();",""}),
    t({"  });",""}),
    t({"});",""})
  }),

  -- CDKTF Commands
  s("cdktf-init", {
    t({"cdktf init --template=typescript --local",""})
  }),

  s("cdktf-deploy", {
    t({"cdktf deploy",""})
  }),

  s("cdktf-destroy", {
    t({"cdktf destroy",""})
  }),

  s("cdktf-synth", {
    t({"cdktf synth",""})
  })
})
