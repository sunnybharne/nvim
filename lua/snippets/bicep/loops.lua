local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Bicep Loop Snippets
-- Contains snippets for all Bicep loop patterns

-- Integer index loop
-- [for <index> in range(<startIndex>, <numberOfElements>): {
--   // loop body
-- }]
ls.add_snippets('bicep', {
  s("for : range", {
    t({"["}),
    t({"for "}), i(1, "index"), t({" in range("}), i(2, "0"), t({", "}), i(3, "3"), t({"): {"}),
    t({"", "  "}), i(4, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Array elements loop
  -- [for <item> in <collection>: {
  --   // loop body
  -- }]
  s("for : array", {
    t({"["}),
    t({"for "}), i(1, "item"), t({" in "}), i(2, "collection"), t({": {"}),
    t({"", "  "}), i(3, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Dictionary object loop
  -- [for <item> in items(<object>): {
  --   // loop body
  -- }]
  s("for : items in object", {
    t({"["}),
    t({"for "}), i(1, "item"), t({" in items("}), i(2, "object"), t({"): {"}),
    t({"", "  "}), i(3, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Array with index loop
  -- [for (<item>, <index>) in <collection>: {
  --   // loop body
  -- }]
  s("for : array-index", {
    t({"["}),
    t({"for ("}), i(1, "item"), t({", "}), i(2, "index"), t({") in "}), i(3, "collection"), t({": {"}),
    t({"", "  "}), i(4, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Conditional loop
  -- [for <item> in <collection>: if(<condition>) {
  --   // loop body
  -- }]
  s("for : conditional", {
    t({"["}),
    t({"for "}), i(1, "item"), t({" in "}), i(2, "collection"), t({": if("}), i(3, "condition"), t({") {"}),
    t({"", "  "}), i(4, "// loop body"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Resource loop with integer index
  -- resource <resourceName> 'Microsoft.Provider/type@version' = [for <index> in range(<start>, <count>): {
  --   // resource properties
  -- }]
  s("resource : for-range", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "index"), t({" in range("}), i(3, "0"), t({", "}), i(4, "3"), t({"): {"}),
    t({"", "  "}), i(5, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Resource loop with array
  -- resource <resourceName> 'Microsoft.Provider/type@version' = [for <item> in <collection>: {
  --   // resource properties
  -- }]
  s("resource : for-array", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "item"), t({" in "}), i(3, "collection"), t({": {"}),
    t({"", "  "}), i(4, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Resource loop with items
  -- resource <resourceName> 'Microsoft.Provider/type@version' = [for <item> in items(<object>): {
  --   // resource properties
  -- }]
  s("resource : for-items", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "item"), t({" in items("}), i(3, "object"), t({"): {"}),
    t({"", "  "}), i(4, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Resource loop with array and index
  -- resource <resourceName> 'Microsoft.Provider/type@version' = [for (<item>, <index>) in <collection>: {
  --   // resource properties
  -- }]
  s("resource : for-array-index", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for ("}), i(2, "item"), t({", "}), i(3, "index"), t({") in "}), i(4, "collection"), t({": {"}),
    t({"", "  "}), i(5, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),

  -- Resource loop with conditional
  -- resource <resourceName> 'Microsoft.Provider/type@version' = [for <item> in <collection>: if(<condition>) {
  --   // resource properties
  -- }]
  s("resource : for-conditional", {
    t({"resource "}), i(1, "resourceName"), t({" 'Microsoft.Provider/type@version' = ["}),
    t({"for "}), i(2, "item"), t({" in "}), i(3, "collection"), t({": if("}), i(4, "condition"), t({") {"}),
    t({"", "  "}), i(5, "// resource properties"),
    t({"", "}"}),
    t({"]"}),
  }),
})