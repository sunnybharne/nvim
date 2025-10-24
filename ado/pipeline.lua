local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('yaml', {
  s("powershell-task", {
    t({ "  - task: AzurePowerShell@5", "" }),
    t({ "    inputs:", "" }),
    t({ "      azureSubscription: 'serviceconnection'", "" }),
    t({ "      azurePowerShellVersion: 'LatestVersion'", "" }),
    t({ "      ScriptType: # 'FilePath' | 'InlineScript'", "" }),
    t({ "      # ScriptPath: #Use when ScriptType = FilePath.", "" }),
    t({ "      Inline: # when ScriptType = InlineScript", "" }),
    t({ "      ScriptArguments:", "" }),
    t({ "      errorActionPreference: 'stop' # 'stop' | 'continue' | 'silentlyContinue'.", "" }),
    t({ "      FailOnStandardError: false", "" }),
    t({ "      pwsh: true", "" }),
    t({ "      displayName: 'task name'", "" })
  }),
  s("ado-variables", {
    t({ "variables:", "" }),
    t({ "  - name: variableKey", "" }),
    t({ "    value: 'variableValue'", "" })
  })
})
