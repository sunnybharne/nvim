local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn

-- Azure Pipelines PowerShell task snippet
ls.add_snippets('yaml', {
  s("powershell-task", {
    t({"  - task: AzurePowerShell@5"}),
    t({"", "    inputs:"}),
    t({"", "      azureSubscription: 'serviceconnection'"}),
    t({"", "      azurePowerShellVersion: 'LatestVersion'"}),
    t({"", "      ScriptType: 'InlineScript'"}),
    t({"", "      Inline: |"}),
    t({"", "        Write-Host 'Hello from Azure PowerShell'"}),
    t({"", "      errorActionPreference: 'stop'"}),
    t({"", "      FailOnStandardError: false"}),
    t({"", "      pwsh: true"}),
    t({"", "      displayName: 'PowerShell Task'"}),
    t({""}),
    i(0, ""), -- Final insert node
  }),
})
