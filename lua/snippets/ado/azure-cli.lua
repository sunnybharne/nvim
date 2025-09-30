local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines Azure CLI task snippet
ls.add_snippets('yaml', {
  s("azure-cli-task", {
    t({"  - task: AzureCLI@2"}),
    t({"", "    inputs:"}),
    t({"", "      azureSubscription: 'serviceconnection'"}),
    t({"", "      scriptType: 'bash'"}),
    t({"", "      scriptLocation: 'inlineScript'"}),
    t({"", "      inlineScript: |"}),
    t({"", "        echo 'Hello from Azure CLI'"}),
    t({"", "        az --version"}),
    t({"", "      displayName: 'Azure CLI Task'"}),
    t({""}),
    i(0, ""), -- Final insert node
  }),
})
