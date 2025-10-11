local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

-- Bicep module snippets
ls.add_snippets('bicep', {
  -- Basic module with description
  s("module", fmt([[
@description('{}')
module {} '{}' = {{
  params: {{
    {}
  }}
}}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "someParam: 'someValue'"),
  })),

  -- Module with name parameter
  s("module-name", fmt([[
@description('{}')
module {} '{}' = {{
  name: '{}'
  params: {{
    {}
  }}
}}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "module-deployment-name"),
    i(5, "someParam: 'someValue'"),
  })),

  -- Module with scope
  s("module-scope", fmt([[
@description('{}')
module {} '{}' = {{
  name: '{}'
  scope: {}
  params: {{
    {}
  }}
}}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "module-deployment-name"),
    c(5, { 
      t("resourceGroup()"), 
      t("subscription()"), 
      t("managementGroup()"), 
      t("tenant()") 
    }),
    i(6, "someParam: 'someValue'"),
  })),

  -- Module with dependsOn
  s("module-depends", fmt([[
@description('{}')
module {} '{}' = {{
  name: '{}'
  dependsOn: [
    {}
  ]
  params: {{
    {}
  }}
}}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "module-deployment-name"),
    i(5, "otherResource"),
    i(6, "someParam: 'someValue'"),
  })),

  -- Module with conditional deployment
  s("module-if", fmt([[
@description('{}')
module {} '{}' = if ({}) {{
  name: '{}'
  params: {{
    {}
  }}
}}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "condition"),
    i(5, "module-deployment-name"),
    i(6, "someParam: 'someValue'"),
  })),

  -- Module with for loop
  s("module-for", fmt([[
@description('{}')
module {} '{}' = [for {} in {}: {{
  name: '{}'
  params: {{
    {}
  }}
}}]
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "item"),
    i(5, "array"),
    i(6, "module-deployment-name"),
    i(7, "someParam: item.property"),
  })),

  -- Module with for loop and index
  s("module-for-index", fmt([[
@description('{}')
module {} '{}' = [for (item, index) in {}: {{
  name: '{}'
  params: {{
    {}
  }}
}}]
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "array"),
    i(5, "module-deployment-name"),
    i(6, "someParam: item.property"),
  })),

  -- Module with complex parameters
  s("module-complex", fmt([[
@description('{}')
module {} '{}' = {{
  name: '{}'
  params: {{
    {}: '{}'
    {}: {}
    {}: [
      '{}'
      '{}'
    ]
    {}: {{
      {}: '{}'
      {}: {}
    }}
  }}
}}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "module-deployment-name"),
    i(5, "stringParam"),
    i(6, "stringValue"),
    i(7, "numberParam"),
    i(8, "123"),
    i(9, "arrayParam"),
    i(10, "item1"),
    i(11, "item2"),
    i(12, "objectParam"),
    i(13, "property1"),
    i(14, "value1"),
    i(15, "property2"),
    i(16, "value2"),
  })),

  -- Module with outputs reference
  s("module-output", fmt([[
@description('{}')
module {} '{}' = {{
  name: '{}'
  params: {{
    {}
  }}
}}

var {} = {}.outputs.{}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "module-deployment-name"),
    i(5, "someParam: 'someValue'"),
    i(6, "outputVariable"),
    i(7, "resourceName"),
    i(8, "outputName"),
  })),

  -- Module with tags
  s("module-tags", fmt([[
@description('{}')
module {} '{}' = {{
  name: '{}'
  tags: {{
    Environment: '{}'
    Project: '{}'
    CreatedBy: '{}'
  }}
  params: {{
    {}
  }}
}}
]], {
    i(1, "Module description"),
    i(2, "resourceName"),
    i(3, "modules/resource.bicep"),
    i(4, "module-deployment-name"),
    i(5, "dev"),
    i(6, "projectName"),
    i(7, "Bicep"),
    i(8, "someParam: 'someValue'"),
  })),
})
