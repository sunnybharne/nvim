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
  -- var varName = 'value'
  s("var : variable", {
    t({"var "}), i(1, "varName"), t({" = '"}), i(2, "value"), t({"'"}),
  }),

  -- String Variable (alias)
  -- var varName = 'value'
  s("var : string", {
    t({"var "}), i(1, "varName"), t({" = '"}), i(2, "value"), t({"'"}),
  }),

  -- Array Variable
  -- var myArray = [
  --   1
  --   'string'
  --   {objectkey: 'objectValue'}
  -- ]
  s("var : array", {
    t({"var "}), i(1, "myArray"), t({" = ["}),
    t({"", "  "}), i(2, "1"),
    t({"", "  '"}), i(3, "string"), t({"'"}),
    t({"", "  {"}), i(4, "objectkey"), t({": '"}), i(5, "objectValue"), t({"'}"}),
    t({"", "]"}),
  }),

  -- Object Variable
  -- var myObject = {
  --   name: 'example'
  --   location: 'eastus'
  --   tags: {
  --     environment: 'dev'
  --     owner: 'teamA'
  --   }
  -- }
  s("var : object", {
    t({"var "}), i(1, "myObject"), t({" = {"}),
    t({"", "  "}), i(2, "name"), t({": '"}), i(3, "example"), t({"'"}),
    t({"", "  "}), i(4, "location"), t({": '"}), i(5, "eastus"), t({"'"}),
    t({"", "  "}), i(6, "tags"), t({": {"}),
    t({"", "    "}), i(7, "environment"), t({": '"}), i(8, "dev"), t({"'"}),
    t({"", "    "}), i(9, "owner"), t({": '"}), i(10, "teamA"), t({"'"}),
    t({"", "  }"}),
    t({"", "}"}),
  }),

  -- Number Variable
  -- var myNumber = 1
  s("var : number", {
    t({"var "}), i(1, "myNumber"), t({" = "}), i(2, "1"),
  }),

  -- Boolean Variable
  -- var myFlag = true
  s("var : boolean", {
    t({"var "}), i(1, "myFlag"), t({" = "}), i(2, "true"),
  }),
})
