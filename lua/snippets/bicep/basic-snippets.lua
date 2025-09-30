local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn
local generate_resource_name = utils.generate_resource_name
local generate_param_description = utils.generate_param_description

-- Basic Bicep structure snippets
ls.add_snippets('bicep', {
  -- Parameters
  s("param", {
    t({"@description('")}), f(generate_param_description, {1}),
    t({"'"}),
    t({"", "param "}), i(1, "parameterName"), t({" string = "}), i(2, "'default-value'"),
    t({"", ""}),
    i(0, ""), -- Final insert node
  }),

  -- Variables
  s("var", {
    t({"var "}), i(1, "variableName"), t({" = "}), i(2, "'example-value'"),
    t({"", ""}),
    i(0, ""), -- Final insert node
  }),

  -- Outputs
  s("output", {
    t({"@description('")}), f(generate_param_description, {1}),
    t({"'"}),
    t({"", "output "}), i(1, "outputName"), t({" string = "}), i(2, "resourceGroup.name"),
    t({"", ""}),
    i(0, ""), -- Final insert node
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
