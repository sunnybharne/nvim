local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- CDKTF Basic structure snippets
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
    t({"", "export class MyStack extends TerraformStack {"}),
    t({"", "  constructor(scope: Construct, id: string) {"}),
    t({"", "    super(scope, id);"}),
    t({"",""}),
    t({"", "    // Define resources here"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- App and stack instantiation
  s("cdktf-app", {
    t({"", "const app = new App();"}),
    t({"new MyStack(app, \"my-stack\");",""}),
    t({"", "app.synth();"})
  }),

  -- Providers
  s("aws-provider", {
    t({"new AwsProvider(this, \"aws\", {",""}),
    t({"  region: \"us-east-1\"",""}),
    t({"", "});"})
  }),

  s("azure-provider", {
    t({"new AzurermProvider(this, \"azurerm\", {",""}),
    t({"", "  features: {}"}),
    t({"", "});"})
  }),

  -- Variables
  s("cdktf-var", {
    t({"const exampleVar = new TerraformVariable(this, \"example\", {",""}),
    t({"  type: \"string\"",""}),
    t({"  description: \"Example variable\"",""}),
    t({"  default: \"default-value\"",""}),
    t({"", "});"})
  }),

  -- Outputs
  s("cdktf-output", {
    t({"new TerraformOutput(this, \"example-output\", {",""}),
    t({"", "  value: resource.property"}),
    t({"  description: \"Example output value\"",""}),
    t({"", "});"})
  }),

  -- Local values
  s("cdktf-local", {
    t({"", "const commonTags = {"}),
    t({"  Environment: \"dev\"",""}),
    t({"  Project: \"example\"",""}),
    t({"", "};"})
  }),

  -- Modules
  s("cdktf-module", {
    t({"new TerraformModule(this, \"example-module\", {",""}),
    t({"  source: \"./modules/example\"",""}),
    t({"  version: \"1.0.0\"",""}),
    t({"",""}),
    t({"", "  variables: {"}),
    t({"    input_var: \"value\"",""}),
    t({"", "  }"}),
    t({"", "});"})
  }),

  -- Constructs
  s("cdktf-construct", {
    t({"", "export class ExampleConstruct extends Construct {"}),
    t({"", "  constructor(scope: Construct, id: string) {"}),
    t({"", "    super(scope, id);"}),
    t({"",""}),
    t({"", "    // Define resources here"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Testing
  s("cdktf-test", {
    t({"import { Testing } from \"cdktf\";",""}),
    t({"import { MyStack } from \"./main\";",""}),
    t({"",""}),
    t({"describe(\"My CDKTF Application\", () => {",""}),
    t({"  it(\"should synthesize without error\", () => {",""}),
    t({"", "    const app = Testing.app();"}),
    t({"    const stack = new MyStack(app, \"test\");",""}),
    t({"", "    expect(Testing.synth(stack)).toMatchSnapshot();"}),
    t({"", "  });"}),
    t({"", "});"})
  })
})
