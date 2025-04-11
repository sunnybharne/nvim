local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Snippet for defining an Azure PowerShell task in YAML
--[[  --------------------------------------------------------------------------------
- task: AzurePowerShell@5
  inputs:
    azureSubscription: 'serviceconnection'
    azurePowerShellVersion: 'LatestVersion'
    ScriptType: # 'FilePath' | 'InlineScript'
    # ScriptPath: #Use when ScriptType = FilePath.
    Inline: # when ScriptType = InlineScript
    ScriptArguments:
    errorActionPreference: 'stop' # 'stop' | 'continue' | 'silentlyContinue'.
    FailOnStandardError: false
    pwsh: false
--]]
ls.add_snippets('yaml', {
  s("powershell-task", {
    t({"  - task: AzurePowerShell@5", ""}),
    t({"    inputs:", ""}),
    t({"      azureSubscription: 'serviceconnection'", ""}),
    t({"      azurePowerShellVersion: 'LatestVersion'", ""}),
    t({"      ScriptType: # 'FilePath' | 'InlineScript'", ""}),
    t({"      # ScriptPath: #Use when ScriptType = FilePath.", ""}),
    t({"      Inline: # when ScriptType = InlineScript", ""}),
    t({"      ScriptArguments:", ""}),
    t({"      errorActionPreference: 'stop' # 'stop' | 'continue' | 'silentlyContinue'.", ""}),
    t({"      FailOnStandardError: false", ""}),
    t({"      pwsh: true", ""}),
    t({"      displayName: 'task name'", ""})
  })
})
