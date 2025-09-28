local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Basic Bicep structure snippets
ls.add_snippets('bicep', {
  -- Parameters
  s("param", {
    t({"@description('Example parameter')"}),
    t({"", "param example string = 'default-value'"})
  }),

  -- Variables
  s("var", {
    t({"var example = 'example-value'"})
  }),

  -- Outputs
  s("output", {
    t({"@description('Example output')"}),
    t({"", "output example string = resourceGroup.name"})
  }),

  -- Modules
  s("module", {
    t({"module example 'path/to/module.bicep' = {"}),
    t({"", "  name: 'example-module'"}),
    t({"", "  params: {"}),
    t({"", "    inputParam: 'value'"}),
    t({"", "  }"}),
    t({"", "}"})
  }),

  -- Arrays
  s("array", {
    t({"", "param arrayName array = ["}),
    t({"", "  'value1',"}),
    t({"", "  'value2'"}),
    t({"", "]"})
  }),

  -- For loops
  s("for", {
    t({"", "resource name 'type' = [for item in array : {"}),
    t({"", "  'resource definition'"}),
    t({"", "}]"})
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
  })
})
