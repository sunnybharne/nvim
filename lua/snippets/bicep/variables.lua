local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Bicep Variables and Parameters Snippets
-- Contains snippets for parameters, variables, and arrays

ls.add_snippets('bicep', {
  -- ===== PARAMETERS =====
  -- String Parameter
  -- @description('param description')
  -- param paramName string = 'default-value'
  s("param : string", {
    t({"@description('"}), i(1, "param_description"), t({"')"}),
    t({"", "param "}), i(2, "paramName"), t({" string = '"}), i(3, "default-value"), t({"'"}),
  }),

  -- Array Parameter
  -- @description('param_description')
  -- param myArray array = [
  --   1
  --   'string'
  --   {objectkey: 'objectValue'}
  -- ]
  s("param : array", {
    t({"@description('"}), i(1, "param_description"), t({"')"}),
    t({"", "param "}), i(2, "myArray"), t({" array = ["}),
    t({"", "  "}), i(3, "1"),
    t({"", "  '"}), i(4, "string"), t({"'"}),
    t({"", "  {"}), i(5, "objectkey"), t({": '"}), i(6, "objectValue"), t({"'}"}),
    t({"", "]"}),
  }),

  -- Object Parameter
  -- @description('This parameter accepts object data for resource configuration.')
  -- param myObject object = {
  --   name: 'example'
  --   location: 'eastus'
  -- }
  s("param : object", {
    t({"@description('"}), i(1, "This parameter accepts object data for resource configuration."), t({"')"}),
    t({"", "param "}), i(2, "myObject"), t({" object = {"}),
    t({"", "  "}), i(3, "name"), t({": '"}), i(4, "example"), t({"'"}),
    t({"", "  "}), i(5, "location"), t({": '"}), i(6, "eastus"), t({"'"}),
    t({"", "}"}),
  }),

  -- ===== VARIABLES =====
  -- String Variable
  -- @description('var description')
  -- var varName = 'value'
  s("var : variable", {
    t({"@description('"}), i(1, "var_description"), t({"')"}),
    t({"", "var "}), i(2, "varName"), t({" = '"}), i(3, "value"), t({"'"}),
  }),

  -- Array Variable
  -- @description('var_description')
  -- var myArray = [
  --   1
  --   'string'
  --   {objectkey: 'objectValue'}
  -- ]
  s("var : array", {
    t({"@description('"}), i(1, "var_description"), t({"')"}),
    t({"", "var "}), i(2, "myArray"), t({" = ["}),
    t({"", "  "}), i(3, "1"),
    t({"", "  '"}), i(4, "string"), t({"'"}),
    t({"", "  {"}), i(5, "objectkey"), t({": '"}), i(6, "objectValue"), t({"'}"}),
    t({"", "]"}),
  }),

  -- Object Variable
  -- @description('This variable holds object data for a resource.')
  -- var myObject = {
  --   name: 'example'
  --   location: 'eastus'
  --   tags: {
  --     environment: 'dev'
  --     owner: 'teamA'
  --   }
  -- }
  s("var : object", {
    t({"@description('"}), i(1, "This variable holds object data for a resource."), t({"')"}),
    t({"", "var "}), i(2, "myObject"), t({" = {"}),
    t({"", "  "}), i(3, "name"), t({": '"}), i(4, "example"), t({"'"}),
    t({"", "  "}), i(5, "location"), t({": '"}), i(6, "eastus"), t({"'"}),
    t({"", "  "}), i(7, "tags"), t({": {"}),
    t({"", "    "}), i(8, "environment"), t({": '"}), i(9, "dev"), t({"'"}),
    t({"", "    "}), i(10, "owner"), t({": '"}), i(11, "teamA"), t({"'"}),
    t({"", "  }"}),
    t({"", "}"}),
  }),
})
